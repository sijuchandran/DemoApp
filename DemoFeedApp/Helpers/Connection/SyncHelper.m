//
//  SyncHelper.m
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import "SyncHelper.h"
#import "ReachabilityManager.h"
#import "ConnectionObject.h"
#import "PostsDataHelper.h"
#import "AuthorDetailsDataHelper.h"


@implementation SyncHelper

#pragma mark - get functions

/*!
@brief Function to get the PostInfo response from server
*/

+(void)getPosts:(void (^)(bool))completionBlock
{
    ConnectionObject *conObject = [ConnectionObjectHelper getPostsConnectionObject];
    
    ConnectionHelper *conHelp = [[ConnectionHelper alloc] init];
    [conHelp callGeneralService:conObject postData:NULL completionHandler:^(bool success){
        if (success)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSMutableArray *postsInfoArray = (NSMutableArray *)[conHelp getResponseData];
                [PostsDataHelper parsePostInfoResponse:postsInfoArray];
            });

        }
        completionBlock(success);
    }];
    
}

/*!
 @brief Function to get the author details response from server
 */

+(void)getDetails:(void (^)(bool))completionBlock
{
    ConnectionObject *conObject = [ConnectionObjectHelper getDetailsConnectionObject];
    
    ConnectionHelper *conHelp = [[ConnectionHelper alloc] init];
    [conHelp callGeneralService:conObject postData:NULL completionHandler:^(bool success){
        if (success)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSMutableArray *authorDetailsArray = (NSMutableArray *)[conHelp getResponseData];
                [AuthorDetailsDataHelper parseAuthorDetailsResponse:authorDetailsArray];
            });
        } else {
        
        }
        completionBlock(success);
    }];
    
}

/*!
 @brief Call back funtion to retrive the all the data from service
 */

+(void)syncLoggedInContent:(void (^)(bool))completionBlock
{
    __block int completionCounter = 0;
    __block int totalServices = 2;
    
 
    if ([ReachabilityManager isReachable])
    {
        [self getPosts:^(bool success){
            if (success)
            {
                completionCounter++;
                if (completionCounter == totalServices)
                {
                    completionBlock(YES);
                }
            }
            else
            {
                completionBlock(NO);
            }
        }];
    }
    else
    {
        completionBlock(NO);
    }
    
    if ([ReachabilityManager isReachable])
    {
        [self getDetails:^(bool success){
            if (success)
            {
                completionCounter++;
                if (completionCounter == totalServices)
                {
                    completionBlock(YES);
                }
            }
            else
            {
                completionBlock(NO);
            }
        }];
    }
    else
    {
        completionBlock(NO);
    }
    
    
    
    
}







@end
