//
//  KMMGhostTokenResponse.h
//  Pods
//
//  Created by Kerr Marin Miller on 02/07/2015.
//
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface KMMGhostLoginToken : NSObject

/**
 *  The access token used to authenticate with the Ghost installation.
 */
@property(nonatomic, copy, readonly) NSString *accessToken;

/**
 *  the number of seconds after which this token will be invalid
 */
@property(nonatomic, readonly) NSUInteger expiry;

/**
 *  the type of token this is (usually the string "Bearer")
 */
@property(nonatomic, copy, readonly) NSString *tokenType;

/**
 *  Instantiates an instance of KMMGhostLoginToken.
 *
 *  @param accessToken the access token that is to be used to authenticate with the Ghost installation
 *  @param expiry      the number of seconds after which this token will be invalid
 *  @param tokenType   the type of token this is
 *
 *  @return a fully initialized KMMGhostLoginToken.
 */
-(instancetype)initWithAccessToken:(NSString *)accessToken
                            expiry:(NSUInteger)expiry
                         tokenType:(NSString*)tokenType NS_DESIGNATED_INITIALIZER;

-(instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END