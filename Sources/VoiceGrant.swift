public struct VoiceGrant: Grant {
  public var outgoingApplicationSid: String?
  public var outgoingApplicationParams: [String:String]?
  public var pushCredentialsSid: String?
  public var endpointId: String?
  
  public init() {
    
  }
  
  public var grantKey: String {
    return "voice"
  }
  
  public var payload: [String:Any] {
    var payloadValues: [String:Any] = [:]
    
    if let outgoingApplicationSid = self.outgoingApplicationSid {
      var outgoing = [String:Any]()
      outgoing["application_sid"] = outgoingApplicationSid
      
      if let outgoingApplicationParams = self.outgoingApplicationParams {
        outgoing["params"] = outgoingApplicationParams
      }
      
      payloadValues["outgoing"] = outgoing
    }
    
    if let pushCredentialsSid = self.pushCredentialsSid {
      payloadValues["push_credential_sid"] = pushCredentialsSid
    }
    
    if let endpointId = self.endpointId {
      payloadValues["endpoint_id"] = endpointId
    }
    
    return payloadValues
  }
}
