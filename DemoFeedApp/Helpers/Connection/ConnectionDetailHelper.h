//
//  ConnectionDetailHelper.h
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SessionConfig.h"


/** Helper class for the connection details */
@interface ConnectionDetailHelper : NSObject

/**
 * Function to create the connection detail helper instance
 *
 * @return ConnectionDetailHelper
 */
+ (ConnectionDetailHelper *)sharedConnectionDetailHelper;

/**
 * Function to get the URL base
 *
 * @return NSString - the base URL
 */
+(NSString*)getURLBase;

/**
 * Function to set the URL base
 *
 * @param urlBaseString - NSString for the URL base
 */
+(void)setupURLBase:(NSString*)urlBaseString;
/*
 * Function to set the session config
 *
 * @param sessionConfig - SessionConfig object
 */
+(void)setupSessionConfig:(SessionConfig *)sessionConfig;

/**
 * Function to get the session config object
 *
 * @return SessionConfig
 */
+(SessionConfig *)getSessionConfig;



@end
