//
//  ReachabilityManager.h
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 11/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//


@class Reachability;

/** Reachability Manager to ensure connectivity to the back end is tracked */
@interface ReachabilityManager : NSObject

/** @name Properties */

/** reachability - Reachability object */
@property (strong, nonatomic) Reachability *reachability;

/** @name Functions */

#pragma mark -
#pragma mark Shared Manager
/**
 * Function to setup the shared manager
 *
 * @return ReachabilityManager - the shared reachability manager
 */
+ (ReachabilityManager *)sharedManager;

/**
 * Function to deallocate the memory
 */
- (void)dealloc;

/**
 * Function to initialise the helper
 *
 * @return id - the helper
 */
- (id)init;

#pragma mark -
#pragma mark Class Methods
/**
 * Function that returns YES if it is reachable
 *
 * @return BOOL - YES if reachable, NO if not
 */
+ (BOOL)isReachable;

/**
 * Function to return if the server is unreachable
 *
 * @return BOOL - YES if unreachable, NO if not
 */
+ (BOOL)isUnreachable;

/**
 * Function to return if the server is reachable via cellular data
 *
 * @return BOOL - YES if reachable, NO if not
 */
+ (BOOL)isReachableViaWWAN;

/**
 * Function to return if the server is reachable via WIFI
 *
 * @return BOOL - YES if reachable, NO if not
 */
+ (BOOL)isReachableViaWiFi;

@end
