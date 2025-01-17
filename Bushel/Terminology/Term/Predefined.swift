import Foundation
import InAnyCase

// MARK: Definition
extension Term {
    
    public typealias PredefinedID = Term_PredefinedID
    
}

public protocol Term_PredefinedID {
    
    var role: Term.SyntacticRole { get }
    var ae4Code: OSType? { get }
    var ae8Code: (class: AEEventClass, id: AEEventID)? { get }
    var ae12Code: (class: AEEventClass, id: AEEventID, code: AEKeyword)? { get }
    var pathname: Term.SemanticURI.Pathname? { get }
    var resourceName: String? { get }
    
    init?(_ uri: Term.SemanticURI)
    
}

public extension Term.PredefinedID {
    
    var ae4Code: OSType? {
        nil
    }
    
    var ae8Code: (class: AEEventClass, id: AEEventID)? {
        nil
    }
    
    var ae12Code: (class: AEEventClass, id: AEEventID, code: AEKeyword)? {
        nil
    }
    
    var resourceName: String? {
        nil
    }
    
}

extension Term.PredefinedID where Self: RawRepresentable, RawValue == String {
    
    public var pathname: Term.SemanticURI.Pathname? {
        makePathname(from: rawValue)
    }
    
    internal init?(pathname: Term.SemanticURI.Pathname) {
        self.init(rawValue: makeRawValue(from: pathname))
    }
    
    public var resourceName: String {
        rawValue
    }
    
    internal init?(resourceName: String) {
        self.init(rawValue: resourceName)
    }
    
}

private func makePathname(from rawValue: String) -> Term.SemanticURI.Pathname {
    Term.SemanticURI.Pathname(
        rawValue
            .split(separator: "_")
            .map { String($0).transformed(from: .camel, to: .space, case: $0.first!.isUppercase ? .preserve : .lower) }
    )
}

private func makeRawValue(from pathname: Term.SemanticURI.Pathname) -> String {
    pathname
        .components
        .map { String($0).transformed(from: .space, to: .camel, case: $0.first!.isUppercase ? .preserve : .lowerUpper ) }
        .joined(separator: "_")
}

public extension Term.PredefinedID {
    
    init?(_ id: Term.ID) {
        self.init(id.uri)
    }
    
}

public extension Term.SemanticURI {
    
    init(_ predefined: Term.PredefinedID) {
        guard
            let uri: Term.SemanticURI = {
                if let aeCode = predefined.ae4Code {
                    return .ae4(code: aeCode)
                } else if let (aeClassCode, aeIDCode) = predefined.ae8Code {
                    return .ae8(class: aeClassCode, id: aeIDCode)
                } else if let (aeClassCode, aeIDCode, aeCode) = predefined.ae12Code {
                    return .ae12(class: aeClassCode, id: aeIDCode, code: aeCode)
                } else if predefined.role == .resource, let resourceName = predefined.resourceName {
                    return .res(resourceName)
                } else if let pathname = predefined.pathname {
                    return .id(pathname)
                } else {
                    return nil
                }
            }()
        else {
            preconditionFailure("Predefined term URI \(predefined) has no valid identification method")
        }
        self = uri
    }
    
}

public extension Term.ID {
    
    init(_ predefined: Term.PredefinedID) {
        self.init(predefined.role, Term.SemanticURI(predefined))
    }
    
}

public enum Variables: String, Term.PredefinedID {
    
    case Script = ""
    case Core
    
    public var role: Term.SyntacticRole {
        .variable
    }
    
    public init?(_ uri: Term.SemanticURI) {
        switch uri {
        case .id(let pathname):
            self.init(pathname: pathname)
        default:
            return nil
        }
    }
    
}

public enum Dictionaries: String, Term.PredefinedID {
    
    case root
    
    case function
    
    case Core_Math
    case Core_Sequence
    case Core_String
    case Core_GUI
    case Core_CLI
    
    public var role: Term.SyntacticRole {
        .dictionary
    }
    
    public init?(_ uri: Term.SemanticURI) {
        switch uri {
        case .id(let pathname):
            self.init(pathname: pathname)
        default:
            return nil
        }
    }
    
}

public enum Types: String, Term.PredefinedID {
    
