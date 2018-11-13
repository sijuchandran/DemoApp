//
//  ConnectionObjectHelper.h
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConnectionObject.h"

@interface ConnectionObjectHelper : NSObject

+ (ConnectionObjectHelper *)sharedConnectionObjectHelper;
/*!
 @brief Function to get the connection Object of Post request request
 
 @return ConnectionObject with URL, HTTP Method
 
 */
+ (ConnectionObject*) getPostsConnectionObject;

/*!
 @brief Function to get the connection Object of details request request
 
 @return ConnectionObject with URL, HTTP Method
 
 */
+ (ConnectionObject*) getDetailsConnectionObject;

@end
