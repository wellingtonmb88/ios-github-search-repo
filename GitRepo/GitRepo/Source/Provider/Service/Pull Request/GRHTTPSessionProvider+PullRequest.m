//
//  GRHTTPSessionProvider+PullRequest.m
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/24/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import "GRHTTPSessionProvider+PullRequest.h"

//https://api.github.com/repos/<owner>/<repository>/pulls

@implementation GRHTTPSessionProvider (PullRequest)

- (void)searchPullRequestWithOwner:(NSString *)owner andRepository: (NSString *) repository
                   success:(GRRequestOperationBlockSuccess)success
                   failure:(GRRequestOperationBlockFailure)failure {
    
    if([self checkConnection]){
        NSString * urlPath = [NSString stringWithFormat:@"repos/%@/%@/pulls",owner,repository];
        
        [self GET:urlPath parameters:nil progress:nil
          success:success
          failure:^(NSURLSessionDataTask *task, NSError *error) {
              
              NSLog(@"Request error: %@", error.description);
              failure(error);
          }];
    } else {
        failure(nil);
    }
}


@end
