//
//  TestingHelper.m
//  GitRepo
//
//  Created by WELLINGTON BARBOSA on 5/26/16.
//  Copyright © 2016 WELLINGTON BARBOSA. All rights reserved.
//

#import "TestingHelper.h"

@implementation TestingHelper

+ (id)dataFromJSONFileNamed:(NSString *)fileName {
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *resource = [bundle pathForResource:fileName ofType:@"json"];
    
    NSURL *localFileURL = [NSURL fileURLWithPath:resource];
    NSData *contentOfLocalFile = [NSData dataWithContentsOfURL:localFileURL];
    id object = [NSJSONSerialization JSONObjectWithData:contentOfLocalFile
                                                options:0
                                                  error:nil];
    
    return object;
     
}

@end
