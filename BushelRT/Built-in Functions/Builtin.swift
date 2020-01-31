import Bushel
import SwiftAutomation

enum Builtin {
    
    static var rt = RTInfo()
    static var stack = ProgramStack(rt)
    
    public typealias RTObjectPointer = UnsafeMutableRawPointer
    public typealias TermPointer = UnsafeMutableRawPointer
    public typealias InfoPointer = UnsafeMutableRawPointer
    
    static func fromOpaque(_ pointer: RTObjectPointer) -> RT_Object {
        return BushelRT.fromOpaque(pointer) as! RT_Object
    }
    static func toOpaque(_ object: RT_Object) -> RTObjectPointer {
        return BushelRT.toOpaque(object)
    }
    
    static func termFromOpaque(_ pointer: TermPointer) -> Bushel.Term {
        return BushelRT.fromOpaque(pointer) as! Bushel.Term
    }
    
    static func typedUIDFromOpaque(_ stringPointer: RTObjectPointer) -> TypedTermUID {
        return TypedTermUID(normalized: (fromOpaque(stringPointer) as! RT_String).value)!
    }
    
    static func infoFromOpaque<Result>(_ pointer: InfoPointer) -> Result {
        return BushelRT.fromOpaque(pointer) as! Result
    }
    
    static func retain<Object: RT_Object>(_ object: Object) -> Object {
        rt.retain(object)
        return object
    }
    
    static func release(_ object: RT_Object) {
        rt.release(object)
    }
    
    static var throwing: Bool = false
    static func throwError(message: String) {
        if !throwing {
            throwing = true
            defer { throwing = false }
            _ = try! RT_Global(rt).perform(command: CommandInfo(.GUI_alert), arguments: [
                ParameterInfo(.GUI_alert_kind): RT_Integer(value: 2),
                ParameterInfo(.direct): RT_String(value: "An error occurred:"),
                ParameterInfo(.GUI_alert_message): RT_String(value: message + "\n\nThe script will be terminated."),
                ParameterInfo(.GUI_alert_buttons): RT_List(contents: [
                    RT_String(value: "OK")
                ])
            ])
        }
        fatalError(message)
    }
    
    static func throwError(_ message: RTObjectPointer) {
        throwError(message: (fromOpaque(message) as? RT_String)?.value ?? "throwError() was not passed a string to print")
    }
    
    static func pushFrame(newTarget: RTObjectPointer? = nil) {
        stack.push(newTarget: newTarget.map { fromOpaque($0) })
    }
    
    static func popFrame() {
        stack.pop()
    }
    
    static func getCurrentTarget() -> RTObjectPointer {
        toOpaque(retain(stack.frames.last { $0.target != nil }!.target!))
    }
    
    static func newVariable(_ termPointer: TermPointer, _ initialValuePointer: RTObjectPointer) {
        let term = termFromOpaque(termPointer)
        let initialValue = fromOpaque(initialValuePointer)
        stack.currentFrame.variables[term.name!] = initialValue
    }
    
    static func getVariableValue(_ termPointer: TermPointer) -> RTObjectPointer {
        let term = termFromOpaque(termPointer)
        return toOpaque(stack.variables[term.name!] ?? RT_Null.null)
    }
    
    static func setVariableValue(_ termPointer: TermPointer, _ newValuePointer: RTObjectPointer) -> RTObjectPointer {
        let term = termFromOpaque(termPointer)
        let newValue = fromOpaque(newValuePointer)
        stack.currentFrame.variables[term.name!] = newValue
        return newValuePointer
    }
    
    static func isTruthy(_ object: RTObjectPointer) -> Bool {
        return fromOpaque(object).truthy
    }
    
    static func numericEqual(_ lhs: RTObjectPointer, _ rhs: RTObjectPointer) -> Bool {
        let lhs = fromOpaque(lhs)
        let rhs = fromOpaque(rhs)
        guard let lhsNumeric = lhs as? RT_Numeric else {
            throwError(message: "loop variable must be of numeric type, not ‘\(lhs.dynamicTypeInfo))’")
            
            // Basically, we want to stop the currently executing loop
            // if there is no comparison defined between the operands.
            // Otherwise the loop ends up infinite.
            return true
        }
        guard let rhsNumeric = rhs as? RT_Numeric else {
            throwError(message: "loop variable must be of numeric type, not ‘\(rhs.dynamicTypeInfo))’")
            
            // Ditto.
            return true
        }
        
        return lhsNumeric.numericValue == rhsNumeric.numericValue
    }
    
