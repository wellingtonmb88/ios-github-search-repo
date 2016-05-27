//
//  SearchUITestSpec.m
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/26/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <KIF/KIF.h>
#define EXP_SHORTHAND

SpecBegin(SearchUITest)

describe(@"SearchUITest", ^{
     
    it(@"should search a repository and open on the browser a page of the pull request", ^{
        
        [tester waitForViewWithAccessibilityLabel:@"Search Repository"];
        
        [tester tapViewWithAccessibilityLabel:@"Search Repository"];
        
        [tester enterText:@"Java" intoViewWithAccessibilityLabel:@"Search Repository"];
        
        [tester  tapViewWithAccessibilityLabel:@"Search" traits:UIAccessibilityTraitKeyboardKey];
        
        NSIndexPath *firstIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        
        [tester waitForCellAtIndexPath:firstIndexPath inTableViewWithAccessibilityIdentifier:@"Repositories Table"];
        
        [tester tapRowAtIndexPath:firstIndexPath inTableViewWithAccessibilityIdentifier:@"Repositories Table"];
        
        [tester waitForCellAtIndexPath:firstIndexPath inTableViewWithAccessibilityIdentifier:@"Pull Requests Table"];
        
        [tester tapRowAtIndexPath:firstIndexPath inTableViewWithAccessibilityIdentifier:@"Pull Requests Table"];
        
    });
    
});

SpecEnd