//
//  RequestRideViewController.h
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/7/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Parse/Parse.h>
#import "RideRequestStudent.h"

@interface RequestRideViewController : UIViewController

- (IBAction)submitRideRequest:(id)sender;


@property NSString *firstName;
@property NSString *lastName;
@property NSString *nuid;
@property (weak, nonatomic) IBOutlet UITextField *currentDateField;
@property (weak, nonatomic) IBOutlet UITextField *slotField;
@property (weak, nonatomic) IBOutlet UITextField *rideAddressField;
@property UIPickerView *slotPickerView;
@property NSMutableArray *timeSlots;



@property UIDatePicker *datePicker;

-(void) addSlotPickerView;
@end
