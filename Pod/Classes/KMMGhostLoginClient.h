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

@property(nonatomic, readonly) KMMGhostLoginToken *token;

-(instancetype)initWithManager:(id<KMMGhostLoginSessionManager>)manager
                        parser:(id<KMMGhostLoginTokenParser>)parser NS_DESIGNATED_INITIALIZER;

-(void)loginWithUsername:(NSString *)username
                password:(NSString *)password
                complete:(KMMGhostLoginBlock)complete;

@end

NS_ASSUME_NONNULL_END