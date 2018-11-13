//
//  SessionConfig.h
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 11/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import <Foundation/Foundation.h>

/** Object for specifying settings for session configuration */
@interface SessionConfig : NSObject

/** requestTimeout - NSNumber float for the request timeout */
@property(nonatomic,strong)NSNumber *requestTimeout;

/** resourceTimeout - NSNumber float for the resource timeout */
@property(nonatomic, strong)NSNumber *resourceTimeout;

@end
