//
//  Company+CoreDataProperties.m
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//
//

#import "Company+CoreDataProperties.h"

@implementation Company (CoreDataProperties)

+ (NSFetchRequest<Company *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Company"];
}

@dynamic companyName;
@dynamic bs;
@dynamic catchPhrase;
@dynamic author;

@end
