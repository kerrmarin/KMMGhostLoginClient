//
//  KMMGhostLoginTokenTests.m
//  GhostLoginClient
//
//  Created by Kerr Marin Miller on 04/07/2015.
//  Copyright (c) 2015 Kerr Marin Miller. All rights reserved.
//

@import Foundation;
#import <XCTest/XCTest.h>

#import "KMMGhostLoginToken.h"

@interface KMMGhostLoginTokenTests : XCTestCase

@end

@implementation KMMGhostLoginTokenTests

- (void)testInitialization {
    NSString *accessToken = @"Token";
    NSString *tokenType = @"Type";
    NSInteger expiry = 3000;
    
    KMMGhostLoginToken *token = [[KMMGhostLoginToken alloc] initWithAccessToken:accessToken
                                                                         expiry:expiry
                                                                      tokenType:tokenType];
    XCTAssertNotNil(token);
    XCTAssertEqualObjects(token.accessToken, accessToken);
    XCTAssertEqualObjects(token.tokenType, tokenType);
    XCTAssertEqual(token.expiry, expiry);
}


@end
