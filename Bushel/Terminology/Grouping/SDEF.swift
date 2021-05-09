import SDEFinitely

extension TermDictionary {
    
    /// Loads the scripting definition at `url` into the dictionary.
    ///
    /// `url` must have scheme `file` or `eppc`, and identify one of:
    ///   - A BushelScript file
    ///   - An SDEF file
    ///   - An application bundle that contains one or more of an SDEF,
    ///     a Cocoa Scripting plist pair, or a classic `aete` resource
    ///
    /// - Throws: `SDEFError` if the terms cannot be loaded for any reason.
    public func load(from url: URL) throws {
        if url.pathExtension == "bushel" {
            merge(try parse(from: url).rootTerm.dictionary)
        } else {
            let sdef: Data
            do {
                sdef = try readSDEF(from: url)
            } catch is NoSDEF {
                // That's OK.
                return
            } catch is SDEFError {
                // TODO: Why are errors suppressed here?
                return
            }
            
            var terms = try parse(sdef: sdef)
            
            terms.removeAll { term in
                // Don't import terms that shadow the "set" and "get"
                // builtin special-case commands
                [Commands.get, Commands.set]
                    .map { Term.ID($0) }
                    .contains(term.id)
            }
            
            add(terms)
        }
    }
    
}

/// SDEF data containing the contents of the scripting definition at `url`.
///
/// `url` must have scheme `file` or `eppc`, and identify one of:
///   - An SDEF file
///   - An application bundle that contains one or more of an SDEF,
///     a Cocoa Scripting plist pair, or a classic `aete` resource
///
/// Maintains a cache, so external changes to previously read URLs may be
/// ignored.
///
/// - Throws: `SDEFError` if the data cannot be read for any reason.
public func readSDEF(from url: URL) throws -> Data {
    try withSDEFCache { sdefCache in
        if let sdef = sdefCache[url] {
            return sdef
        }
        
        let sdef = try SDEFinitely.readSDEF(from: url)
        
        sdefCache[url] = sdef
        return sdef
    }
}

private let _sdefCacheAccessQueue = DispatchQueue(label: "SDEF cache access")
private var _sdefCache: [URL : Data] = [:]

private func withSDEFCache<Result>(do action: (inout [URL : Data]) throws -> Result) rethrows -> Result {
    try _sdefCacheAccessQueue.sync {
        try action(&_sdefCache)
    }
}

/// Parses and returns terms from SDEF data `sdef`.
///
/// SDEF data can be obtained from `readSDEF(from:)`.
///
/// - Throws: `SDEFError` if the data cannot be parsed for any reason.
public func parse(sdef: Data) throws -> [Term] {
    let delegate = SetOfTermSDEFParserDelegate()
    try SDEFParser(delegate: delegate).parse(sdef)
    return delegate.terms
}

private class SetOfTermSDEFParserDelegate: SDEFParserDelegate {
    
    var terms: [Term] = []
    
    private func add(_ term: Term) {
        terms.append(term)
    }
    
    func addType(_ term: SDEFinitely.KeywordTerm) {
        add(convertAE4(.type, term))
    }
    func addClass(_ term: SDEFinitely.ClassTerm) {
        add(convertAE4(.type, term))
    }
    func addProperty(_ term: SDEFinitely.KeywordTerm) {
        add(convertAE4(.property, term))
    }
    func addEnumerator(_ term: SDEFinitely.KeywordTerm) {
        add(convertAE4(.constant, term))
    }
    func addCommand(_ term: SDEFinitely.CommandTerm) {
        add(Term(
            .command,
            .ae8(class: term.eventClass, id: term.eventID),
            name: Term.Name(term.name),
            dictionary: TermDictionary(contents: term.parameters.map { convertAE4(.parameter, $0) })
        ))
    }
    
    private func convertAE4(_ role: Term.SyntacticRole, _ term: SDEFinitely.KeywordTermProtocol) -> Term {
        Term(role, .ae4(code: term.code), name: Term.Name(term.name))
    }
    
}
