//
//  RegisterViewController.h
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/7/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface RegisterViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *fnameField;
@property (weak, nonatomic) IBOutlet UITextField *lnameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *cpField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *roleField;
@property NSArray *roleArray;
@property UIPickerView *rolePickerView;
-(void) addRolePickerView;

- (IBAction)signUpButton:(id)sender;

@end
