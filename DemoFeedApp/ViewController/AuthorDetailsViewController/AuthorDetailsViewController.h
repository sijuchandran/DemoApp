//
//  AuthorDetailsViewController.h
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthorDetailsInfo+CoreDataClass.h"
#import "PostsInfo+CoreDataClass.h"
#import "AuthorDetailView.h"
#import "AddressViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface AuthorDetailsViewController : UIViewController

@property (strong, nonatomic) AuthorDetailsInfo* detailsInfo;
@property (strong, nonatomic) PostsInfo* postsInfo;
@property (strong, nonatomic) IBOutlet AuthorDetailView *authorDetailView;

@end

NS_ASSUME_NONNULL_END
