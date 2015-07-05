//
//  KMMGhostLoginTokenJSONSessionManagerTests.m
//  GhostLoginClient
//
//  Created by Kerr Marin Miller on 04/07/2015.
//  Copyright (c) 2015 Kerr Marin Miller. All rights reserved.
//

@import Foundation;
#import <XCTest/XCTest.h>

#import "KMMGhostLoginJSONSessionManager.h"

@interface KMMGhostLoginTokenJSONSessionManagerTests : XCTestCase

@property(nonatomic) KMMGhostLoginJSONSessionManager *manager;

@end

@implementation KMMGhostLoginTokenJSONSessionManagerTests

- (void)setUp {
    [super setUp];
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.example.com"];
    self.manager = [[KMMGhostLoginJSONSessionManager alloc] initWithDomainURL:url];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

/*
 An AFJSONRequestOperation block is created successfully.
 The urlRequest argument is used in creating the AFJSONRequestOperation object.
 The success block is used in creating the AFJSONRequestOperation object.
 The success block performs as expected.
 The failure block is used in creating the AFJSONRequestOperation object.
 The failure block performs as expected.
 The start method is called on the AFJSONRequestOperation object.
 */

-(void)testTaskIsCreatedSuccessfullyForLogin {
    NSURLSessionDataTask *task = [self.manager loginWithUsername:@"hello" password:@"test" complete:^(id results, NSError *error) {}];
    
    XCTAssertNotNil(task);
}

-(void)testCorrectURLHasBeenUsedInManagerForLogin {
    NSURLSessionDataTask *task = [self.manager loginWithUsername:@"hello" password:@"test" complete:^(id results, NSError *error) {
        }];
    XCTAssertEqualObjects(@"http://www.example.com/ghost/api/v0.1/authentication/token", task.currentRequest.URL.absoluteString);
    XCTAssertEqualObjects(task.currentRequest.HTTPMethod, @"POST");
    
    NSString *body = [[NSString alloc] initWithData:task.currentRequest.HTTPBody encoding:NSUTF8StringEncoding];
    NSArray *components = [body componentsSeparatedByString:@"&"];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    for (NSString *keyValue in components) {
        NSArray *pair = [keyValue componentsSeparatedByString:@"="];
        parameters[pair[0]] = pair[1];
    }
    XCTAssertEqualObjects(parameters[@"username"], @"hello");
    XCTAssertEqualObjects(parameters[@"password"], @"test");
    XCTAssertEqualObjects(parameters[@"client_id"], @"ghost-admin");
    XCTAssertEqualObjects(parameters[@"grant_type"], @"password");
}

-(void)testTaskIsCreatedSuccessfullyForRefresh {
    NSURLSessionDataTask *task = [self.manager refreshTokenWithRefreshToken:@"test" complete:^(id results, NSError *error) {}];
    
    XCTAssertNotNil(task);
}

-(void)testCorrectURLHasBeenUsedInManagerForRefresh {
    NSURLSessionDataTask *task = [self.manager refreshTokenWithRefreshToken:@"test" complete:^(id results, NSError *error) {
    }];
    XCTAssertEqualObjects(@"http://www.example.com/ghost/api/v0.1/authentication/token", task.currentRequest.URL.absoluteString);
    XCTAssertEqualObjects(task.currentRequest.HTTPMethod, @"POST");

    NSString *body = [[NSString alloc] initWithData:task.currentRequest.HTTPBody encoding:NSUTF8StringEncoding];
    NSArray *components = [body componentsSeparatedByString:@"&"];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    for (NSString *keyValue in components) {
        NSArray *pair = [keyValue componentsSeparatedByString:@"="];
        parameters[pair[0]] = pair[1];
    }
    XCTAssertEqualObjects(parameters[@"refresh_token"], @"test");
    XCTAssertEqualObjects(parameters[@"client_id"], @"ghost-admin");
    XCTAssertEqualObjects(parameters[@"grant_type"], @"refresh_token");
    
}

-(void)testBlockIsCalledOnLoginError {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Will call completion block on fail"];
    NSURLSessionDataTask *task = [self.manager loginWithUsername:@"hello" password:@"test" complete:^(id results, NSError *error) {
        XCTAssertNil(results);
        XCTAssertNotNil(error);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:task.originalRequest.timeoutInterval handler:^(NSError *error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        }
        [task cancel];
    }];
    
    XCTAssertNotNil(task);
}

-(void)testBlockIsCalledOnRefreshError {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Will call completion block on fail"];
    NSURLSessionDataTask *task = [self.manager refreshTokenWithRefreshToken:@"test" complete:^(id results, NSError *error) {
        XCTAssertNil(results);
        XCTAssertNotNil(error);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:task.originalRequest.timeoutInterval handler:^(NSError *error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        }
        [task cancel];
    }];
    
    XCTAssertNotNil(task);
}

@end
