//
//  Address+CoreDataProperties.m
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//
//

#import "Address+CoreDataProperties.h"

@implementation Address (CoreDataProperties)

+ (NSFetchRequest<Address *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Address"];
}

@dynamic street;
@dynamic suite;
@dynamic city;
@dynamic zipcode;
@dynamic lat;
@dynamic lag;
@dynamic author;

@end
