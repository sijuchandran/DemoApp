//
//  CoreDataContext.m
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import "CoreDataContext.h"

@implementation CoreDataContext


/** For getting NSManagedObjectContext */
+(NSManagedObjectContext *) getManagedObjectContext {
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = delegate.persistentContainer.viewContext;
    return context;
}




@end
