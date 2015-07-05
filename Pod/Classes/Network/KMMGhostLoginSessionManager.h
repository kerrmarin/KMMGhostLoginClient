//
//  KMMGhostLoginSessionManager.h
//  Pods
//
//  Created by Kerr Marin Miller on 02/07/2015.
//
//

@import Foundation;

typedef void (^KMMGhostLoginNetworkBlock)(id __nullable results, NSError *__nullable error);

NS_ASSUME_NONNULL_BEGIN

@protocol KMMGhostLoginSessionManager <NSObject>

-(NSURLSessionDataTask*)loginWithUsername:(NSString*)username
                                 password:(NSString*)password
                                 complete:(KMMGhostLoginNetworkBlock)complete;

-(NSURLSessionDataTask*)refreshTokenWithRefreshToken:(NSString*)refreshToken
                                            complete:(KMMGhostLoginNetworkBlock)complete;

@end

NS_ASSUME_NONNULL_END