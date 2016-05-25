//
//  GRHTTPSessionProvider+PullRequest.h
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/24/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import "GRHTTPSessionProvider.h"

@interface GRHTTPSessionProvider (PullRequest)

- (void)searchPullRequestWithOwner:(NSString *)owner andRepository: (NSString *) repository
                success:(GRRequestOperationBlockSuccess)success
                failure:(GRRequestOperationBlockFailure)failure;

@end
