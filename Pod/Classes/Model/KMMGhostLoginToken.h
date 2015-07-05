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

@property(nonatomic, copy, readonly) NSString *accessToken;
@property(nonatomic, readonly) NSUInteger expiry;
@property(nonatomic, copy, readonly) NSString *tokenType;

-(instancetype)initWithAccessToken:(NSString *)accessToken
                            expiry:(NSUInteger)expiry
                         tokenType:(NSString*)tokenType NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END