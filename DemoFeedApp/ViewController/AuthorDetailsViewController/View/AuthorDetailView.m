//
//  AuthorDetailView.m
//  DemoFeedApp
//
//  Created by Siju Satheesachandran on 12/11/2018.
//  Copyright © 2018 Siju Satheesachandran. All rights reserved.
//

#import "AuthorDetailView.h"


@implementation AuthorDetailView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/*!
@brief Function to configure the author details view

@param  detailInfo The author details NSManaged Object
@param  postInfo TThe author postInfo NSManaged Object

*/
-(void) buildViewWithAuthorDetail:(AuthorDetailsInfo *) detailInfo andPostInfo: (PostsInfo *) postInfo{
    
    _websiteTextView.delegate = self;
    
    NSMutableAttributedString * str = [[NSMutableAttributedString alloc] initWithString:detailInfo.website];
    ;
    [str addAttribute: NSLinkAttributeName value: [NSString stringWithFormat:@"http://%@", detailInfo.website] range: NSMakeRange(0, str.length)];
    _websiteTextView.attributedText = str;
    
    
    _websiteTextView.editable = NO;
    _websiteTextView.dataDetectorTypes = UIDataDetectorTypeLink;
    
    
    [_postLabel setText: postInfo.body];
    [_nameLabel setText: detailInfo.name];
    [_usernameLabel setText: detailInfo.username];
    [_emailLabel setText:detailInfo.email];
    [_phoneLabel setText: detailInfo.phone];
    [_websiteLabel setText:detailInfo.website];
    
    Company *company  = detailInfo.company;
    
    [_bs setText:company.bs];
    [_phrase setText:company.catchPhrase];
    [_companyName setText:company.companyName];
    
    
    
}
/*!
 @brief show web URL on click
 
 */

- (BOOL)textView:(UITextView *)textView
shouldInteractWithURL:(NSURL *)URL
         inRange:(NSRange)characterRange
     interaction:(UITextItemInteraction)interaction {
    
    UIApplication *application = [UIApplication sharedApplication];
    [application openURL:URL options:@{} completionHandler:^(BOOL success) {
        if (success) {
            NSLog(@"Opened url");
        }
    }];
    return YES;
}




@end
