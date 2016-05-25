//
//  GRGitHubBO.h
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/24/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GRGitHubBO : NSObject

+ (void)searchRepositoriesWith:(NSString *)search atPage: (NSInteger) page
                               success:(void(^)())success
                               failure:(void(^)(NSError *error))failure;

+ (void)searchPullRequestWithOwner:(NSString *)owner andRepository: (NSString *) repository
                           success:(void(^)())success
                           failure:(void(^)(NSError *error))failure;

@end
