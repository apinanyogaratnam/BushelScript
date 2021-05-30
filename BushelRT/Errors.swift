import Bushel

public struct Unencodable: LocalizedError {
    
    public let object: Any
    
    public var errorDescription: String? {
        "\(object) couldn’t be sent in an AppleEvent because it can’t be represented as an AppleEvent descriptor"
    }
    
}

public struct Undecodable: LocalizedError {
    
    public let error: Error
    
    public var errorDescription: String? {
        "An object couldn’t be decoded from an AppleEvent descriptor: \(error)"
    }
    
}

public struct RemoteCommandError: LocalizedError {
    
    public let remoteObject: Any
    public let command: CommandInfo
    public let error: Error
    
    public var errorDescription: String? {
        "Remote object \(remoteObject) got an error performing \(command): \(error)"
    }
    
}

public struct RemoteCommandsDisallowed: LocalizedError {
    
    public let remoteObject: Any
    
    public var errorDescription: String? {
        // Generalize this once multiple possibly inaccessible remote target types exist
        "Not allowed to send AppleEvents to \(remoteObject)"
    }
    
}

public struct NotAModule: LocalizedError {
    
    public let object: RT_Object
    
    public var errorDescription: String? {
        "\(object) is not a module, so it cannot handle commands; did you mean to target it instead?"
    }
    
}

public struct UnsupportedCommand: LocalizedError {
    
    public let object: RT_Object
    public let command: CommandInfo
    
    public var errorDescription: String? {
        "\(object) does not support perfoming \(command)"
    }
    
}

public struct NoPropertyExists: LocalizedError {
    
    public let type: TypeInfo
    public let property: PropertyInfo
    
    public var errorDescription: String? {
        "Objects of type \(type) do not have a property named \(property)"
    }
    
}

public struct NoNumericPropertyExists: LocalizedError {
    
    public let type: TypeInfo
    public let property: PropertyInfo
    
    public var errorDescription: String? {
        "Objects of type \(type) do not have a numeric property named \(property)"
    }
    
}

public struct NoWritablePropertyExists: LocalizedError {
    
    public let type: TypeInfo
    public let property: PropertyInfo
    
    public var errorDescription: String? {
        "Objects of type \(type) do not have a writable property named \(property)"
    }
    
}

public struct NonPropertyIsNotWritable: LocalizedError {
    
    public let specifier: RT_Specifier
    
    public var errorDescription: String? {
        "Specifier ‘\(specifier)’ cannot be written to because it does not refer to a property"
    }
    
}

public struct Uncoercible: LocalizedError {
    
    public let expectedType: TypeInfo
    public let object: RT_Object
    
    public var errorDescription: String? {
        "The \(object.dynamicTypeInfo) ‘\(object)’ cannot be converted to \("\(expectedType)".startsWithVowel ? "an" : "a") \(expectedType)"
    }
    
}

public struct TypeObjectRequired: LocalizedError {
    
    public let object: RT_Object
    
    public var errorDescription: String? {
        "A type object is required, but \(object) was provided"
    }
    
}

public struct MissingParameter: LocalizedError {
    
    public let command: CommandInfo
    public let parameter: ParameterInfo
    
    public var errorDescription: String? {
        "The required \(Parameters(parameter.uri) == .direct ? "direct object parameter" : "parameter \(parameter)") is missing from a call to \(command)"
    }
    
}

public struct WrongParameterType: LocalizedError {
    
    public let command: CommandInfo
    public let parameter: ParameterInfo
    public let expected: TypeInfo
    public let actual: TypeInfo
    
    public var errorDescription: String? {
        "The \(Parameters(parameter.uri) == .direct ? "direct object parameter" : "parameter \(parameter)") for a call to \(command) expects \("\(expected)".startsWithVowel ? "an" : "a") \(expected) but received \("\(actual)".startsWithVowel ? "an" : "a") \(actual)"
    }
    
}

public struct UnsupportedIndexForm: LocalizedError {
    
    public enum IndexForm: String {
        case index
        case name
        case id
        case relative
        case absolute
        case all
        case range
        case filter
    }
    
    public let indexForm: IndexForm
    public let `class`: TypeInfo
    
    public var errorDescription: String? {
        "The indexing form ‘\(indexForm)’ is unsupported by items of type \(`class`)"
    }
    
}

public struct NoElementExists: LocalizedError {
    
    public let locationDescription: String
    
    public var errorDescription: String? {
        "No element exists \(locationDescription)"
    }
    
}

public struct InvalidSpecifierDataType: LocalizedError {
    
    public enum SpecifierType: String {
        
        case byIndex = "by-index"
        case byName = "by-name"
        case simple = "simple"
        case byTest = "by-test"
        
    }
    
    public let specifierType: SpecifierType
    public let specifierData: Any
    
    public var errorDescription: String? {
        "\(specifierData) is of incorrect type for a \(specifierType) specifier"
    }
    
}

public struct InsertionSpecifierEvaluated: LocalizedError {
    
    public let insertionSpecifier: RT_InsertionSpecifier
    
    public var errorDescription: String? {
        "Insertion specifiers cannot be evaluated: \(insertionSpecifier)"
    }
    
}

public struct AppleScriptError: LocalizedError {
    
    public let number: OSStatus?
    public let message: String?
    
    public var errorDescription: String? {
        "AppleScript error\(number.map { " number \($0)" } ?? "")\(message.map { ": \($0)" } ?? "")"
    }
    
}

public struct MissingResource: LocalizedError {
    
    public let resourceDescription: String
    
    public var errorDescription: String? {
        "Missing required resource: \(resourceDescription)"
    }
    
}
