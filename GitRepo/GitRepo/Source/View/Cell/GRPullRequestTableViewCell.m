//
//  GRPullRequestTableViewCell.m
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/26/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "GRPullRequestTableViewCell.h"

@implementation GRPullRequestTableViewCell

- (void) configureCellWithPullRequest:(GRPullRequest *)pullRequest {
    
    self.title.text = pullRequest.title;
    self.body.text = pullRequest.body;
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"]; 
    self.updateAt.text = [dateFormatter stringFromDate:pullRequest.updatedAt];
    self.author.text = pullRequest.user.login;
    [self.avatarAuthor sd_setImageWithURL:[NSURL URLWithString:pullRequest.user.avatarUrl]
                         placeholderImage:[UIImage imageNamed:@"anonymous-user.jpg"]];
}
@end
