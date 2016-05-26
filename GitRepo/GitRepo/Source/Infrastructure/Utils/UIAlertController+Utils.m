//
//  UIAlertControllerUtils.m
//  
//
//  Created by WELLINGTON BARBOSA on 5/26/16.
//
//

#import "UIAlertController+Utils.h"

@implementation UIAlertController (Utils)


+(instancetype)createAndShowAlertWithTitle:(NSString*)title withMessage:(NSString*)message hasDefaultAction:(BOOL) hasDefault{
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:title
                                          message:message
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    if(hasDefault){
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"alertcontroller.action.ok", @"OK")
                                   style:UIAlertActionStyleDefault
                                   handler:nil];
        
        [alertController addAction:okAction];
    }
    
    return alertController;
}

@end
