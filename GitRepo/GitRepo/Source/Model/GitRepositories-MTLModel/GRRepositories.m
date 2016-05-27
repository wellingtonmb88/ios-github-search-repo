//
//  GRRepositories.m
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/25/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import "GRRepositories.h"
#import "GRRepository.h"

@implementation GRRepositories

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"items" : @"items"
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass: GRRepository.class];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self == nil) return nil;
    return self;
}

@end
