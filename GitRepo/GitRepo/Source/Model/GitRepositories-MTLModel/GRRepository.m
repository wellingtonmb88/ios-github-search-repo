//
//  GRRepository.m
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/24/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import "GRRepository.h"

@implementation GRRepository

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"name": @"name",
             @"owner": @"owner",
             @"desc": @"description",
             @"forks": @"forks_count",
             @"stars": @"stargazers_count"
               };
}

+ (NSValueTransformer *)ownerJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:GROwner.class];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self == nil) return nil;
    return self;
}

@end
