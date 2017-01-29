//
//  AccountViewController.h
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/7/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Parse/Parse.h>

@interface AccountViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property NSString *firstName;
@property NSString *lastName;
@property NSString *emailID;
@property NSString *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *nuidField;
@property (weak, nonatomic) IBOutlet UITextField *addressField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UITextField *stateField;
@property (weak, nonatomic) IBOutlet UITextField *zipField;
//@property (weak, nonatomic) IBOutlet UIImageView *photoView;
//@property UIImagePickerController *imageController;
//- (IBAction)imageSubmit:(id)sender;

- (IBAction)submitAccount:(id)sender;

@end
