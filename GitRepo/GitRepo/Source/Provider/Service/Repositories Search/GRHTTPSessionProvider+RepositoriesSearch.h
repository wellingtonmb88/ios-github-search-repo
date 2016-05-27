//
//  GRHTTPSessionProvider+RepositoriesSearch.h
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/24/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import "GRHTTPSessionProvider.h"

@interface GRHTTPSessionProvider (RepositoriesSearch)

- (void)searchRepositoriesWith:(NSString *)search atPage: (NSInteger) page
                  success:(GRRequestOperationBlockSuccess)success
                  failure:(GRRequestOperationBlockFailure)failure;

@end
