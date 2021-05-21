import Bushel
import SwiftAutomation

public class RT_Core: RT_Object, RT_LocalModule {
    
    private static let typeInfo_ = TypeInfo(.coreObject)
    public override class var typeInfo: TypeInfo {
        typeInfo_
    }
    
    public override var description: String {
        "Core"
    }
    
    public var functions = FunctionSet()
    
    public override init(_ rt: Runtime) {
        super.init(rt)
        
        functions.add(rt, .set, parameters: [.direct: .specifier, .set_to: .item]) { arguments in
            let specifier = try arguments.for(.direct, RT_Specifier.self)
            let newValue = try arguments.for(.set_to)
            guard let property = specifier.property else {
                throw NonPropertyIsNotWritable(specifier: specifier)
            }
            try specifier.parent.evaluate().setProperty(property, to: newValue)
            return newValue
        }
        
        functions.add(rt, .delay, parameters: [.direct: .real]) { arguments in
            let delaySeconds = arguments[.direct, RT_Real.self]?.value ?? 1.0
            Thread.sleep(forTimeInterval: delaySeconds)
            return rt.null
        }
        
        functions.add(rt, .Sequence_add, parameters: [.target: .list, .direct: .item]) { arguments in
            let newItem = try arguments.for(.direct)
            try arguments.for(.target, RT_List.self).contents.append(newItem)
            return newItem
        }
        functions.add(rt, .Sequence_remove, parameters: [.target: .list, .direct: .item]) { arguments in
            let list = try arguments.for(.target, RT_List.self)
            let toRemove = try arguments.for(.direct)
            if let index = list.contents.firstIndex(where: { toRemove.compareEqual(with: $0) }) {
                let item = list.contents[index]
                list.contents.remove(at: index)
                return item
            } else {
                return rt.null
            }
        }
        functions.add(rt, .Sequence_join, parameters: [.direct: .list, .Sequence_join_with: .string]) { arguments in
            let list = try arguments.for(.direct, RT_List.self)
            let separator = try arguments.for(.Sequence_join_with, RT_String.self)
            let strings = list.contents.map { $0.coerce(to: RT_String.self)?.value ?? String(describing: $0) }
            return RT_String(rt, value: strings.joined(separator: separator.value))
        }
        
        functions.add(rt, .String_split, parameters: [.direct: .string, .String_split_by: .string]) { arguments in
            let string = try arguments.for(.direct, RT_String.self)
            let separator = try arguments.for(.String_split_by, RT_String.self)
            return RT_List(rt, contents: string.value.components(separatedBy: separator.value).map { RT_String(rt, value: $0) })
        }
        
        functions.add(rt, .Math_abs, parameters: [.direct: .integer]) { arguments in
            RT_Integer(rt, value: abs(try arguments.for(.direct, RT_Integer.self).value))
        }
        functions.add(rt, .Math_abs, parameters: [.direct: .real]) { arguments in
            RT_Real(rt, value: abs(try arguments.for(.direct, RT_Real.self).value))
        }
        functions.add(rt, .Math_sqrt, parameters: [.direct: .integer]) { arguments in
            RT_Real(rt, value: sqrt(Double(try arguments.for(.direct, RT_Integer.self).value)))
        }
        functions.add(rt, .Math_sqrt, parameters: [.direct: .real]) { arguments in
            RT_Real(rt, value: sqrt(try arguments.for(.direct, RT_Real.self).value))
        }
        functions.add(rt, .Math_cbrt, parameters: [.direct: .integer]) { arguments in
            RT_Real(rt, value: cbrt(Double(try arguments.for(.direct, RT_Integer.self).value)))
        }
        functions.add(rt, .Math_cbrt, parameters: [.direct: .real]) { arguments in
            RT_Real(rt, value: cbrt(try arguments.for(.direct, RT_Real.self).value))
        }
        functions.add(rt, .Math_pow, parameters: [.direct: .integer, .Math_pow_exponent: .integer]) { arguments in
            let integer = try arguments.for(.direct, RT_Integer.self)
            let exponent = try arguments.for(.Math_pow_exponent, RT_Integer.self)
            return RT_Integer(rt, value: Int64(pow(Double(integer.value), Double(exponent.value))))
        }
        functions.add(rt, .Math_pow, parameters: [.direct: .integer, .Math_pow_exponent: .real]) { arguments in
            let integer = try arguments.for(.direct, RT_Integer.self)
            let exponent = try arguments.for(.Math_pow_exponent, RT_Real.self)
            return RT_Real(rt, value: pow(Double(integer.value), exponent.value))
        }
        functions.add(rt, .Math_pow, parameters: [.direct: .real, .Math_pow_exponent: .integer]) { arguments in
            let real = try arguments.for(.direct, RT_Real.self)
            let exponent = try arguments.for(.Math_pow_exponent, RT_Integer.self)
            return RT_Real(rt, value: pow(real.value, Double(exponent.value)))
        }
        functions.add(rt, .Math_pow, parameters: [.direct: .real, .Math_pow_exponent: .real]) { arguments in
            let real = try arguments.for(.direct, RT_Real.self)
            let exponent = try arguments.for(.Math_pow_exponent, RT_Real.self)
            return RT_Real(rt, value: pow(real.value, exponent.value))
        }
        func elementaryFunction(_ function: @escaping (Double) -> Double) -> (_ arguments: RT_Arguments) throws -> RT_Real {
            { arguments in
                let real = try arguments.for(.direct, RT_Real.self)
                return RT_Real(rt, value: function(real.value))
            }
        }
        functions.add(rt, .Math_ln, parameters: [.direct: .real], implementation: elementaryFunction(log))
        functions.add(rt, .Math_log10, parameters: [.direct: .real], implementation: elementaryFunction(log10))
        functions.add(rt, .Math_log2, parameters: [.direct: .real], implementation: elementaryFunction(log2))
        functions.add(rt, .Math_sin, parameters: [.direct: .real], implementation: elementaryFunction(sin))
        functions.add(rt, .Math_cos, parameters: [.direct: .real], implementation: elementaryFunction(cos))
        functions.add(rt, .Math_tan, parameters: [.direct: .real], implementation: elementaryFunction(tan))
        functions.add(rt, .Math_asin, parameters: [.direct: .real], implementation: elementaryFunction(asin))
        functions.add(rt, .Math_acos, parameters: [.direct: .real], implementation: elementaryFunction(acos))
        functions.add(rt, .Math_atan, parameters: [.direct: .real], implementation: elementaryFunction(atan))
        functions.add(rt, .Math_atan2, parameters: [.direct: .real, .Math_atan2_x: .real]) { arguments in
            let y = try arguments.for(.direct, RT_Real.self)
            let x = try arguments.for(.Math_atan2_x, RT_Real.self)
            return RT_Real(rt, value: atan2(y.value, x.value))
        }
        functions.add(rt, .Math_ln, parameters: [.direct: .real], implementation: elementaryFunction(round))
        functions.add(rt, .Math_ln, parameters: [.direct: .real], implementation: elementaryFunction(ceil))
        functions.add(rt, .Math_ln, parameters: [.direct: .real], implementation: elementaryFunction(floor))

        functions.add(rt, .CLI_log, parameters: [.direct: .item]) { arguments in
            let message = try arguments.for(.direct)
            print(message.coerce(to: RT_String.self)?.value ?? String(describing: message))
            return rt.null
        }
    }
    
