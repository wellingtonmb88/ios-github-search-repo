//
//  GRUser.m
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/25/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import "GRUser.h"

@implementation GRUser

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"login": @"login",
             @"avatarUrl": @"avatar_url"
             };
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self == nil) return nil;
    return self;
}

@end
