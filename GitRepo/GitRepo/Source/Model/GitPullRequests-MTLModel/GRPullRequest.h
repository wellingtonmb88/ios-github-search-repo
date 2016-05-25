//
//  GRPullRequest.h
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/25/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import "MTLModel.h"
#import "Mantle.h"
#import "GRUser.h"

@interface GRPullRequest : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *body;
@property (nonatomic, copy, readonly) NSString *htmlUrl;
@property (nonatomic, copy, readonly) NSDate *updatedAt;
@property (strong, nonatomic, readonly) GRUser *user;


@end
