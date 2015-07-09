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

/**
 *  Initializes this object with a given domain URL. This is the base domain for the 
 *  ghost installation. For example:
 *  
 *  - https://blog.example.com
 *  - http://example.com
 *  - http://example.com/blog
 *
 *  @param domainURL the URL where the Ghost installation is hosted
 *
 *  @return a fully initialized KMMGhostLoginJSONSessionManager
 */
-(instancetype)initWithDomainURL:(NSURL *)domainURL NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END