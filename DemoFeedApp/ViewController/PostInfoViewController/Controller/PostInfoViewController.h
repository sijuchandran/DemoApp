//
//  PostInfoViewController.h
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostInfoTableView.h"
#import "AuthorDetailsDataHelper.h"
#import "CoreDataContext.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostInfoViewController : UIViewController <PostInfoTableViewDelegate>
@property (weak, nonatomic) IBOutlet PostInfoTableView *postInfoTableView;

@end

NS_ASSUME_NONNULL_END
