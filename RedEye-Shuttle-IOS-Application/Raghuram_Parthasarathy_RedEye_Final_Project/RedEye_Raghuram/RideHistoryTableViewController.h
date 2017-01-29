//
//  RideHistoryTableViewController.h
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/15/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Parse/Parse.h>
#import "RideRequestStudent.h"
#import "RideHistoryCell.h"
#import "RideFeedbackViewController.h"
@interface RideHistoryTableViewController : UITableViewController<UITableViewDataSource,UITabBarDelegate>

@property NSMutableArray *rides;
@end
