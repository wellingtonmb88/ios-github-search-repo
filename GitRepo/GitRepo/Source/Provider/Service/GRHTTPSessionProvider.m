//
//  GPHTTPSessionProvider.m
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/24/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import "GRHTTPSessionProvider.h"


static NSString * const kBaseURL = @"https://api.github.com/";

@implementation GRHTTPSessionProvider

#pragma mark - Singleton

+ (instancetype)sharedInstance {
    
    static GRHTTPSessionProvider * _sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *url = [NSURL URLWithString:kBaseURL];
        _sharedInstance = [[GRHTTPSessionProvider alloc] initWithBaseURL:url];
    });
    
    return _sharedInstance;
}

#pragma mark - Override

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    
    if (self) {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer.timeoutInterval = 15;
    }
    
    return self;
} 

- (BOOL)checkConnection {
    BOOL reachable = FALSE;
    
    _internetReachability = [Reachability reachabilityForInternetConnection];
    [_internetReachability startNotifier];
    
    NetworkStatus remoteHostStatus = [_internetReachability currentReachabilityStatus];
    
    if(remoteHostStatus == NotReachable) {NSLog(@"NotReachable"); reachable = FALSE; }
    else if (remoteHostStatus == ReachableViaWiFi) {NSLog(@"ReachableViaWiFi"); reachable = TRUE; }
    else if (remoteHostStatus == ReachableViaWWAN) {NSLog(@"ReachableViaWWAN"); reachable = TRUE; }
    
    return reachable;
}

@end
