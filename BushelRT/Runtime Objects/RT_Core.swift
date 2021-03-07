import Bushel
import SwiftAutomation

public class RT_Core: RT_Object {
    
    private static let typeInfo_ = TypeInfo(.coreObject)
    public override class var typeInfo: TypeInfo {
        typeInfo_
    }
    
    public override var description: String {
        "Core"
    }
    
    public override func perform(command: CommandInfo, arguments: [ParameterInfo : RT_Object], implicitDirect: RT_Object?) throws -> RT_Object? {
        if
            let commandClass = command.id.ae8Code?.class,
            commandClass == (try! FourCharCode(fourByteString: "bShG"))
        {
            // Run GUIHost command
            guard let guiHostBundle = Bundle(applicationBundleIdentifier: "com.justcheesy.BushelGUIHost") else {
                throw MissingResource(resourceDescription: "BushelGUIHost application")
            }
            
            var arguments = arguments
            if
                arguments.first(where: { $0.key.uri.ae4Code == Parameters.GUI_ask_title.ae12Code!.code }) == nil,
                let scriptName = Optional("")//rt.topScript.name
            // FIXME: fix
            {
                arguments[ParameterInfo(.GUI_ask_title)] = RT_String(value: scriptName)
            }
            
            return try RT_Application(bundle: guiHostBundle).perform(command: command, arguments: arguments, implicitDirect: implicitDirect)
        }
        
        switch Commands(command.id) {
        case .delay:
            let delaySeconds = arguments[ParameterInfo(.direct)]?.coerce(to: RT_Real.self)?.value ?? 1.0
            Thread.sleep(forTimeInterval: delaySeconds)
            return RT_Null.null
        case .CLI_log:
            guard let message = arguments[ParameterInfo(.direct)] else {
                // TODO: Throw error
                return RT_Null.null
            }
            print(message.coerce(to: RT_String.self)?.value ?? String(describing: message))
            return RT_Null.null
        default:
            return try super.perform(command: command, arguments: arguments, implicitDirect: implicitDirect)
        }
    }
    
    public override func property(_ property: PropertyInfo) throws -> RT_Object {
        switch Properties(property.id) {
        case .currentDate:
            return RT_Date(value: Date())
        case .Math_NaN:
            return RT_Real(value: Double.nan)
        case .Math_inf:
            return RT_Real(value: Double.infinity)
        case .Math_pi:
            return RT_Real(value: Double.pi)
        case .Math_e:
            return RT_Real(value: exp(1))
        default:
            throw NoPropertyExists(type: dynamicTypeInfo, property: property)
        }
    }
    
    public override func element(_ type: TypeInfo, named name: String) throws -> RT_Object {
        func element() -> RT_Object? {
            switch Types(type.uri) {
            case .application:
                return RT_Application(named: name)
            case .file:
                return RT_File(value: URL(fileURLWithPath: (name as NSString).expandingTildeInPath))
            case .environmentVariable:
                return RT_EnvVar(name: name)
            default:
                return nil
            }
        }
        guard let elem = element() else {
            return try super.element(type, named: name)
        }
        return elem
    }
    
    public override func element(_ type: TypeInfo, id: RT_Object) throws -> RT_Object {
        func element() -> RT_Object? {
            switch Types(type.uri) {
            case .application:
                guard
                    let appBundleID = id.coerce(to: RT_String.self)?.value,
                    let appBundle = Bundle(applicationBundleIdentifier: appBundleID)
                else {
                    return nil
                }
                return RT_Application(bundle: appBundle)
            default:
                return nil
            }
        }
        guard let elem = element() else {
            return try super.element(type, id: id)
        }
        return elem
    }
    
    public override func elements(_ type: TypeInfo) throws -> RT_Object {
        switch Types(type.uri) {
        case .environmentVariable:
            return RT_List(contents: ProcessInfo.processInfo.environment.keys.map { RT_EnvVar(name: $0) })
        default:
            return try super.elements(type)
        }
    }
    
    public override func compareEqual(with other: RT_Object) -> Bool {
        other.dynamicTypeInfo.isA(dynamicTypeInfo)
    }
    
    public override var hash: Int {
        dynamicTypeInfo.hashValue
    }
    
}

extension RT_Core {
    
    public override var debugDescription: String {
        super.debugDescription
    }
    
}