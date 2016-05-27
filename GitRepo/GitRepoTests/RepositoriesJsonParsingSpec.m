//
//  RepositorySpec.m
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/26/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import "Expecta.h"
#import "GRRepositories.h"
#import "GRRepository.h"
#import "TestingHelper.h"

SpecBegin(RepositoriesJsonParsing)

describe(@"RepositoriesJsonParsing", ^{
    
    __block GRRepositories *repositories;
    
    beforeEach(^{
        NSDictionary *jsonDictionary = [TestingHelper dataFromJSONFileNamed:@"repositoriesMock"];
        
        repositories = [MTLJSONAdapter modelOfClass:GRRepositories.class
                                                 fromJSONDictionary:jsonDictionary error:nil];
    });
    
    it(@"repositories will not be nil", ^{
        expect(repositories).willNot.beNil();
    });
    
    it(@"should be equal 30 repositories", ^{
        expect(repositories.items.count).to.equal(30);
    });
    
    it(@"first repository will not be nil", ^{
        
        GRRepository *repository = repositories.items[0];
        
        expect(repository).willNot.beNil();
    });
    
    it(@"parsing first repository", ^{
        
        GRRepository *repository = repositories.items[0];
        
        expect(repository.name).to.equal(@"react-native");
        expect(repository.owner.login).to.equal(@"facebook");
        expect(repository.owner.avatarUrl).to.equal(@"https://avatars.githubusercontent.com/u/69631?v=3");
        expect(repository.desc).to.equal(@"A framework for building native apps with React.");
        expect(repository.stars).to.equal(32711);
        expect(repository.forks).to.equal(6649);
    });
});

SpecEnd