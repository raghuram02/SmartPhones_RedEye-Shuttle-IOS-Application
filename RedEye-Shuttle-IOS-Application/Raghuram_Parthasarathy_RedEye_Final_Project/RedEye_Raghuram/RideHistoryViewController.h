//
//  RideHistoryViewController.h
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/7/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Parse/Parse.h>
#import "RideRequestStudent.h"



@interface RideHistoryViewController : UITableViewController<UITableViewDataSource,UITabBarDelegate>


@property (weak, nonatomic) IBOutlet UITableView *rideTable;

@property NSMutableArray<RideRequestStudent* > *rideRequest;
@end
