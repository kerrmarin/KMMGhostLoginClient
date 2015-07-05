//
//  KMMGhostLoginClientManager.m
//  Pods
//
//  Created by Kerr Marin Miller on 02/07/2015.
//
//

#import "KMMGhostLoginJSONSessionManager.h"

@implementation KMMGhostLoginJSONSessionManager

-(instancetype)initWithDomainURL:(NSURL *)domainURL {
    NSString *fullUrlString = [[domainURL absoluteString] stringByAppendingString:@"/ghost/api/v0.1/authentication/"];
    NSURL *fullUrl = [NSURL URLWithString:fullUrlString];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    [config setHTTPAdditionalHeaders:@{ @"Accept" : @"application/json",
                                        @"Content-Type" : @"x-www-form-urlencoded"}];
    
    //10 seconds timeout for whole resource
    [config setTimeoutIntervalForResource:10];
    //5 second timeout for any communication to occur
    [config setTimeoutIntervalForRequest:5];
    
    self = [super initWithBaseURL:fullUrl sessionConfiguration:config];
    
    return self;
}

-(instancetype)initWithBaseURL:(NSURL *)url sessionConfiguration:(NSURLSessionConfiguration *)configuration {
    NSString *domain = [[NSString alloc] initWithFormat:@"%@//%@", url.scheme, url.host];
    NSURL *domainURL = [NSURL URLWithString:domain];
    self = [self initWithDomainURL:domainURL];
    return self;
}


-(NSURLSessionDataTask *)loginWithUsername:(NSString *)username
                                  password:(NSString *)password
                                  complete:(KMMGhostLoginNetworkBlock)complete {
    NSDictionary *parameters = @{@"grant_type" : @"password",
                                 @"username" : username,
                                 @"password" : password,
                                 @"client_id" : @"ghost-admin"};
    
    NSURLSessionDataTask *task = [self POST:@"token"
                                 parameters:parameters
                                    success:^(NSURLSessionDataTask *task, id responseObject) {
                                        complete(responseObject, nil);
                                    } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                        complete(nil, error);
                                    }];
    return task;
}


-(NSURLSessionDataTask *)refreshTokenWithRefreshToken:(NSString *)refreshToken
                                             complete:(KMMGhostLoginNetworkBlock)complete {
    NSDictionary *parameters = @{@"grant_type" : @"refresh_token",
                                 @"refresh_token" : refreshToken,
                                 @"client_id" : @"ghost-admin"};
    
    NSURLSessionDataTask *task = [self POST:@"token"
                                 parameters:parameters
                                    success:^(NSURLSessionDataTask *task, id responseObject) {
                                        complete(responseObject, nil);
                                    } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                        complete(nil, error);
                                    }];
    return task;
}

@end