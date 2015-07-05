//
//  KMMGhostTokenResponse.m
//  Pods
//
//  Created by Kerr Marin Miller on 02/07/2015.
//
//

#import "KMMGhostLoginToken.h"

@implementation KMMGhostLoginToken

-(instancetype)initWithAccessToken:(NSString *)accessToken
                            expiry:(NSUInteger)expiry
                         tokenType:(NSString *)tokenType {
    if(self = [super init]) {
        _accessToken = [accessToken copy];
        _expiry = expiry;
        _tokenType = [tokenType copy];
    }
    return self;
}

@end
