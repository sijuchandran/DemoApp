//
//  PostInfoTableViewCell.h
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostsInfo+CoreDataClass.h"
NS_ASSUME_NONNULL_BEGIN

@interface PostInfoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *postTitle;
@property (weak, nonatomic) IBOutlet UILabel *postBody;

- (void)configureCellWith:(PostsInfo *) postsInfo;

@end

NS_ASSUME_NONNULL_END
