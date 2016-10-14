public protocol Grant {
  public var grantKey: String { get }
  public var payload: [String:Any] { get }
}
