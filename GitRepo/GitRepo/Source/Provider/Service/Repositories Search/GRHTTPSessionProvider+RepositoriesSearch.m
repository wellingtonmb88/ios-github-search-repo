//
//  GRHTTPSessionProvider+RepositoriesSearch.m
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/24/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import "GRHTTPSessionProvider+RepositoriesSearch.h"

//https://api.github.com/search/repositories?q=language:Java&sort=stars&page=2
static NSString * const kSearchRepoEndPoint = @"search/repositories";

@implementation GRHTTPSessionProvider (RepositoriesSearch)

- (void)searchRepositoriesWith:(NSString *)search atPage: (NSInteger) page
                  success:(GRRequestOperationBlockSuccess)success
                  failure:(GRRequestOperationBlockFailure)failure{
    
    if([self checkConnection]){
        
        NSDictionary *parameters = @{@"q": search, @"sort":@"stars", @"page":[NSString stringWithFormat:@"%ld", (long)page]};
        
        [self GET:kSearchRepoEndPoint parameters:parameters progress:nil
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
