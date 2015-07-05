//
//  KMMGhostLoginTokenJSONParserTests.m
//  GhostLoginClient
//
//  Created by Kerr Marin Miller on 04/07/2015.
//  Copyright (c) 2015 Kerr Marin Miller. All rights reserved.
//

@import Foundation;
#import <XCTest/XCTest.h>

#import "KMMGhostLoginTokenJSONParser.h"
#import "KMMGhostLoginToken.h"

@interface KMMGhostLoginTokenJSONParserTests : XCTestCase

@property(nonatomic) KMMGhostLoginTokenJSONParser *parser;

@end

@implementation KMMGhostLoginTokenJSONParserTests

- (void)setUp {
    [super setUp];
    self.parser = [[KMMGhostLoginTokenJSONParser alloc] init];
}

- (void)testCanParserTokenCorrectly {
    NSDictionary *tokenDictionary = @{@"access_token": @"this_is_a_token",
                                      @"refresh_token": @"refresh_token",
                                      @"expires_in": @(3600),
                                      @"token_type": @"Bearer"};
    NSError *error;
    KMMGhostLoginToken *token = [self.parser tokenFromResponse:tokenDictionary error:&error];
    XCTAssertNotNil(token);
    XCTAssertNil(error);
}

-(void)testParserWillProduceAnErrorIfAccessTokenIsMissing {
    NSDictionary *tokenDictionary = @{@"refresh_token": @"refresh_token",
                                      @"expires_in": @(3600),
                                      @"token_type": @"Bearer"};
    NSError *error;
    KMMGhostLoginToken *token = [self.parser tokenFromResponse:tokenDictionary error:&error];
    XCTAssertNil(token);
    XCTAssertNotNil(error);
}

-(void)testParserWillNotProduceAnErrorIfRefreshTokenIsMissing {
    NSDictionary *tokenDictionary = @{@"access_token": @"access_token",
                                      @"expires_in": @(3600),
                                      @"token_type": @"Bearer"};
    NSError *error;
    KMMGhostLoginToken *token = [self.parser tokenFromResponse:tokenDictionary error:&error];
    XCTAssertNotNil(token);
    XCTAssertNil(error);
}

-(void)testParserWillProduceAnErrorIfExpiresInTokenIsMissing {
    NSDictionary *tokenDictionary = @{@"refresh_token": @"refresh_token",
                                      @"access_token": @"access_token",
                                      @"token_type": @"Bearer"};
    NSError *error;
    KMMGhostLoginToken *token = [self.parser tokenFromResponse:tokenDictionary error:&error];
    XCTAssertNil(token);
    XCTAssertNotNil(error);
}

-(void)testParserWillProduceAnErrorIfExpiresInIsNotAnInteger {
    NSDictionary *tokenDictionary = @{@"refresh_token": @"refresh_token",
                                      @"access_token": @"access_token",
                                      @"expires_in": @"not-an-int",
                                      @"token_type": @"Bearer"};
    NSError *error;
    KMMGhostLoginToken *token = [self.parser tokenFromResponse:tokenDictionary error:&error];
    XCTAssertNil(token);
    XCTAssertNotNil(error);
}

-(void)testParserWillProduceAnErrorIfExpiresInIsLessThanZero {
    NSDictionary *tokenDictionary = @{@"refresh_token": @"refresh_token",
                                      @"access_token": @"access_token",
                                      @"expires_in": @(-100),
                                      @"token_type": @"Bearer"};
    NSError *error;
    KMMGhostLoginToken *token = [self.parser tokenFromResponse:tokenDictionary error:&error];
    XCTAssertNil(token);
    XCTAssertNotNil(error);
}

-(void)testParserWillProduceAnErrorIfTokenTypeIsMissing {
    NSDictionary *tokenDictionary = @{@"refresh_token": @"refresh_token",
                                      @"expires_in": @(3600),
                                      @"access_token": @"access_token"};
    NSError *error;
    KMMGhostLoginToken *token = [self.parser tokenFromResponse:tokenDictionary error:&error];
    XCTAssertNil(token);
    XCTAssertNotNil(error);
}

-(void)testParserWillReturnCorrectRefreshToken {
    NSDictionary *tokenDictionary = @{@"refresh_token": @"refresh_token",
                                      @"access_token": @"access_token",
                                      @"expires_in": @(-100),
                                      @"token_type": @"Bearer"};
    NSError *error;
    NSString *token = [self.parser refreshTokenFromResponse:tokenDictionary error:&error];
    XCTAssertNil(error);
    XCTAssertEqualObjects(token, @"refresh_token");
}

@end
