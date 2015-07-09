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

/**
 *  Performs the network request to login in with a given username and password. When the
 *  request returns, calls the completion block with a set of results and an error, both optional.
 *
 *  @param username the uername to log in with. This is the user's email address.
 *  @param password the password to use to authenticate along with the username.
 *  @param complete a block to call with the results of the network call.
 *
 *  @return an NSURLSessionDataTask containing a the request.
 */
-(NSURLSessionDataTask*)loginWithUsername:(NSString*)username
                                 password:(NSString*)password
                                 complete:(KMMGhostLoginNetworkBlock)complete;

/**
 *  Refreshes the access token with a given refresh token. This ensures that the user doesn't have
 *  to continuously log in, and there shouldn't be any reason to store their username and passwrod
 *  locally, just store the refresh token.
 *
 *  @param refreshToken a random string that is used to refresh the access token.
 *  @param complete     a block called with the results of the network request.
 *
 *  @return an NSURLSessionDataTask containing the request.
 */
-(NSURLSessionDataTask*)refreshTokenWithRefreshToken:(NSString*)refreshToken
                                            complete:(KMMGhostLoginNetworkBlock)complete;

@end

NS_ASSUME_NONNULL_END