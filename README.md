# TwilioAccessToken

[![Build Status](https://travis-ci.org/brentschooley/TwilioAccessToken.svg?branch=master)](https://travis-ci.org/brentschooley/TwilioAccessToken)
![Platforms](https://img.shields.io/badge/platforms-Linux%20%7C%20OS%20X-blue.svg)
[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

> Swift library for creating [access tokens for Twilio SDKs](https://www.twilio.com/docs/api/rest/access-tokens) from servers written in Swift.

**DISCLAIMER:** Please do not use this directly in your iOS apps to generate tokens. Storing your Twilio credentials client-side is never a good idea. This library is intended for use with server-side Swift web frameworks like [Vapor](https://vapor.codes) or [Kitura](https://github.com/IBM-Swift/Kitura).

# Installation

## Swift Package Manager

```swift
.Package(url: "https://github.com/brentschooley/TwilioAccessToken.git", majorVersion: 0, minor: 5)
```

# Usage
You'll need a Twilio account so [sign-up for a free trial first](https://twilio.com/try-twilio).

Set up your Twilio credentials in environment variables. You'll need at least the following:

* Twilio Account Sid (stored as `TWILIO_ACCOUNT_SID`) - find it in the [Console](https://twilio.com/console)
* [Create an API Key](https://www.twilio.com/console/dev-tools/api-keys) and store the `TWILIO_SIGNING_KEY` and `TWILIO_SECRET` for this key

Start by creating an access token and setting an identity (this can be a username or whatever):

```swift
var accessToken = TwilioAccessToken(
  accountSid: accountSid,
  signingKeySid: signingKeySid,
  secret: secret
)

accessToken.identity = identity
```

Next, you'll want to create a grant or multiple grants that provide access to Twilio SDKs. This library supports generating tokens for [Programmable Video](https://www.twilio.com/docs/api/video/getting-started), [Programmable Chat](https://www.twilio.com/docs/tutorials/walkthrough/chat/ios/swift), and [Programmable Voice](https://www.twilio.com/docs/api/voice-sdk/ios/getting-started).

To generate a video grant, use this code:

```swift
var videoGrant = VideoGrant()
videoGrant.configurationProfileSid = "VS4xxxxxx" // your video configuration profile sid here
```

To generate a chat grant, use this code:

```swift
var chatGrant = IpMessagingGrant()
chatGrant.serviceSid = "IPMSxxxxxxxx" // your chat service sid here
chatGrant.endpointId = "NameOfApp:identity:device"
```

To generate a voice grant, use this code:

```swift
var voiceGrant = VoiceGrant()
voiceGrant.outgoingApplicationSid = "APxxxxxx" // your TwiML app sid here
voiceGrant.outgoingApplicationParams = ["To": "+12155551234", "From": "+14155551234"]
voiceGrant.endpointId = "NameOfApp:identity:device"
```

Once you've created your grant(s) you can add them to the token:

```swift
accessToken.addGrant(videoGrant)
```

Finally, you can return the [JWT](jwt.io) representation of the token:

```swift
accessToken.toJWT()
```

To read about how to use this in a [Vapor](https://vapor.codes) app, [read this blog post](https://twilio.com/blog).

:gift_heart: Contributing
------------
Please create an issue with a description of your problem or open a pull request with a fix.

:v: License
-------
MIT