    public func handle(_ arguments: RT_Arguments) throws -> RT_Object? {
        if
            let commandClass = arguments.command.id.ae8Code?.class,
            commandClass == (try! FourCharCode(fourByteString: "bShG"))
        {
            // Run GUIHost command
            guard let guiHostBundle = Bundle(applicationBundleIdentifier: "com.justcheesy.BushelGUIHost") else {
                throw MissingResource(resourceDescription: "BushelGUIHost application")
            }
            
            var arguments = arguments
            if
                arguments.contents.first(where: { $0.key.uri.ae4Code == Parameters.GUI_ask_title.ae12Code!.code }) == nil,
                let scriptName = Optional("")//rt.topScript.name
            // FIXME: fix
            {
                arguments.contents[ParameterInfo(.GUI_ask_title)] = RT_String(rt, value: scriptName)
            }
            
            return try RT_Application(rt, bundle: guiHostBundle).handle(arguments)
        }
        
        return try self.handleByLocalFunction(arguments)
    }
    
    public override func property(_ property: PropertyInfo) throws -> RT_Object? {
        switch Properties(property.id) {
        case .currentDate:
            return RT_Date(rt, value: Date())
        case .Math_NaN:
            return RT_Real(rt, value: Double.nan)
        case .Math_inf:
            return RT_Real(rt, value: Double.infinity)
        case .Math_pi:
            return RT_Real(rt, value: Double.pi)
        case .Math_e:
            return RT_Real(rt, value: exp(1))
        default:
            return nil
        }
    }
    
    public override func element(_ type: TypeInfo, named name: String) throws -> RT_Object? {
        func element() -> RT_Object? {
            switch Types(type.uri) {
            case .application:
                return RT_Application(rt, named: name)
            case .file:
                return RT_File(rt, value: URL(fileURLWithPath: (name as NSString).expandingTildeInPath))
            case .environmentVariable:
                return RT_EnvVar(rt, name: name)
            default:
                return nil
            }
        }
        guard let elem = element() else {
            return try super.element(type, named: name)
        }
        return elem
    }
    
    public override func element(_ type: TypeInfo, id: RT_Object) throws -> RT_Object? {
        func element() -> RT_Object? {
            switch Types(type.uri) {
            case .application:
                guard
                    let appBundleID = id.coerce(to: RT_String.self)?.value,
                    let appBundle = Bundle(applicationBundleIdentifier: appBundleID)
                else {
                    return nil
                }
                return RT_Application(rt, bundle: appBundle)
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
            return RT_List(rt, contents: ProcessInfo.processInfo.environment.keys.map { RT_EnvVar(rt, name: $0) })
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
