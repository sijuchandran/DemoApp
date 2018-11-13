//
//  PostsDataHelper.h
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "CoreDataContext.h"


NS_ASSUME_NONNULL_BEGIN

@interface PostsDataHelper : NSObject

/*!
 @brief Function to parse the response data and save it to coredata
 
 @param  postInfoarray The array of posts.
 
 */
+(void)parsePostInfoResponse:(NSMutableArray *) postInfoarray;

@end

NS_ASSUME_NONNULL_END