    case item
    case list
    case record
    case constant
    case boolean
    case string
    case character
    case number
    case integer
    case real
    case date
    case window
    case document
    case file
    case alias
    case specifier
    case comparisonTestSpecifier
    case logicalTestSpecifier
    case type
    case null
    case coreObject
    case script
    case app
    case applescript
    case function
    case system
    case error
    case environmentVariable
    
    public var role: Term.SyntacticRole {
        .type
    }
    
    public var ae4Code: OSType? {
        switch self {
        case .item:
            return cObject
        case .list:
            return typeAEList
        case .record:
            return typeAERecord
        case .constant:
            return typeEnumerated
        case .boolean:
            return typeBoolean
        case .string:
            return typeUnicodeText
        case .character:
            return cChar
        case .number:
            return try! FourCharCode(fourByteString: "nmbr")
        case .integer:
            return typeSInt64
        case .real:
            return typeIEEE64BitFloatingPoint
        case .date:
            return typeLongDateTime
        case .window:
            return cWindow
        case .document:
            return cDocument
        case .file:
            return cFile
        case .alias:
            return typeAlias
        case .specifier:
            return cObjectSpecifier
        case .comparisonTestSpecifier:
            return typeCompDescriptor
        case .logicalTestSpecifier:
            return typeLogicalDescriptor
        case .type:
            // AppleScript uses this as a type.
            // AppleScript is weird.
            return pClass
        case .null:
            return try! FourCharCode(fourByteString: "msng")
        case .app:
            return cApplication
        case .coreObject, .script, .applescript, .function, .system, .error, .environmentVariable:
            return nil
        }
    }
    
    public init?(_ uri: Term.SemanticURI) {
        switch uri {
        case .ae4(let aeCode):
            switch aeCode {
            case cObject:
                self = .item
            case typeAEList:
                self = .list
            case typeAERecord:
                self = .record
            case typeEnumerated:
                self = .constant
            case typeBoolean:
                self = .boolean
            case typeUnicodeText:
                self = .string
            case cChar:
                self = .character
            case try! FourCharCode(fourByteString: "nmbr"):
                self = .number
            case typeSInt64:
                self = .integer
            case typeIEEE64BitFloatingPoint:
                self = .real
            case typeLongDateTime:
                self = .date
            case cWindow:
                self = .window
            case cDocument:
                self = .document
            case cFile:
                self = .file
            case typeAlias:
                self = .alias
            case cApplication:
                self = .app
            case cObjectSpecifier:
                self = .specifier
            case typeCompDescriptor:
                self = .comparisonTestSpecifier
            case typeLogicalDescriptor:
                self = .logicalTestSpecifier
            case typeType:
                self = .type
            case try! FourCharCode(fourByteString: "msng"):
                self = .null
            default:
                return nil
            }
        case .id(let pathname):
            self.init(pathname: pathname)
        default:
            return nil
        }
    }
    
}

public enum Properties: String, Term.PredefinedID {
    
    case properties
    case type
    case name
    case id
    case index
    
    case topScript
    case arguments
    
    case currentDate
    
    case Sequence_length
    case Sequence_reverse
    case Sequence_tail
    
    case file_basename
    case file_extname
    case file_dirname
    
    case date_seconds
    case date_minutes
    case date_hours
    case date_secondsSinceMidnight
    
    case Math_NaN
    case Math_inf
    case Math_NaN_Q = "Math_NaN?"
    case Math_inf_Q = "Math_inf?"
    case Math_finite_Q = "Math_finite?"
    case Math_normal_Q = "Math_normal?"
    case Math_zero_Q = "Math_zero?"
    case Math_pi
    case Math_e
    
    case environmentVariable_value
    
    case buttonReturned
    
    public var role: Term.SyntacticRole {
        .property
    }
    
    public var ae4Code: OSType? {
        switch self {
        case .properties:
            return try! FourCharCode(fourByteString: "pALL")
        case .type:
            return pClass
        case .name:
            return pName
        case .id:
            return pID
        case .index:
            return pIndex
        case .Sequence_length:
            return try! FourCharCode(fourByteString: "leng")
        case .Sequence_reverse:
            return try! FourCharCode(fourByteString: "rvse")
        case .Sequence_tail:
            return try! FourCharCode(fourByteString: "rest")
        case .environmentVariable_value:
            return try! FourCharCode(fourByteString: "valL")
        case .buttonReturned:
            return try! FourCharCode(fourByteString: "bhit")
        default:
            return nil
        }
    }
    
