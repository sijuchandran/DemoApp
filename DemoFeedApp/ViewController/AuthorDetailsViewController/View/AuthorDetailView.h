//
//  AuthorDetailView.h
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthorDetailsInfo+CoreDataClass.h"
#import "PostsInfo+CoreDataClass.h"
#import "Company+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface AuthorDetailView : UIView <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *postLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *websiteLabel;
@property (weak, nonatomic) IBOutlet UITextView *websiteTextView;
@property (weak, nonatomic) IBOutlet UILabel *companyName;
@property (weak, nonatomic) IBOutlet UILabel *phrase;
@property (weak, nonatomic) IBOutlet UILabel *bs;

-(void) buildViewWithAuthorDetail:(AuthorDetailsInfo *) detailInfo andPostInfo: (PostsInfo *) postInfo;
@end

NS_ASSUME_NONNULL_END
