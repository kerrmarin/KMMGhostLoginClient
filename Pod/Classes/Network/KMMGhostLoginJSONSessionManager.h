//
//  KMMGhostLoginClientManager.h
//  Pods
//
//  Created by Kerr Marin Miller on 02/07/2015.
//
//

#import <AFNetworking/AFNetworking.h>
#import "KMMGhostLoginSessionManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface KMMGhostLoginJSONSessionManager : AFHTTPSessionManager <KMMGhostLoginSessionManager>

-(instancetype)initWithDomainURL:(NSURL *)domainURL NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END