    public init?(_ uri: Term.SemanticURI) {
        switch uri {
        case .ae4(let aeCode):
            switch aeCode {
            case try! FourCharCode(fourByteString: "pALL"):
                self = .properties
            case pClass:
                self = .type
            case pName:
                self = .name
            case pID:
                self = .id
            case pIndex:
                self = .index
            case try! FourCharCode(fourByteString: "leng"):
                self = .Sequence_length
            case try! FourCharCode(fourByteString: "rvse"):
                self = .Sequence_reverse
            case try! FourCharCode(fourByteString: "rest"):
                self = .Sequence_tail
            case try! FourCharCode(fourByteString: "valL"):
                self = .environmentVariable_value
            default:
                return nil
            }
        case .id(let pathname):
            self.init(pathname: pathname)
        default:
            return nil
        }
    }
    
}

public enum Constants: String, Term.PredefinedID {
    
    case `true`
    case `false`
    
    public var role: Term.SyntacticRole {
        .constant
    }
    
    public var ae4Code: OSType? {
        switch self {
        case .`true`:
            return typeTrue
        case .`false`:
            return typeFalse
        }
    }
    
    public init?(_ uri: Term.SemanticURI) {
        switch uri {
        case .ae4(let aeCode):
            switch aeCode {
            case typeTrue:
                self = .true
            case typeFalse:
                self = .false
            default:
                return nil
            }
        case .id(let pathname):
            self.init(pathname: pathname)
        default:
            return nil
        }
    }
    
}

public enum Commands: String, Term.PredefinedID {
    
    case get
    case set
    
    case run
    case reopen
    case open
    case print
    case quit
    
    case delay
    
    case Math_abs
    case Math_sqrt
    case Math_cbrt
    case Math_pow
    case Math_ln
    case Math_log10
    case Math_log2
    case Math_sin
    case Math_cos
    case Math_tan
    case Math_asin
    case Math_acos
    case Math_atan
    case Math_atan2
    case Math_round
    case Math_ceil
    case Math_floor
    
    case Sequence_add
    case Sequence_remove
    case Sequence_pluck
    
    case GUI_notification
    case GUI_alert
    case GUI_chooseFrom
    case GUI_ask
    
    case CLI_log
    
    public var role: Term.SyntacticRole {
        .command
    }
    
    public var ae8Code: (class: AEEventClass, id: AEEventID)? {
        switch self {
        case .get:
            return (class: kAECoreSuite, id: kAEGetData)
        case .set:
            return (class: kAECoreSuite, id: kAESetData)
        case .run:
            return (class: kCoreEventClass, id: kAEOpenApplication)
        case .reopen:
            return (class: kCoreEventClass, id: kAEReopenApplication)
        case .open:
            return (class: kCoreEventClass, id: kAEOpenDocuments)
        case .print:
            return (class: kCoreEventClass, id: kAEPrintDocuments)
        case .quit:
            return (class: kCoreEventClass, id: kAEQuitApplication)
        case .GUI_notification:
            return (class: try! FourCharCode(fourByteString: "bShG"), id: try! FourCharCode(fourByteString: "notf"))
        case .GUI_alert:
            return (class: try! FourCharCode(fourByteString: "bShG"), id: try! FourCharCode(fourByteString: "disA"))
        case .GUI_chooseFrom:
            return (class: try! FourCharCode(fourByteString: "bShG"), id: try! FourCharCode(fourByteString: "chlt"))
        case .GUI_ask:
            return (class: try! FourCharCode(fourByteString: "bShG"), id: try! FourCharCode(fourByteString: "ask "))
        default:
            return nil
        }
    }
    
