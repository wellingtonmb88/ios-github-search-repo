//
//  GRRepositoryTableViewCell.m
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/25/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "GRRepositoryTableViewCell.h"

@implementation GRRepositoryTableViewCell

- (void) configureCellWithRepository:(GRRepository *)repository {
    
    self.nameRepo.text = repository.name;
    self.descriptionRepo.text = repository.desc;
    self.forksCount.text = [NSString stringWithFormat:@"%@",repository.forks];
    self.starsCount.text = [NSString stringWithFormat:@"%@",repository.stars];
    self.authorRepo.text = repository.owner.login;
    [self.authorAvatar sd_setImageWithURL:[NSURL URLWithString:repository.owner.avatarUrl]
                      placeholderImage:[UIImage imageNamed:@"anonymous-user.jpg"]];
}

@end
