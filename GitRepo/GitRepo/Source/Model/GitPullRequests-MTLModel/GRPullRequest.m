//
//  GRPullRequest.m
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/25/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import "GRPullRequest.h"

@implementation GRPullRequest

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    return dateFormatter;
}

- (NSString *) updatedAtDate {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    return [dateFormatter stringFromDate: _updatedAt];
}

+ (NSDictionary*)JSONKeyPathsByPropertyKey {
    return @{
             @"title": @"title",
             @"user": @"user",
             @"body": @"body",
             @"htmlUrl": @"html_url",
             @"updatedAt": @"updated_at"
             };
}

+ (NSValueTransformer *)userJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:GRUser.class];
}

+ (NSValueTransformer *)updatedAtJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *dateString, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter dateFromString:dateString];
    } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter stringFromDate:date];
    }];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self == nil) return nil;
    return self;
}

@end
