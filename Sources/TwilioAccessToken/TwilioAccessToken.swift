import Foundation
import JWT

public struct TwilioAccessToken {
  public var signingKeySid: String
  public var accountSid: String
  public var secret: String
  public var identity: String?
  public var ttl: Int
  public var grants: [Grant] = []
  public var nbf: Int?

  public init(accountSid: String, signingKeySid: String, secret: String, ttl: Int = 3600) {
    self.signingKeySid = signingKeySid
    self.accountSid = accountSid
    self.secret = secret
    self.ttl = ttl
  }

  public mutating func addGrant(_ grant: Grant) {
    self.grants.append(grant)
  }

  public func toJwt() -> String {
    let now = Int(Date().timeIntervalSince1970)
    let headers = ["cty": "twilio-fpa;v=1"]

    var grantPayload: [String:Any] = [:]

    if let identity = self.identity {
      grantPayload["identity"] = identity
    }

    for grant in self.grants {
      grantPayload[grant.grantKey] = grant.payload
    }

    var payload: [String:Any] = [:]
    payload["jti"] = "\(self.signingKeySid)-\(now)"
    payload["iss"] = self.signingKeySid
    payload["sub"] = self.accountSid
    payload["exp"] = now + self.ttl
    payload["grants"] = grantPayload

    if let nbf = self.nbf {
      payload["nbf"] = nbf
    }

    let token = JWT.encode(
      payload,
      additionalHeaders: headers,
      algorithm: .hs256(self.secret.data(using: .utf8)!)
    )

    return token
  }
}
