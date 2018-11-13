//
//  SyncHelper.h
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//


#import "ConnectionHelper.h"
#import "ConnectionObjectHelper.h"

@interface SyncHelper : NSObject

+(void)getPosts:(void (^)(bool))completionBlock;
+(void)getDetails:(void (^)(bool))completionBlock;
+(void)syncLoggedInContent:(void (^)(bool))completionBlock;

@end
