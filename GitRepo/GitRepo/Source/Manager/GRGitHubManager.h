//
//  GRGitHubManager.h
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/24/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GRBaseManager.h"
#import "GRRepositories.h"

@interface GRGitHubManager : GRBaseManager

- (void)searchRepositoriesWith:(NSString *)search atPage: (NSInteger) page
                    withCompletionBlock:(void(^)(GRRepositories *repositories, BOOL success))completion;

- (void)searchPullRequestWithOwner:(NSString *)owner andRepository: (NSString *) repository
                    withCompletionBlock:(void(^)(NSArray *pullRequests, BOOL success))completion;
@end
