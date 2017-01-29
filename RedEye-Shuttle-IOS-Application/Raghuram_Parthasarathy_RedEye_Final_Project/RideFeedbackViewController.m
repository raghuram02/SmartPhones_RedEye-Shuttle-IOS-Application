//
//  RideFeedbackViewController.m
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/15/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import "RideFeedbackViewController.h"

@interface RideFeedbackViewController ()

@end

@implementation RideFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _nuid= [defaults stringForKey:@"nuid"];

    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)submitButtonFeedBack:(id)sender {
    if([_btnFeedback.text isEqualToString:@""]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Fields cannot be null" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
        
        
        return;
        
    }
    
    PFQuery *query=[PFQuery queryWithClassName:@"RideRequestStudent"];
    [query whereKey:@"currentDate" equalTo:_date];
    [query whereKey:@"timeSlot" equalTo:_timeSlot];
    [query whereKey:@"rideAddress" equalTo:_address];
    PFObject *obj=[query getFirstObject];
    [obj setValue:_btnFeedback.text forKey:@"feedback"];
    [obj save];
    
}
@end
