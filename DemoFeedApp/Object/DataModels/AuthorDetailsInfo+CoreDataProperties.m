//
//  AuthorDetailsInfo+CoreDataProperties.m
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//
//

#import "AuthorDetailsInfo+CoreDataProperties.h"

@implementation AuthorDetailsInfo (CoreDataProperties)

+ (NSFetchRequest<AuthorDetailsInfo *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"AuthorDetailsInfo"];
}

@dynamic email;
@dynamic idVal;
@dynamic name;
@dynamic phone;
@dynamic username;
@dynamic website;
@dynamic address;
@dynamic company;

@end
