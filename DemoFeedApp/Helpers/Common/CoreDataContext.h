//
//  CoreDataContext.h
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataContext : NSObject

+(NSManagedObjectContext *) getManagedObjectContext;

@end

NS_ASSUME_NONNULL_END
