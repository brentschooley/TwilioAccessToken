public struct IpMessagingGrant: Grant {
  var serviceSid: String
  var endpointId: String
  var deploymentRoleSid: String?
  var pushCredentialSid: String?

  public init(serviceSid: String, endpointId: String, deploymentRoleSid: String? = nil, pushCredentialSid: String? = nil) {
    self.serviceSid = serviceSid
    self.endpointId = endpointId
    self.deploymentRoleSid = deploymentRoleSid
    self.pushCredentialSid = pushCredentialSid
  }

  var grantKey: String {
    return "ip_messaging"
  }

  var payload: [String:Any] {
    var payloadValues: [String:String] = [:]

    payloadValues["service_sid"] = self.serviceSid
    payloadValues["endpoint_id"] = self.endpointId

    if let roleSid = self.deploymentRoleSid {
      payloadValues["deployment_role_sid"] = roleSid
    }

    if let pushSid = self.pushCredentialSid {
      payloadValues["push_credential_sid"] = pushSid
    }

    return payloadValues
  }
}
