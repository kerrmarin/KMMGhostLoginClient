//
//  KMMGhostLoginTokenParser.m
//  Pods
//
//  Created by Kerr Marin Miller on 02/07/2015.
//
//

#import "KMMGhostLoginTokenJSONParser.h"
#import "KMMGhostLoginToken.h"

@implementation KMMGhostLoginTokenJSONParser

-(nullable KMMGhostLoginToken*)tokenFromResponse:(NSDictionary *)response
                                           error:(NSError *__autoreleasing *)error {

    NSString *accessToken = response[@"access_token"];
    NSInteger expiry = [response[@"expires_in"] integerValue];
    NSString *tokenType = response[@"token_type"];

    if([accessToken isKindOfClass:[NSString class]] &&
        expiry > 0 &&
        [tokenType isKindOfClass:[NSString class]]) {
        KMMGhostLoginToken *token = [[KMMGhostLoginToken alloc] initWithAccessToken:accessToken
                                                                             expiry:expiry
                                                                          tokenType:tokenType];
        return token;
    }

    *error = [[NSError alloc] initWithDomain:KMMGhostLoginTokenParserParseError
                                        code:KMMGhostLoginTokenErrorCodeUnexpectedTypes
                                    userInfo:@{NSLocalizedDescriptionKey : @"Error Parsing JSON - access_token, and token_types must exist and be strings, expiry must be a positive integer."}];
    return nil;
}

-(nullable NSString *)refreshTokenFromResponse:(id)response error:(NSError **)error {
    NSString *refreshToken = response[@"refresh_token"];
    if([refreshToken isKindOfClass:[NSString class]]) {
        return refreshToken;
    }
    *error = [[NSError alloc] initWithDomain:KMMGhostLoginRefreshTokenParserParseError
                                        code:KMMGhostLoginTokenErrorCodeUnexpectedTypes
                                    userInfo:@{NSLocalizedDescriptionKey : @"Error Parsing JSON - refresh_token must exist."}];
    return nil;
}

@end