    static func newReal(_ value: Double) -> RTObjectPointer {
        return toOpaque(retain(RT_Real(value: value)))
    }
    
    static func newInteger(_ value: Int64) -> RTObjectPointer {
        return toOpaque(retain(RT_Integer(value: value)))
    }
    
    static func newBoolean(_ value: Bool) -> RTObjectPointer {
        return toOpaque(RT_Boolean.withValue(value))
    }
    
    static func newString(_ cString: UnsafePointer<CChar>) -> RTObjectPointer {
        return toOpaque(retain(RT_String(value: String(cString: cString))))
    }
    
    static func newConstant(_ uidPointer: RTObjectPointer) -> RTObjectPointer {
        let typedUID = typedUIDFromOpaque(uidPointer)
        switch ConstantUID(typedUID) {
        case .true:
            return newBoolean(true)
        case .false:
            return newBoolean(false)
        default:
            return toOpaque(retain(RT_Constant(value: rt.constant(forUID: typedUID))))
        }
    }
    
    static func newClass(_ uidPointer: RTObjectPointer) -> RTObjectPointer {
        let typedUID = typedUIDFromOpaque(uidPointer)
        return toOpaque(retain(RT_Class(value: rt.type(forUID: typedUID))))
    }
    
    static func newList() -> RTObjectPointer {
        return toOpaque(retain(RT_List(contents: [])))
    }
    
    static func newRecord() -> RTObjectPointer {
        return toOpaque(retain(RT_Record(contents: [:])))
    }
    
    static func newArgumentRecord() -> RTObjectPointer {
        return toOpaque(retain(RT_Private_ArgumentRecord()))
    }
    
    static func addToList(_ listPointer: RTObjectPointer, _ valuePointer: RTObjectPointer) {
        let list = fromOpaque(listPointer) as! RT_List
        let value = fromOpaque(valuePointer)
        list.add(value)
    }
    
    static func addToRecord(_ recordPointer: RTObjectPointer, _ keyPointer: RTObjectPointer, _ valuePointer: RTObjectPointer) {
        let record = fromOpaque(recordPointer) as! RT_Record
        let key = fromOpaque(keyPointer)
        let value = fromOpaque(valuePointer)
        record.add(key: key, value: value)
    }
    
    static func addToArgumentRecord(_ recordPointer: RTObjectPointer, _ uidPointer: RTObjectPointer, _ valuePointer: RTObjectPointer) {
        let record = fromOpaque(recordPointer) as! RT_Private_ArgumentRecord
        let typedUID = typedUIDFromOpaque(uidPointer)
        let value = fromOpaque(valuePointer)
        record.contents[typedUID] = value
    }
    
    static func getSequenceLength(_ sequencePointer: RTObjectPointer) -> Int64 {
        let sequence = fromOpaque(sequencePointer)
        do {
            let length = try sequence.property(rt.property(forUID: TypedTermUID(PropertyUID.Sequence_length))) as? RT_Numeric
            // TODO: Throw error for non-numeric length
            return Int64(length?.numericValue ?? 0)
        } catch {
            throwError(message: error.localizedDescription)
            return 0
        }
    }
    
    static func getFromSequenceAtIndex(_ sequencePointer: RTObjectPointer, _ index: Int64) -> RTObjectPointer {
        let sequence = fromOpaque(sequencePointer)
        do {
            let item = try sequence.element(rt.type(forUID: TypedTermUID(TypeUID.item)), at: index)
            return toOpaque(retain(item))
        } catch {
            throwError(message: error.localizedDescription)
            return toOpaque(RT_Null.null)
        }
    }
    
    static func getFromArgumentRecord(_ recordPointer: RTObjectPointer, _ uidPointer: RTObjectPointer) -> RTObjectPointer {
        let record = fromOpaque(recordPointer) as! RT_Private_ArgumentRecord
        let typedUID = typedUIDFromOpaque(uidPointer)
        return toOpaque(record.contents[typedUID] ?? RT_Null.null)
    }
    
