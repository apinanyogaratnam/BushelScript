import Bushel
import SwiftAutomation

/// A boolean. Really just a special case of an `RT_Constant`,
/// but modelled as a separate class for convenience.
public class RT_Boolean: RT_Object, AEEncodable {
    
    public let value: Bool
    
    public static let `true` = RT_Boolean(value: true)
    public static let `false` = RT_Boolean(value: false)
    
    public static func withValue(_ value: Bool) -> RT_Boolean {
        value ? `true` : `false`
    }
    
    private init(value: Bool) {
        self.value = value
    }
    
    public override var description: String {
        String(describing: value)
    }
    
    private static let typeInfo_ = TypeInfo(.boolean)
    public override class var typeInfo: TypeInfo {
        typeInfo_
    }
    public override var truthy: Bool {
        value
    }
    
    public static prefix func ! (boolean: RT_Boolean) -> RT_Boolean {
        RT_Boolean.withValue(!boolean.value)
    }
    
    public override func compare(with other: RT_Object) -> ComparisonResult? {
        (other as? RT_Boolean)
            .map { value <=> $0.value }
    }
    
    public override func coerce(to type: TypeInfo) -> RT_Object? {
        switch type.id.ae4Code {
        case typeEnumerated:
            // A boolean "is-a" constant
            // This is how AppleScript handles this coercion
            return self
        case typeSInt64:
            return RT_Integer(value: value ? 1 : 0)
        case typeIEEE64BitFloatingPoint:
            return RT_Real(value: value ? 1 : 0)
        case typeUnicodeText:
            return RT_String(value: value ? "true" : "false")
        default:
            return super.coerce(to: type)
        }
    }
    
    public func encodeAEDescriptor(_ appData: AppData) throws -> NSAppleEventDescriptor {
        return NSAppleEventDescriptor(boolean: value)
    }
    
}

extension RT_Boolean {
    
    public override var debugDescription: String {
        super.debugDescription + "[value: \(value)]"
    }
    
}
