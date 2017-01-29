//
//  LoginViewController.h
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/7/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Parse/Parse.h>
#import "WelcomeViewController.h"

@interface LoginViewController : UIViewController

- (IBAction)loginBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *emailField1;
@property (weak, nonatomic) IBOutlet UITextField *passwordField1;
@property BOOL *compare;

@end
