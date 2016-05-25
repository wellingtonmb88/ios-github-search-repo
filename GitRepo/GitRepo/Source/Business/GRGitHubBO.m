//
//  GRGitHubBO.m
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/24/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import "GRGitHubBO.h"
#import "GRHTTPSessionProvider+RepositoriesSearch.h"
#import "GRHTTPSessionProvider+PullRequest.h"

@implementation GRGitHubBO

#pragma mark - Services  

+ (void)searchRepositoriesWith:(NSString *)search atPage: (NSInteger) page
                   success:(void(^)())success
                   failure:(void(^)(NSError *error))failure {
    
    GRHTTPSessionProvider *sessionManager = [GRHTTPSessionProvider sharedInstance];
    
    [sessionManager searchRepositoriesWith:search atPage:page
                              success:^(NSURLSessionDataTask *task, id responseObject) {
                                  
         NSLog(@"Search with success= %@",responseObject);
         
     } failure:^(NSError *error) {
         
         NSLog(@"Error on Search.");
         
         failure(error);
     }];
    
}


+ (void)searchPullRequestWithOwner:(NSString *)owner andRepository: (NSString *) repository
                success:(void(^)())success
                failure:(void(^)(NSError *error))failure {
    
    GRHTTPSessionProvider *sessionManager = [GRHTTPSessionProvider sharedInstance];
    
    
    
    [sessionManager searchPullRequestWithOwner:owner andRepository:repository
                               success:^(NSURLSessionDataTask *task, id responseObject) {
                                   
         NSLog(@"Search with success= %@",responseObject);
         
     } failure:^(NSError *error) {
         
         NSLog(@"Error on Search.");
         
         failure(error);
     }];
}

@end
