# GhostLoginClient

[![CI Status](https://travis-ci.org/kerrmarin/KMMGhostLoginClient.svg?branch=master)](https://travis-ci.org/kerrmarin/GhostLoginClient)
[![Version](https://img.shields.io/cocoapods/v/GhostLoginClient.svg?style=flat)](http://cocoapods.org/pods/GhostLoginClient)
[![License](https://img.shields.io/cocoapods/l/GhostLoginClient.svg?style=flat)](http://cocoapods.org/pods/GhostLoginClient)
[![Platform](https://img.shields.io/cocoapods/p/GhostLoginClient.svg?style=flat)](http://cocoapods.org/pods/GhostLoginClient)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

To login to a Ghost blog use the `KMMGhostLoginClient`, then create an instance of a class that conforms to `KMMGhostLoginTokenParser` (e.g. `KMMGhostLoginTokenJSONParser`) and an instance of a class that conforms to `KMMGhostLoginSessionManager` (e.g. `KMMGhostLoginJSONSessionManager`). Use these objects to create a login client:

```objective-c

KMMGhostLoginClient *client = [[KMMGhostLoginClient alloc] initWithManager:manager parser:parser];
    [client loginWithUsername:@"username"
                     password:@"password"
                     complete:^(KMMGhostLoginToken *__nullable token, NSError *__nullable error) {
        if(error) {
            NSLog(@"An error occurred");
        } else {
            //Use token here to get your auth token
            NSString *accessToken = token.accessToken;
        }
    }];

```


## Requirements

This project requires the latest iOS, iOS 8.4. It also has a dependency on AFNetworking version 2.5.4.

## Installation

GhostLoginClient is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "KMMGhostLoginClient"
```

## Author

Kerr Marin Miller, @kerrmarin, www.kerrmarin.com

## License

GhostLoginClient is available under the MIT license. See the LICENSE file for more info.
