//
//  GRPullRequestsViewController.h
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/26/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GRPullRequestsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

-(void) setRepositoryName:(NSString*)name andOwner: (NSString*) owner;

@end