    static func getFromArgumentRecordWithDirectParamFallback(_ recordPointer: RTObjectPointer, _ uidPointer: RTObjectPointer) -> RTObjectPointer {
        let record = fromOpaque(recordPointer) as! RT_Private_ArgumentRecord
        let typedUID = typedUIDFromOpaque(uidPointer)
        return toOpaque(
            record.contents[typedUID] ??
            record.contents[TypedTermUID(ParameterUID.direct)] ??
            RT_Null.null
        )
    }
    
    static func unaryOp(_ operation: Int64, _ operandPointer: RTObjectPointer) -> RTObjectPointer {
        let operand = fromOpaque(operandPointer)
        
        return toOpaque(retain({ () -> RT_Object? in
            switch UnaryOperation(rawValue: Int(operation))! {
            case .not:
                return operand.not()
            }
        }() ?? RT_Null.null))
    }
    
    static func binaryOp(_ operation: Int64, _ lhsPointer: RTObjectPointer, _ rhsPointer: RTObjectPointer) -> RTObjectPointer {
        let lhs = fromOpaque(lhsPointer)
        let rhs = fromOpaque(rhsPointer)
        
        return toOpaque(retain({ () -> RT_Object? in
            switch BinaryOperation(rawValue: Int(operation))! {
            case .or:
                return lhs.or(rhs)
            case .xor:
                return lhs.xor(rhs)
            case .and:
                return lhs.and(rhs)
            case .isA:
                return (rhs.coerce() as? RT_Class).map { RT_Boolean.withValue(lhs.dynamicTypeInfo.isA($0.value)) }
            case .isNotA:
                return (rhs.coerce() as? RT_Class).map { RT_Boolean.withValue(!lhs.dynamicTypeInfo.isA($0.value)) }
            case .equal:
                return lhs.equal(to: rhs)
            case .notEqual:
                return lhs.notEqual(to: rhs)
            case .less:
                return lhs.less(than: rhs)
            case .lessEqual:
                return lhs.lessEqual(to: rhs)
            case .greater:
                return lhs.greater(than: rhs)
            case .greaterEqual:
                return lhs.greaterEqual(to: rhs)
            case .startsWith:
                return lhs.startsWith(rhs)
            case .endsWith:
                return lhs.endsWith(rhs)
            case .contains:
                return lhs.contains(rhs)
            case .notContains:
                return lhs.notContains(rhs)
            case .containedBy:
                return lhs.contained(by: rhs)
            case .notContainedBy:
                return lhs.notContained(by: rhs)
            case .add:
                return lhs.adding(rhs)
            case .subtract:
                return lhs.subtracting(rhs)
            case .multiply:
                return lhs.multiplying(by: rhs)
            case .divide:
                return lhs.dividing(by: rhs)
            case .concatenate:
                return lhs.concatenating(rhs) ?? rhs.concatenated(to: lhs)
            }
        }() ?? RT_Null.null))
    }
    
    static func coerce(_ objectPointer: RTObjectPointer, to typePointer: InfoPointer) -> RTObjectPointer {
        let object = fromOpaque(objectPointer)
        let type = infoFromOpaque(typePointer) as TypeInfo
        // TODO: Should throw error when not coercible
        return toOpaque(retain(object.coerce(to: type) ?? RT_Null.null))
    }
    
    static func getResource(_ termPointer: TermPointer) -> RTObjectPointer {
        return toOpaque(retain({
            guard let term = termFromOpaque(termPointer) as? ResourceTerm else {
                return RT_Null.null
            }
            switch term.resource {
            case .applicationByName(let bundle),
                 .applicationByID(let bundle):
                return RT_Application(rt, bundle: bundle)
            }
        }() as RT_Object))
    }
    
