import Bushel
import SwiftAutomation

public class RT_Null: RT_Object, AEEncodable {
    
    internal override init(_ rt: Runtime) {
        super.init(rt)
    }
    
    private static let typeInfo_ = TypeInfo(.null)
    public override class var typeInfo: TypeInfo {
        typeInfo_
    }
    public override var truthy: Bool {
        false
    }
    
    public override var description: String {
        "null"
    }
    
    public override func coerce(to type: TypeInfo) -> RT_Object? {
        switch Types(type.uri) {
        case .string:
            return RT_String(rt, value: "null")
        case .type:
            return RT_Type(rt, value: RT_Null.typeInfo)
        default:
            return super.coerce(to: type)
        }
    }
    
    public func encodeAEDescriptor(_ appData: AppData) throws -> NSAppleEventDescriptor {
        return try MissingValue.encodeAEDescriptor(appData)
    }
    
}
