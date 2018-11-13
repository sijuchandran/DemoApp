//
//  PostInfoTableView.h
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostInfoTableViewCell.h"
#import "PostsInfo+CoreDataClass.h"
NS_ASSUME_NONNULL_BEGIN

@protocol PostInfoTableViewDelegate <NSObject>

-(void) showDetails:(PostsInfo *) postInfo;

@end

@interface PostInfoTableView : UITableView <UITableViewDelegate , UITableViewDataSource>

@property (weak, nonatomic) id <PostInfoTableViewDelegate> postInfoDelegate;

-(void) loadPostTableViewWith:(NSFetchedResultsController *) fetchedResultsController;
@end

NS_ASSUME_NONNULL_END