    static func newSpecifier0(_ parentPointer: RTObjectPointer?, _ uidPointer: RTObjectPointer, _ rawKind: UInt32) -> RTObjectPointer {
        let parent: RT_Object? = (parentPointer == nil) ? nil : fromOpaque(parentPointer!)
        let typedUID = typedUIDFromOpaque(uidPointer)
        let newSpecifier: RT_Specifier
        let kind = RT_Specifier.Kind(rawValue: rawKind)!
        if kind == .property {
            newSpecifier = RT_Specifier(rt, parent: parent, type: nil, property: rt.property(forUID: typedUID), data: [], kind: .property)
        } else {
            let type = rt.type(forUID: typedUID)
            newSpecifier = RT_Specifier(rt, parent: parent, type: type, data: [], kind: kind)
        }
        return toOpaque(retain(newSpecifier))
    }
    static func newSpecifier1(_ parentPointer: RTObjectPointer?, _ uidPointer: RTObjectPointer, _ rawKind: UInt32, _ data1Pointer: RTObjectPointer) -> RTObjectPointer {
        let parent: RT_Object? = (parentPointer == nil) ? nil : fromOpaque(parentPointer!)
        let typedUID = typedUIDFromOpaque(uidPointer)
        let data1 = fromOpaque(data1Pointer)
        let newSpecifier: RT_Specifier
        let kind = RT_Specifier.Kind(rawValue: rawKind)!
        if kind == .property {
            newSpecifier = RT_Specifier(rt, parent: parent, type: nil, property: rt.property(forUID: typedUID), data: [data1], kind: .property)
        } else {
            let type = rt.type(forUID: typedUID)
            newSpecifier = RT_Specifier(rt, parent: parent, type: type, data: [data1], kind: kind)
        }
        return toOpaque(retain(newSpecifier))
    }
    static func newSpecifier2(_ parentPointer: RTObjectPointer?, _ uidPointer: RTObjectPointer, _ rawKind: UInt32, _ data1Pointer: RTObjectPointer, _ data2Pointer: RTObjectPointer) -> RTObjectPointer {
        let parent: RT_Object? = (parentPointer == nil) ? nil : fromOpaque(parentPointer!)
        let typedUID = typedUIDFromOpaque(uidPointer)
        let data1 = fromOpaque(data1Pointer)
        let data2 = fromOpaque(data2Pointer)
        let newSpecifier: RT_Specifier
        let kind = RT_Specifier.Kind(rawValue: rawKind)!
        if kind == .property {
            newSpecifier = RT_Specifier(rt, parent: parent, type: nil, property: rt.property(forUID: typedUID), data: [data1, data2], kind: .property)
        } else {
            let type = rt.type(forUID: typedUID)
            newSpecifier = RT_Specifier(rt, parent: parent, type: type, data: [data1, data2], kind: kind)
        }
        return toOpaque(retain(newSpecifier))
    }
    
    static func newTestSpecifier(_ operation: UInt32, _ lhsPointer: RTObjectPointer, _ rhsPointer: RTObjectPointer) -> RTObjectPointer {
        let operation = BinaryOperation(rawValue: Int(operation))!
        let lhs = fromOpaque(lhsPointer)
        let rhs = fromOpaque(rhsPointer)
        return toOpaque(retain(RT_TestSpecifier(rt, operation: operation, lhs: lhs, rhs: rhs)))
    }
    
    static func qualifySpecifier(_ objectPointer: RTObjectPointer) -> RTObjectPointer {
        guard let specifier = fromOpaque(objectPointer) as? RT_Specifier else {
            return objectPointer
        }
        return toOpaque(retain(stack.qualify(specifier: specifier)))
    }
    
    static func evaluateSpecifier(_ objectPointer: RTObjectPointer) -> RTObjectPointer {
        guard let specifier = fromOpaque(objectPointer) as? RT_Specifier else {
            return objectPointer
        }
        do {
            return toOpaque(retain(try specifier.evaluate()))
        } catch {
            throwError(message: "error evaluating specifier ‘\(specifier)’: \(error.localizedDescription)")
            return toOpaque(RT_Null.null)
        }
    }
    
    static func call(_ commandPointer: RTObjectPointer, _ argumentsPointer: RTObjectPointer) -> RTObjectPointer {
        let command = infoFromOpaque(commandPointer) as CommandInfo
        let argumentsRecord = fromOpaque(argumentsPointer) as! RT_Private_ArgumentRecord
        return call(command: command, arguments: arguments(from: argumentsRecord))
    }
    
    private static func arguments(from record: RT_Private_ArgumentRecord) -> [ParameterInfo : RT_Object] {
        [ParameterInfo : RT_Object](uniqueKeysWithValues:
            record.contents.map { (key: ParameterInfo($0.key.uid), value: $0.value) }
        )
    }
    
