//
//  PostInfoTableViewCell.m
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import "PostInfoTableViewCell.h"

@implementation PostInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/**
 * Function to configure cell with PostInfo data
 *
 */
- (void)configureCellWith:(PostsInfo *) postsInfo{
    // Fetch Record
  
    self.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    // Update Cell
    [self.postTitle setText: postsInfo.title];
    [self.postBody setText: postsInfo.body];
   
}

@end
