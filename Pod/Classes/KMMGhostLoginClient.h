//
//  KMMGhostLoginClient.h
//  Pods
//
//  Created by Kerr Marin Miller on 02/07/2015.
//
//

@import Foundation;

#import "KMMGhostLoginToken.h"
#import "KMMGhostLoginTokenParser.h"
#import "KMMGhostLoginSessionManager.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^KMMGhostLoginBlock)(KMMGhostLoginToken *__nullable token, NSError *__nullable error);

@interface KMMGhostLoginClient : NSObject

/**
 *  Once the login client has logged in, the access token will be present. Use this token
 *  and its associated accessToken to authentcate requests to the Ghost server.
 *  This property will be nil until a login has completed successfully. It will also change
 *  if the accessToken is going to expire, a new token will be created and replace the current one.
 */
@property(nonatomic, readonly) KMMGhostLoginToken *token;

/**
 *  Designated initializer for the login client. Creates a login client with a given 
 *  session manager and a parser.
 *
 *  @param manager an instance of a class that conforms to the KMMGhostLoginSessionManager
 *  protocol.
 *  @param parser  an instance of a class that conforms to the KMMGhostLoginTokenParser protocol.
 *
 *  @return a fully initialized KMMGhostLoginClient.
 */
-(instancetype)initWithManager:(id<KMMGhostLoginSessionManager>)manager
                        parser:(id<KMMGhostLoginTokenParser>)parser NS_DESIGNATED_INITIALIZER;

-(instancetype)init NS_UNAVAILABLE;

/**
 *  Logs a user in with a username and password. Pass in an optional completion block to immediately
 *  retrieve the value of the token.
 *
 *  @param username the username to login to the Ghost installation with. This is the user's email.
 *  @param password the user's password for the given username.
 *  @param complete an optional block to execute when the request returns.
 */
-(void)loginWithUsername:(NSString *)username
                password:(NSString *)password
                complete:(nullable KMMGhostLoginBlock)complete;

@end

NS_ASSUME_NONNULL_END