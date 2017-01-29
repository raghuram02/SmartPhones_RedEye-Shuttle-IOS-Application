//
//  WelcomeViewController.h
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/7/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Parse/Parse.h>
#import "RequestRideViewController.h"
#import "RideHistoryTableViewController.h"
#import "AccountViewController.h"

@interface WelcomeViewController : UIViewController

@property NSMutableArray *rideRequest;

- (IBAction)requestBtn:(id)sender;
@end
