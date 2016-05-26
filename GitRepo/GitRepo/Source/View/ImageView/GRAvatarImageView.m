//
//  GRAvatarImageView.m
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/25/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import "GRAvatarImageView.h"

@implementation GRAvatarImageView

-(void)layoutSubviews {
    self.layer.borderColor = [UIColor grayColor].CGColor;
    self.layer.borderWidth = 1.0f;
    self.layer.cornerRadius = self.layer.bounds.size.width/2;
    self.layer.masksToBounds = true;
}

- (void)awakeFromNib {
    self.clipsToBounds = true;
}

@end
