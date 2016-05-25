//
//  GRRepository.h
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/24/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//
 
#import "MTLModel.h"
#import "Mantle.h"
#import "GROwner.h"


@interface GRRepository : MTLModel <MTLJSONSerializing>

@property (copy, nonatomic, readonly) NSString *name;
@property (copy, nonatomic, readonly) NSString *desc;
@property (copy, nonatomic, readonly) NSNumber *forks;
@property (copy, nonatomic, readonly) NSNumber *stars;
@property (strong, nonatomic, readonly) GROwner *owner;

@end
