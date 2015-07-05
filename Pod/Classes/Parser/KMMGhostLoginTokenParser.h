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

-(nullable KMMGhostLoginToken*)tokenFromResponse:(id)response error:(NSError**)error;
-(nullable NSString *)refreshTokenFromResponse:(id)response error:(NSError**)error;

@end

NS_ASSUME_NONNULL_END