//
//  AuthorDetailsDataHelper.h
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthorDetailsDataHelper.h"
#import "AuthorDetailsInfo+CoreDataClass.h"
#import "CoreDataContext.h"
NS_ASSUME_NONNULL_BEGIN

@interface AuthorDetailsDataHelper : NSObject


/*!
 @brief Function to parse the response data and save it to coredata
 
 @param  authorInfoArray The array of author details.

 */

+(void)parseAuthorDetailsResponse:(NSMutableArray *) authorInfoArray;

/*!
 @brief Get the author details from cordata using UserId
 
 @param  userId The userId value of the Posts.
 
 */

+(AuthorDetailsInfo *) getAuthorDetailsUsingUserId:(NSInteger) userId;

@end

NS_ASSUME_NONNULL_END
