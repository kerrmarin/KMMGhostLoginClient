//
//  KMMGhostLoginTokenParser.h
//  Pods
//
//  Created by Kerr Marin Miller on 02/07/2015.
//
//

@import Foundation;

@class KMMGhostLoginToken;

typedef NS_ENUM(NSInteger, KMMGhostLoginTokenErrorCode) {
    KMMGhostLoginTokenErrorCodeUnknown = 0,
    KMMGhostLoginTokenErrorCodeUnexpectedTypes
};

NS_ASSUME_NONNULL_BEGIN

extern NSString *KMMGhostLoginTokenParserParseError;
extern NSString *KMMGhostLoginRefreshTokenParserParseError;

@protocol KMMGhostLoginTokenParser <NSObject>

/**
 *  Takes a response from the session manager and parses it into a KMMGhostLoginToken.
 *  This may return nil if the response is not valid.
 *
 *  @param response a response string, usually JSON or XML
 *  @param error    an error passed in to be populated if the parsing fails.
 *
 *  @return potentially, a KMMGhostLoginToken containing the access token to use when
 *  authenticating against the Ghost installation.
 */
-(nullable KMMGhostLoginToken*)tokenFromResponse:(id)response error:(NSError**)error;

/**
 *  Takes a response from the session manager and parses it into a valid refresh token string.
 *
 *  @param response the response from the server. This usually comes in JSON or XML format.
 *  @param error    an error passed in to be populated if the parsing fails.
 *
 *  @return potentially, an NSString object containing the refresh token for this user.
 */
-(nullable NSString *)refreshTokenFromResponse:(id)response error:(NSError**)error;

@end

NS_ASSUME_NONNULL_END