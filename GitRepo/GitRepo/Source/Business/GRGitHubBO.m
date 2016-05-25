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
#import "GRRepositories.h"
#import "GRPullRequest.h"

@implementation GRGitHubBO

#pragma mark - Services  

+ (void)searchRepositoriesWith:(NSString *)search atPage: (NSInteger) page
                   success:(void(^)(GRRepositories *repositories))success
                   failure:(void(^)(NSError *error))failure {
    
    GRHTTPSessionProvider *sessionManager = [GRHTTPSessionProvider sharedInstance];
    
    [sessionManager searchRepositoriesWith:search atPage:page
                              success:^(NSURLSessionDataTask *task, id responseObject) {
                                  
        NSDictionary *responseDictionary = (NSDictionary *)responseObject;
          
        NSError *error;
        GRRepositories *repositories = [MTLJSONAdapter modelOfClass:GRRepositories.class
                                                     fromJSONDictionary:responseDictionary error:&error];
                                  
        success(repositories);
         
     } failure:^(NSError *error) {
         
         NSLog(@"Error on Search.");
         
         failure(error);
     }];
    
}


+ (void)searchPullRequestWithOwner:(NSString *)owner andRepository: (NSString *) repository
                success:(void(^)(NSArray *pullRequests))success
                failure:(void(^)(NSError *error))failure {
    
    GRHTTPSessionProvider *sessionManager = [GRHTTPSessionProvider sharedInstance];
    
    
    
    [sessionManager searchPullRequestWithOwner:owner andRepository:repository
                               success:^(NSURLSessionDataTask *task, id responseObject) {
                                   
                                   
        NSArray *responseArray = (NSArray *)responseObject;
       
        NSError *error;
                                   
        NSArray *pullRequests = [MTLJSONAdapter modelsOfClass:GRPullRequest.class
                                                fromJSONArray:responseArray error:&error];
        success(pullRequests);
                                   
     } failure:^(NSError *error) {
         
         NSLog(@"Error on Search.");
         
         failure(error);
     }];
}

@end
