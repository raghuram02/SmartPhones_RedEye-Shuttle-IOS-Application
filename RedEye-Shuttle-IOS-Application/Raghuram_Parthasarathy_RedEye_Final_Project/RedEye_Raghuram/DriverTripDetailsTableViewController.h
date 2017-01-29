//
//  DriverTripDetailsTableViewController.h
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/16/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "RideRequestStudent.h"
#import "StudentRideHistoriesTableViewCell.h"
@interface DriverTripDetailsTableViewController : UITableViewController<UITableViewDataSource,UITabBarDelegate>
@property NSMutableArray *rideDetailsArray;
@end
