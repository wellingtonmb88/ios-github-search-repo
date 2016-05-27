//
//  GRPullRequestsViewController.m
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/26/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import "GRPullRequestsViewController.h"
#import "GRPullRequestTableViewCell.h"
#import "GRPullRequest.h"
#import "GRGitHubManager.h"
#import "MBProgressHUD.h"

@interface GRPullRequestsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *numPullRequest;

@property (copy, nonatomic) NSString * repoName;
@property (copy, nonatomic) NSString * repoOwner;
@property (copy, nonatomic) NSArray * pullRequests;

@property (strong, nonatomic) GRGitHubManager *manager;

@end

@implementation GRPullRequestsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.accessibilityIdentifier = @"Pull Requests Table";
    self.navigationItem.title = _repoName;
    self.numPullRequest.text = @"-";
    
    [self showProgress];
    
    typeof(self) __weak __block weakSelf = self;
    
    [self.manager searchPullRequestWithOwner:_repoOwner andRepository:_repoName withCompletionBlock:^(NSArray * pullRequests, BOOL success) {
        
        typeof(weakSelf) __strong strongSelf = weakSelf;
        if (!strongSelf) {
            return;
        }
        
        strongSelf.pullRequests = pullRequests;
        dispatch_async(dispatch_get_main_queue(), ^{
            strongSelf.numPullRequest.text = [NSString stringWithFormat:@"%lu", (unsigned long)pullRequests.count];
            [strongSelf hideProgress];
        });
        [strongSelf.tableView reloadData];
        
    }];
}

-(void) setRepositoryName:(NSString*)name andOwner:(NSString*) owner {
    _repoName = name;
    _repoOwner = owner;
}

#pragma mark - Getters/Setters

- (GRGitHubManager *)manager {
    if (!_manager) {
        _manager = [GRGitHubManager new];
    }
    
    return _manager;
}

#pragma mark - Actions

- (void) showProgress {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = NSLocalizedString(@"mbprogresshud.label", @"Loading...");
}

- (void) hideProgress {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

#pragma mark - Table View Data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _pullRequests.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark - Table View Delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"cellPullRequest";
    
    GRPullRequestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[GRPullRequestTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell configureCellWithPullRequest:_pullRequests[[indexPath row]]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GRPullRequest *pullRequest = _pullRequests[[indexPath row]];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:pullRequest.htmlUrl]];
}


@end
