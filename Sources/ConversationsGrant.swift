public struct ConversationsGrant: Grant {
  public var configurationProfileSid: String?
  
  public init() {
    
  }
    
  public var grantKey: String {
    return "rtc"
  }

  public var payload: [String:Any] {
    var payloadValues: [String:String] = [:]
    
    if let configurationProfileSid = self.configurationProfileSid {
      payloadValues["configuration_profile_sid"] = configurationProfileSid
    }
    
    return payloadValues
  }
}
