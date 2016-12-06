public struct SyncGrant: Grant {
  public var serviceSid: String?
  public var endpointId: String?

  public init() {

  }

  public var grantKey: String {
    return "data_sync"
  }

  public var payload: [String:Any] {
    var payloadValues: [String:String] = [:]

    if let serviceSid = self.serviceSid {
      payloadValues["service_sid"] = serviceSid
    }

    if let endpointId = self.endpointId {
      payloadValues["endpoint_id"] = endpointId
    }

    return payloadValues
  }
}
