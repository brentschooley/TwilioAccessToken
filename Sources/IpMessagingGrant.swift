public struct IpMessagingGrant: Grant {
  public var serviceSid: String?
  public var endpointId: String?
  public var deploymentRoleSid: String?
  public var pushCredentialSid: String?

/*  public init(serviceSid: String, endpointId: String, deploymentRoleSid: String? = nil, pushCredentialSid: String? = nil) {
    self.serviceSid = serviceSid
    self.endpointId = endpointId
    self.deploymentRoleSid = deploymentRoleSid
    self.pushCredentialSid = pushCredentialSid
  }
*/
  
  public init() {
    
  }
  
  public var grantKey: String {
    return "ip_messaging"
  }

  public var payload: [String:Any] {
    var payloadValues: [String:String] = [:]

    if let serviceSid = self.serviceSid {
      payloadValues["service_sid"] = serviceSid
    }
    
    if let endpointId = self.endpointId {
      payloadValues["endpoint_id"] = endpointId  
    }

    if let roleSid = self.deploymentRoleSid {
      payloadValues["deployment_role_sid"] = roleSid
    }

    if let pushSid = self.pushCredentialSid {
      payloadValues["push_credential_sid"] = pushSid
    }

    return payloadValues
  }
}