    public init?(_ uri: Term.SemanticURI) {
        switch uri {
        case .ae8(let `class`, let id):
            switch (`class`, id) {
            case (kAECoreSuite, kAEGetData):
                self = .get
            case (kAECoreSuite, kAESetData):
                self = .set
            case (kCoreEventClass, kAEOpenApplication):
                self = .run
            case (kCoreEventClass, kAEReopenApplication):
                self = .reopen
            case (kCoreEventClass, kAEOpenDocuments):
                self = .open
            case (kCoreEventClass, kAEPrintDocuments):
                self = .print
            case (kCoreEventClass, kAEQuitApplication):
                self = .quit
            case (try! FourCharCode(fourByteString: "bShG"), try! FourCharCode(fourByteString: "notf")):
                self = .GUI_notification
            case (try! FourCharCode(fourByteString: "syso"), try! FourCharCode(fourByteString: "disA")):
                self = .GUI_alert
            case (try! FourCharCode(fourByteString: "gtqp"), try! FourCharCode(fourByteString: "chlt")):
                self = .GUI_chooseFrom
            case (try! FourCharCode(fourByteString: "bShG"), try! FourCharCode(fourByteString: "ask ")):
                self = .GUI_ask
            default:
                return nil
            }
        case .id(let pathname):
            self.init(pathname: pathname)
        default:
            return nil
        }
    }
    
}

public enum Parameters: String, Term.PredefinedID {
    
    case direct = ".direct"
    case target = ".target"
    case set_to
    case open_searchText
    
    case Math_pow_exponent
    case Math_atan2_x
    
    case Sequence_join_with
    
    case String_split_by
    
    case GUI_notification_title
    case GUI_notification_subtitle
    case GUI_notification_sound
    case GUI_alert_title
    case GUI_alert_message
    case GUI_alert_kind
    case GUI_alert_buttons
    case GUI_alert_default
    case GUI_alert_cancel
    case GUI_alert_timeout
    case GUI_chooseFrom_title
    case GUI_chooseFrom_prompt
    case GUI_chooseFrom_default
    case GUI_chooseFrom_confirm
    case GUI_chooseFrom_cancel
    case GUI_chooseFrom_multipleSelection
    case GUI_chooseFrom_noSelection
    case GUI_ask_dataType
    case GUI_ask_title
    
    public var role: Term.SyntacticRole {
        .parameter
    }
    
    public var ae12Code: (class: AEEventClass, id: AEEventID, code: AEKeyword)? {
        guard
            let commandAndCode: (command: Commands, code: AEKeyword) = {
                switch self {
                case .set_to:
                    return (.set, keyAEData)
                case .open_searchText:
                    return (.open, keyAESearchText)
                case .GUI_notification_title:
                    return (.GUI_notification, try! FourCharCode(fourByteString: "appr"))
                case .GUI_notification_subtitle:
                    return (.GUI_notification, try! FourCharCode(fourByteString: "subt"))
                case .GUI_notification_sound:
                    return (.GUI_notification, try! FourCharCode(fourByteString: "nsou"))
                case .GUI_alert_title:
                    return (.GUI_alert, try! FourCharCode(fourByteString: "appr"))
                case .GUI_alert_message:
                    return (.GUI_alert, try! FourCharCode(fourByteString: "mesS"))
                case .GUI_alert_kind:
                    return (.GUI_alert, try! FourCharCode(fourByteString: "EAlT"))
                case .GUI_alert_buttons:
                    return (.GUI_alert, try! FourCharCode(fourByteString: "btns"))
                case .GUI_alert_default:
                    return (.GUI_alert, try! FourCharCode(fourByteString: "dflt"))
                case .GUI_alert_cancel:
                    return (.GUI_alert, try! FourCharCode(fourByteString: "cbtn"))
                case .GUI_alert_timeout:
                    return (.GUI_alert, try! FourCharCode(fourByteString: "givu"))
                case .GUI_chooseFrom_title:
                    return (.GUI_chooseFrom, try! FourCharCode(fourByteString: "appr"))
                case .GUI_chooseFrom_prompt:
                    return (.GUI_chooseFrom, try! FourCharCode(fourByteString: "prmp"))
                case .GUI_chooseFrom_default:
                    return (.GUI_chooseFrom, try! FourCharCode(fourByteString: "inSL"))
                case .GUI_chooseFrom_confirm:
                    return (.GUI_chooseFrom, try! FourCharCode(fourByteString: "okbt"))
                case .GUI_chooseFrom_cancel:
                    return (.GUI_chooseFrom, try! FourCharCode(fourByteString: "cnbt"))
                case .GUI_chooseFrom_multipleSelection:
                    return (.GUI_chooseFrom, try! FourCharCode(fourByteString: "mlsl"))
                case .GUI_chooseFrom_noSelection:
                    return (.GUI_chooseFrom, try! FourCharCode(fourByteString: "empL"))
                case .GUI_ask_dataType:
                    return (.GUI_ask, try! FourCharCode(fourByteString: "forT"))
                case .GUI_ask_title:
                    return (.GUI_ask, try! FourCharCode(fourByteString: "appr"))
                default:
                    return nil
                }
            }(),
            let (`class`, id) = commandAndCode.command.ae8Code
        else {
            return nil
        }
        return (class: `class`, id: id, code: commandAndCode.code)
    }
    
