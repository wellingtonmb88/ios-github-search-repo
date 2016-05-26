//
//  GRRepositoryTableViewCell.h
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/25/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GRAvatarImageView.h"
#import "GRRepository.h"

@interface GRRepositoryTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *forksCount;
@property (weak, nonatomic) IBOutlet UILabel *starsCount;
@property (weak, nonatomic) IBOutlet UILabel *descriptionRepo;
@property (weak, nonatomic) IBOutlet UILabel *nameRepo;
@property (weak, nonatomic) IBOutlet UILabel *authorRepo;
@property (weak, nonatomic) IBOutlet GRAvatarImageView *authorAvatar;

- (void) configureCellWithRepository:(GRRepository *)repository;

@end
