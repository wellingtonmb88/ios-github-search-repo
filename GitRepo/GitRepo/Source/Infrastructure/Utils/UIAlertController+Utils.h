//
//  UIAlertControllerUtils.h
//  
//
//  Created by WELLINGTON BARBOSA on 5/26/16.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIAlertController (Utils)

+(instancetype)createAndShowAlertWithTitle:(NSString*)title withMessage:(NSString*)message hasDefaultAction:(BOOL) hasDefault;

@end