    private static func call(command: CommandInfo, arguments: [ParameterInfo : RT_Object]) -> RTObjectPointer {
        var arguments = arguments
        let target = stack.target
        
        if
            let target = target,
            arguments[ParameterInfo(.direct)] == nil
        {
            arguments[ParameterInfo(.direct)] = target
        }
        let directParameter = arguments[ParameterInfo(.direct)]
        
        func catchingErrors(do action: () throws -> RT_Object?) -> RT_Object? {
            do {
                return try action()
            } catch let error as Unpackable where error.object is CommandInfo {
                // Tried to send a non-AE command to a remote object
                // Ignore it and fall through to the next target
            } catch {
                Builtin.throwError(message: "\(error.localizedDescription)")
            }
            return nil
        }
        
        return toOpaque(retain(
            catchingErrors {
                try directParameter?.perform(command: command, arguments: arguments)
            } ??
            catchingErrors {
                directParameter == target ?
                    nil :
                    try target?.perform(command: command, arguments: arguments)
            } ??
            catchingErrors {
                try RT_Global(rt).perform(command: command, arguments: arguments) ?? RT_Null.null
            }!
        ))
    }
    
    static func runWeave(_ hashbangPointer: RTObjectPointer, _ bodyPointer: RTObjectPointer, _ inputPointer: RTObjectPointer) -> RTObjectPointer {
        var invocation = (fromOpaque(hashbangPointer) as! RT_String).value
        let body = (fromOpaque(bodyPointer) as! RT_String).value
        let inputObject = fromOpaque(inputPointer)
        
        invocation.removeLeadingWhitespace()
        if !invocation.hasPrefix("/") {
            // Simplified hashbangs like "#!python" are really just shorthand for /usr/bin/env
            invocation = "/usr/bin/env \(invocation)"
        }
        
        // TODO: Handle errors
        let tempDir = URL(fileURLWithPath: NSTemporaryDirectory())
        let scriptFile = tempDir.appendingPathComponent("weavescript_\(UUID().uuidString)")
        FileManager.default.createFile(atPath: scriptFile.path, contents: "#!\(invocation)\n\n\(body)".data(using: .utf8), attributes: [.posixPermissions: 0o0700 as AnyObject])
        
        let process = Process()
        process.executableURL = scriptFile
        
        let input = Pipe(),
            output = Pipe(),
            error = Pipe()
        process.standardInput = input
        process.standardOutput = output
        process.standardError = error
        
        let inputWriteFileHandle = input.fileHandleForWriting
        inputWriteFileHandle.write(((inputObject.coerce(to: rt.type(forUID: TypedTermUID(TypeUID.string))) as? RT_String)?.value ?? String(describing: inputObject)).data(using: .utf8)!)
        inputWriteFileHandle.closeFile()
        
        try! process.run()
        process.waitUntilExit()
        
        // TODO: readDataToEndOfFile caused problems in defaults-edit, apply the solution used there instead
        return toOpaque(retain(RT_String(value: String(data: output.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8)!)))
    }
    
}

extension SwiftAutomation.Specifier {
    
    func perform(_ rt: RTInfo, command: CommandInfo, arguments: [OSType : NSAppleEventDescriptor]) throws -> RT_Object {
        do {
            let wrappedResultDescriptor = try sendEvent(for: command, arguments: arguments)
            guard let resultDescriptor = wrappedResultDescriptor.result else {
                let errorNumber = wrappedResultDescriptor.errorNumber
                guard errorNumber == 0 else {
                    throw AutomationError(code: errorNumber)
                }
                // No result returned
                return RT_Null.null
            }
            
            if let resultObject = RT_Object.fromEventResult(rt, try self.appData.unpackAsAny(resultDescriptor)) {
                return resultObject
            } else {
                return RT_AEObject(rt, descriptor: resultDescriptor)
            }
        } catch let error as CommandError {
            Builtin.throwError(message: "\(appData.target) got an error: \(error)")
        } catch let error as UnpackError {
            Builtin.throwError(message: "descriptor unpacking error: \(error)")
        } catch let error as AutomationError {
            if error._code == errAEEventNotPermitted {
                Builtin.throwError(message: "not allowed to send AppleEvents to \(appData.target.description)")
            } else {
                Builtin.throwError(message: "\(appData.target.description) got an error: \(error)")
            }
        }
        return RT_Null.null
    }
    
    func sendEvent(for command: CommandInfo, arguments: [OSType : NSAppleEventDescriptor]) throws -> ReplyEventDescriptor {
        guard let codes = command.typedUID.ae8Code else {
            throw Unpackable(object: command)
        }
        return try self.sendAppleEvent(codes.class, codes.id, arguments)
    }
    
}

extension RT_Object {
    
