//
//  DriverRideDetailsViewController.m
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/16/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import "DriverRideDetailsViewController.h"

@interface DriverRideDetailsViewController ()

@end

@implementation DriverRideDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     NSLog(@"%lu Ride history count",_rideDetailsArray.count);
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

@end