    public init?(_ uri: Term.SemanticURI) {
        switch uri {
        case .ae4(let aeCode):
            switch aeCode {
            case keyDirectObject:
                self = .direct
            default:
                return nil
            }
        case .ae12(let `class`, let id, let code):
            if code == keyDirectObject {
                self = .direct
                return
            }
            switch (Commands(.ae8(class: `class`, id: id)), code) {
            case (.set, keyAEData):
                self = .set_to
            case (.open, keyAESearchText):
                self = .open_searchText
            case (.GUI_notification, try! FourCharCode(fourByteString: "appr")):
                self = .GUI_notification_title
            case (.GUI_notification, try! FourCharCode(fourByteString: "subt")):
                self = .GUI_notification_subtitle
            case (.GUI_notification, try! FourCharCode(fourByteString: "nsou")):
                self = .GUI_notification_sound
            case (.GUI_alert, try! FourCharCode(fourByteString: "appr")):
                self = .GUI_alert_title
            case (.GUI_alert, try! FourCharCode(fourByteString: "mesS")):
                self = .GUI_alert_message
            case (.GUI_alert, try! FourCharCode(fourByteString: "EAlT")):
                self = .GUI_alert_kind
            case (.GUI_alert, try! FourCharCode(fourByteString: "btns")):
                self = .GUI_alert_buttons
            case (.GUI_alert, try! FourCharCode(fourByteString: "dflt")):
                self = .GUI_alert_default
            case (.GUI_alert, try! FourCharCode(fourByteString: "cbtn")):
                self = .GUI_alert_cancel
            case (.GUI_alert, try! FourCharCode(fourByteString: "givu")):
                self = .GUI_alert_timeout
            case (.GUI_chooseFrom, try! FourCharCode(fourByteString: "appr")):
                self = .GUI_chooseFrom_title
            case (.GUI_chooseFrom, try! FourCharCode(fourByteString: "prmp")):
                self = .GUI_chooseFrom_prompt
            case (.GUI_chooseFrom, try! FourCharCode(fourByteString: "inSL")):
                self = .GUI_chooseFrom_default
            case (.GUI_chooseFrom, try! FourCharCode(fourByteString: "okbt")):
                self = .GUI_chooseFrom_confirm
            case (.GUI_chooseFrom, try! FourCharCode(fourByteString: "cnbt")):
                self = .GUI_chooseFrom_cancel
            case (.GUI_chooseFrom, try! FourCharCode(fourByteString: "mlsl")):
                self = .GUI_chooseFrom_multipleSelection
            case (.GUI_chooseFrom, try! FourCharCode(fourByteString: "empL")):
                self = .GUI_chooseFrom_noSelection
            case (.GUI_ask, try! FourCharCode(fourByteString: "forT")):
                self = .GUI_ask_dataType
            case (.GUI_ask, try! FourCharCode(fourByteString: "titl")):
                self = .GUI_ask_title
            default:
                return nil
            }
        case .id(let pathname):
            self.init(pathname: pathname)
        default:
            return nil
        }
    }
    
}

public enum Resources: String, Term.PredefinedID {
    
    case system
    
    public var role: Term.SyntacticRole {
        .resource
    }
    
    public var resourceName: String? {
        rawValue
    }
    
    public init?(_ uri: Term.SemanticURI) {
        switch uri {
        case .res(let resourceName):
            self.init(resourceName: resourceName)
        default:
            return nil
        }
    }
    
}
