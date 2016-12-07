import XCTest
@testable import TwilioAccessToken

class TwilioAccessTokenTests: XCTestCase {
    var accessToken: TwilioAccessToken!
    var device: String = "iphone"
    var identity: String = "Brent"

    override func setUp() {
      super.setUp()

      self.accessToken = TwilioAccessToken(
        accountSid: "ACxxxxxxxxxxxxxxxxxx",
        signingKeySid: "SKxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
        secret: "thisismysecret"
      )
    }

    func testDefaultTTL () {
      XCTAssertEqual(self.accessToken.ttl, 3600)
    }

    func testInitSetsAccountSid() {
      XCTAssertEqual(self.accessToken.accountSid, "ACxxxxxxxxxxxxxxxxxx")
    }

    func testInitSetsSigningKeySid() {
      XCTAssertEqual(self.accessToken.signingKeySid, "SKxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
    }

    func testInitSetsSecret() {
      XCTAssertEqual(self.accessToken.secret, "thisismysecret")
    }

    func testChatGrantPayload() {
      var ipmGrant = IpMessagingGrant()
      ipmGrant.serviceSid = "ISxxxxxxxxxxxxxxxxxxxxxxx"
      ipmGrant.endpointId = "TokenTest:\(identity):\(device)"

      if let serviceSid = ipmGrant.payload["service_sid"] as? String {
        XCTAssertEqual(serviceSid, "ISxxxxxxxxxxxxxxxxxxxxxxx")
      }

      if let endpointId = ipmGrant.payload["endpoint_id"] as? String {
        XCTAssertEqual(endpointId, "TokenTest:Brent:iphone")
      }

      XCTAssertNil(ipmGrant.payload["deployment_role_sid"])
      XCTAssertNil(ipmGrant.payload["push_credential_sid"])

      ipmGrant.deploymentRoleSid = "RSxxxx"
      ipmGrant.pushCredentialSid = "PSxxxx"

      if let roleSid = ipmGrant.payload["deployment_role_sid"] as? String {
        XCTAssertEqual(roleSid, "RSxxxx")
      }

      if let pushSid = ipmGrant.payload["push_credential_sid"] as? String {
        XCTAssertEqual(pushSid, "PSxxxx")
      }
    }

    static var allTests : [(String, (TwilioAccessTokenTests) -> () throws -> Void)] {
        return [
            ("testDefaultTTL", testDefaultTTL),
            ("testInitSetsAccountSid", testInitSetsAccountSid),
            ("testInitSetsSigningKeySid", testInitSetsSigningKeySid),
            ("testInitSetsSecret", testInitSetsSecret),
            ("testChatGrantPayload", testChatGrantPayload)
        ]
    }
}
