//
//  KMMGhostLoginClient.m
//  Pods
//
//  Created by Kerr Marin Miller on 02/07/2015.
//
//

#import "KMMGhostLoginClient.h"

@interface KMMGhostLoginClient ()

@property(nonatomic) id<KMMGhostLoginSessionManager> manager;
@property(nonatomic) id<KMMGhostLoginTokenParser> parser;

@property(nonatomic) KMMGhostLoginToken *token;
@property(nonatomic, copy) NSString *refreshToken;
@property(nonatomic) NSTimer *timer;

@end

@implementation KMMGhostLoginClient

-(instancetype)initWithManager:(id<KMMGhostLoginSessionManager>)manager
                        parser:(id<KMMGhostLoginTokenParser>)parser {
    if(self = [super init]) {
        _manager = manager;
        _parser = parser;
    }
    return self;
}

-(void)dealloc {
    [_timer invalidate];
    _timer = nil;
}

-(void)loginWithUsername:(NSString *)username
                password:(NSString *)password
                complete:(KMMGhostLoginBlock)complete {
    [self.manager loginWithUsername:username password:password complete:^(id results, NSError *error) {
        if(error) {
            if(complete) {
                complete(nil, error);
            }
        } else {
            self.token = [self.parser tokenFromResponse:results error:&error];
            if(self.token) {
                if(complete) {
                    complete(self.token, nil);
                }
                //Schedule a token refresh automatically if we can find a refresh token in the response
                NSString *refreshToken = [self.parser refreshTokenFromResponse:results error:nil];
                if(refreshToken) {
                    self.refreshToken = refreshToken;
                    [self.timer invalidate];
                    [self setRefreshTimer];
                }
            } else {
                if(complete) {
                    complete(nil, error);
                }
            }
        }
    }];
}

-(void)setRefreshTimer {
    //Refresh the token before it expires
    NSTimeInterval refreshInterval = self.token.expiry * 0.9;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:refreshInterval
                                                  target:self
                                                selector:@selector(tick:)
                                                userInfo:nil
                                                 repeats:YES];
}

-(void)tick:(NSTimer*)timer {
    [self.manager refreshTokenWithRefreshToken:self.refreshToken
                                      complete:^(id results, NSError *error) {
                                          if(!error) {
                                              self.token = [self.parser tokenFromResponse:results error:&error];
                                              if(error) {
                                                  NSAssert(NO, @"Error parsing the refresh token");
                                              }
                                          }
    }];
}

-(void)storeRefreshToken {
    
}

@end