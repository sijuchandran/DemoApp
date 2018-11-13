//
//  ReachabilityManager.m
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 11/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import "ReachabilityManager.h"
#import "Reachability.h"

@implementation ReachabilityManager

#pragma mark -
#pragma mark Default Manager
+ (ReachabilityManager *)sharedManager
{
    static ReachabilityManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] init];
    });
    
    return _sharedManager;
}

#pragma mark -
#pragma mark Memory Management
- (void)dealloc
{
    // Stop Notifier
    if (_reachability)
    {
        [_reachability stopNotifier];
    }
}

#pragma mark -
#pragma mark Class Methods
+ (BOOL)isReachable
{
    return [[[ReachabilityManager sharedManager] reachability] isReachable];
}

+ (BOOL)isUnreachable
{
    return ![[[ReachabilityManager sharedManager] reachability] isReachable];
}

+ (BOOL)isReachableViaWWAN
{
    return [[[ReachabilityManager sharedManager] reachability] isReachableViaWWAN];
}

+ (BOOL)isReachableViaWiFi
{
    return [[[ReachabilityManager sharedManager] reachability] isReachableViaWiFi];
}

#pragma mark -
#pragma mark Private Initialization
- (id)init
{
    self = [super init];
    
    if (self)
    {
        // Initialize Reachability
        _reachability = [Reachability reachabilityWithHostname:@"www.google.com"];
        
        // Start Monitoring
        [_reachability startNotifier];
    }
    
    return self;
}

@end
