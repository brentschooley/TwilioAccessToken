public protocol Grant {
  var grantKey: String { get }
  var payload: [String:Any] { get }
}
