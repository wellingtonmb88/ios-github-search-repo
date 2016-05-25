//
//  GRGitHubManager.m
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/24/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import "GRGitHubManager.h"
#import "GRGitHubBO.h"

@implementation GRGitHubManager


- (void)searchRepositoriesWith:(NSString *)search atPage: (NSInteger) page
                   withCompletionBlock:(void(^)(BOOL success))completion {
    
    [self.mainQueue addOperationWithBlock:^{
        
        [GRGitHubBO searchRepositoriesWith:search atPage:page
                                           success:^{
                                               completion(true);
                                           } failure:^(NSError *error) {
                                               completion(false);
                                           }];
    }];
}

- (void)searchPullRequestWithOwner:(NSString *)owner andRepository: (NSString *) repository
               withCompletionBlock:(void(^)(BOOL success))completion {
    
    [self.mainQueue addOperationWithBlock:^{
        
        [GRGitHubBO searchPullRequestWithOwner:owner andRepository:repository
                                           success:^{
                                               completion(true);
                                           } failure:^(NSError *error) {
                                               completion(false);
                                           }];
    }];
}

@end
