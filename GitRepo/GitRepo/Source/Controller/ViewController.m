//
//  ViewController.m
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/24/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import "ViewController.h"
#import "GRGitHubManager.h"
#import "GRRepositories.h"
#import "GRRepository.h"
#import "GROwner.h"
#import "GRPullRequest.h"

@interface ViewController ()
@property (strong, nonatomic)GRRepositories * repositories;
@property (strong, nonatomic)NSArray * pullRequests;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GRGitHubManager * manager = [GRGitHubManager new];
     
    
    [manager searchRepositoriesWith:@"language:Java" atPage:2 withCompletionBlock:^(GRRepositories * repositories, BOOL success) {
        GRRepository * repository = repositories.items[0];
        
        [manager searchPullRequestWithOwner:repository.owner.login andRepository:repository.name withCompletionBlock:^(NSArray * pullRequests, BOOL success) {
            _pullRequests = pullRequests;
            NSLog(@"%@",_pullRequests);
        }];
        
    }]; 
    
}


@end
