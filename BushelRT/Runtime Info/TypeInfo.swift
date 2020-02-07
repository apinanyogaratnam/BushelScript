import Bushel

public class TypeInfo: TermInfo, Hashable {
    
    public enum Tag {
        
        /// Exclusively identifies RT_Object/"item".
        /// The only type that has no supertype.
        case root
        /// The type's supertype. If both this and `.root` are absent, the
        /// type implicitly derives from "item".
        case supertype(TypeInfo)
        /// The type's user-facing name.
        case name(TermName)
        /// Indicates that ID and supertype information cannot be statically
        /// determined and should instead be looked up at runtime. This ID info
        /// is reported by RT_AEObject.
        /// Appropriate dynamic lookup involves querying a specific instance
        /// for its `dynamicTypeInfo`.
        case dynamic
        
    }
    
    public var uid: TermUID
    public var tags: Set<Tag> = []
    
    public var kind: TypedTermUID.Kind {
        .type
    }
    
    public var supertype: TypeInfo? {
        for case .supertype(let supertype) in tags {
            return supertype
        }
        for case .root in tags {
            return nil
        }
        return TypeInfo(.item, [.root])
    }
    public var name: TermName? {
        for case .name(let name) in tags {
            return name
        }
        return nil
    }
    
    public func addName(_ name: TermName) {
        if self.name == nil {
            tags.insert(.name(name))
        }
    }
    
    public static func == (lhs: TypeInfo, rhs: TypeInfo) -> Bool {
        return lhs.uid == rhs.uid
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(uid)
    }
    
    public convenience init(_ predefined: TypeUID, _ tags: Set<Tag> = []) {
        self.init(TermUID(predefined), tags)
    }
    
    public init(_ uid: TermUID, _ tags: Set<Tag> = []) {
        self.uid = uid
        self.tags = tags
    }
    
}

public extension TypeInfo {
    
    func isA(_ other: TypeInfo) -> Bool {
        var typeInfo = self
        while true {
            if typeInfo == other {
                return true
            }
            guard let supertype = typeInfo.supertype else {
                return false
            }
            typeInfo = supertype
        }
    }
    
}

extension TypeInfo.Tag: Hashable {
    
    public static func == (lhs: TypeInfo.Tag, rhs: TypeInfo.Tag) -> Bool {
        switch (lhs, rhs) {
        case (.root, .root):
            return true
        case (.supertype(let lSupertype), .supertype(let rSupertype)):
            return lSupertype == rSupertype
        case (.name(let lName), .name(let rName)):
            return lName == rName
        case (.dynamic, .dynamic):
            return true
        default:
            return false
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .root:
            hasher.combine(1)
        case .supertype(let supertype):
            hasher.combine(2)
            hasher.combine(supertype)
        case .name(let name):
            hasher.combine(3)
            hasher.combine(name)
        case .dynamic:
            hasher.combine(4)
        }
    }
    
}
