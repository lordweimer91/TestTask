//
//  RSViewControllerWithAlert.m
//  Task3
//
//  Created by user on 04.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import "UIViewController+RSAlert.h"

@implementation UIViewController(RSAlert)

-(void) showAlertWithError:(NSError *)error
{
    NSString *text = [NSString stringWithFormat:@"%@", error.localizedDescription];
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                   message:text
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert
                       animated:YES
                     completion:nil];
}

@end
