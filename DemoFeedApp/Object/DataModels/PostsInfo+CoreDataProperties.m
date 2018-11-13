//
//  PostsInfo+CoreDataProperties.m
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//
//

#import "PostsInfo+CoreDataProperties.h"

@implementation PostsInfo (CoreDataProperties)

+ (NSFetchRequest<PostsInfo *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"PostsInfo"];
}

@dynamic body;
@dynamic idVal;
@dynamic title;
@dynamic userId;

@end
