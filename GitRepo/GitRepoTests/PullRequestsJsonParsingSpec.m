//
//  PullRequestsJsonParsing.m
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/26/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import "Expecta.h"
#import "GRPullRequest.h"
#import "TestingHelper.h"

SpecBegin(PullRequestsJsonParsing)

describe(@"PullRequestsJsonParsing", ^{
    
    __block NSArray *pullRequests;
    
    beforeEach(^{
        NSArray *jsonArray = [TestingHelper dataFromJSONFileNamed:@"pullRequestsMock"];
        
        pullRequests = [MTLJSONAdapter modelsOfClass:GRPullRequest.class
                                                fromJSONArray:jsonArray error:nil];
    });
    
    it(@"pull requests will not be nil", ^{
        expect(pullRequests).willNot.beNil();
    });
    
    it(@"should be equal 13 pull requests", ^{
        expect(pullRequests.count).to.equal(13);
    });
     
    it(@"first pull request will not be nil", ^{
        
        GRPullRequest *pullRequest = pullRequests[0];
        
        expect(pullRequest).willNot.beNil();
    });
    
    it(@"parsing first pull request", ^{
        
        GRPullRequest *pullRequest = pullRequests[0];
        
        expect(pullRequest.title).to.equal(@"allow wildcard to make redux consts easily available");
        expect(pullRequest.user.login).to.equal(@"alvinsng");
        expect(pullRequest.user.avatarUrl).to.equal(@"https://avatars.githubusercontent.com/u/1707753?v=3");
        expect(pullRequest.body).to.equal(@"A pattern seen in redux examples like https://github.com/reactjs/redux/blob/master/examples/todomvc/actions/index.js#L1is to use wildcard when importing a file that contains a bunch of exported constants.\r\n\r\nThis was originally added by @goatslacker in https://github.com/airbnb/javascript/pull/276 before redux was adapted.\r\n\r\ncc @kesne @ljharb ");
        expect(pullRequest.updatedAtDate).to.equal(@"26/05/2016");
    });
});

SpecEnd