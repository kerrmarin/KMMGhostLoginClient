//
//  KMMGhostLoginClientTests.m
//  GhostLoginClient
//
//  Created by Kerr Marin Miller on 08/07/2015.
//  Copyright (c) 2015 Kerr Marin Miller. All rights reserved.
//

@import UIKit;
#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>

#import "KMMGhostLoginClient.h"
#import "KMMGhostLoginTokenJSONParser.h"
#import "KMMGhostLoginJSONSessionManager.h"

@interface KMMGhostLoginClientTests : XCTestCase

@end

@implementation KMMGhostLoginClientTests


-(void)testInitialization {
    id<KMMGhostLoginTokenParser> parser = mockProtocol(@protocol(KMMGhostLoginTokenParser));
    id<KMMGhostLoginSessionManager> manager = mockProtocol(@protocol(KMMGhostLoginSessionManager));
    
    KMMGhostLoginClient *client = [[KMMGhostLoginClient alloc] initWithManager:manager parser:parser];
    XCTAssertNotNil(client);
}



@end