    static func fromEventResult(_ rt: RTInfo, _ result: Any) -> RT_Object? {
        // See AppData.unpackAsAny(_:)
        switch result {
        case let bool as Bool:
            return RT_Boolean.withValue(bool)
        case let int32 as Int32:
            return RT_Integer(value: Int64(int32))
        case let int64 as Int64:
            return RT_Integer(value: int64)
        case let int as Int:
            return RT_Integer(value: Int64(int))
        case let uint32 as UInt32:
            return RT_Integer(value: Int64(uint32))
        case let uint64 as UInt64:
            return RT_Integer(value: Int64(uint64))
        case let uint as UInt:
            return RT_Integer(value: Int64(uint))
        case let double as Double:
            return RT_Real(value: double)
        case let string as String:
            return RT_String(value: string)
        case let date as Date:
            return RT_Date(value: date)
        case let array as [Any]:
            let contents = array.map({ RT_Object.fromEventResult(rt, $0) })
            if contents.contains(where: { $0 == nil }) {
                return nil
            }
            return RT_List(contents: contents.map { $0! })
        case let dictionary as [SwiftAutomation.Symbol : Any]:
            guard let values = dictionary.values.map({ RT_Object.fromEventResult(rt, $0) }) as? [RT_Object] else {
                return nil
            }
            let keysAndValues = zip(dictionary.keys, values).map { ($0.0.asRTObject(rt), $0.1) }
            let convertedDictionary = [RT_Object : RT_Object](uniqueKeysWithValues: keysAndValues)
            return RT_Record(contents: convertedDictionary)
//        case let url as URL:
//            return RT_File // TODO: This
//            return RT_Null.null
        case is MissingValueType:
            return RT_Null.null // Intentional
        case let symbol as Symbol:
            return symbol.asRTObject(rt)
        case let specifier as SwiftAutomation.Specifier:
            if let root = specifier as? SwiftAutomation.RootSpecifier {
                guard
                    let bundleID = root.appData.target.bundleIdentifier,
                    let bundle = Bundle(identifier: bundleID)
                else {
                    return nil
                }
                return RT_Application(rt, bundle: bundle)
            } else if let objectSpecifier = specifier as? SwiftAutomation.ObjectSpecifier {
                return RT_Specifier(rt, saSpecifier: objectSpecifier)
            } else {
                // TODO: insertion specifiers
                return RT_String(value: "\(specifier)")
            }
        // TODO: There are more types
        default:
            return nil
        }
    }
    
}

extension SwiftAutomation.Symbol {
    
    func asRTObject(_ rt: RTInfo) -> RT_Object {
        switch type {
        case typeType:
            return RT_Class(value: rt.type(for: code) ?? TypeInfo(.ae4(code: code), name == nil ? [] : [.name(TermName(name!))]))
        case typeEnumerated, typeKeyword, typeProperty:
            return RT_Constant(value: rt.constant(for: code) ?? ConstantInfo(.ae4(code: code), name == nil ? [] : [.name(TermName(name!))]))
        default:
            fatalError("invalid descriptor type for Symbol")
        }
    }
    
}

private class RT_Private_ArgumentRecord: RT_Object {
    
    public var contents: [TypedTermUID : RT_Object] = [:]
    
}

extension RT_HierarchicalSpecifier {
    
    public func evaluate() throws -> RT_Object {
        switch rootAncestor() {
        case let root as RT_SpecifierRemoteRoot:
            // Let remote root handle evaluation.
            return try root.evaluate(specifier: self)
        default:
            // Eval as a local specifier.
            func evaluateLocalSpecifier(_ specifier: RT_HierarchicalSpecifier, from root: RT_Object) throws -> RT_Object {
                // Start from the top and work down
                let evaluatedParent: RT_Object = try {
                    if
                        let parent = specifier.parent as? RT_HierarchicalSpecifier,
                        parent !== root
                    {
                        // Eval the parent specifier before working with this one.
                        return try evaluateLocalSpecifier(parent, from: root)
                    } else {
                        // We are the specifier directly under the root.
                        return root
                    }
                }()
                return try specifier.evaluateLocally(on: evaluatedParent)
            }
            var root = rootAncestor()
            if root is RT_RootSpecifier {
                root = RT_Global(rt)
            }
            return try evaluateLocalSpecifier(self, from: root)
        }
    }
    
}
