//
//  DriverSlotsViewController.h
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/16/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DriverTripDetailsTableViewController.h"
#import <Parse/Parse.h>

@interface DriverSlotsViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *dateField;
@property (weak, nonatomic) IBOutlet UITextField *timeSlotField;
@property UIPickerView *slotView;
@property NSMutableArray *requestedTime;
@property NSMutableArray *rideDetails;



@property UIDatePicker *datePicker1;

-(void) addSlotPickerView1;

- (IBAction)submitBtn:(id)sender;

@end
