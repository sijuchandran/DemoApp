//
//  PostsInfo+CoreDataProperties.h
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//
//

#import "PostsInfo+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface PostsInfo (CoreDataProperties)

+ (NSFetchRequest<PostsInfo *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *body;
@property (nonatomic) int16_t idVal;
@property (nullable, nonatomic, copy) NSString *title;
@property (nonatomic) int16_t userId;

@end

NS_ASSUME_NONNULL_END
