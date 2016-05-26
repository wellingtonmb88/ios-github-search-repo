//
//  GRPullRequestTableViewCell.h
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/26/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GRPullRequest.h"
#import "GRAvatarImageView.h"

@interface GRPullRequestTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *body;
@property (weak, nonatomic) IBOutlet UILabel *updateAt;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet GRAvatarImageView *avatarAuthor;

- (void) configureCellWithPullRequest:(GRPullRequest *)pullRequest;

@end
