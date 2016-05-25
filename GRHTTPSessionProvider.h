//
//  GPHTTPSessionProvider.h
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/24/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "Reachability.h"

typedef void (^GRRequestOperationBlockSuccess) (NSURLSessionDataTask *task, id responseObject);
typedef void (^GRRequestOperationBlockFailure) (NSError *error);

@interface GRHTTPSessionProvider : AFHTTPSessionManager

@property (nonatomic) Reachability *internetReachability;

+ (instancetype)sharedInstance; 
- (BOOL) checkConnection;

@end
