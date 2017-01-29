//
//  RideFeedbackViewController.h
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/15/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RideRequestStudent.h"
#import "Feedback.h"
#import <Parse/Parse.h>

@interface RideFeedbackViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *btnFeedback;
- (IBAction)submitButtonFeedBack:(id)sender;
@property NSString *nuid;
@property NSString *timeSlot;
@property NSString *address;
@property NSString *date;

@end
