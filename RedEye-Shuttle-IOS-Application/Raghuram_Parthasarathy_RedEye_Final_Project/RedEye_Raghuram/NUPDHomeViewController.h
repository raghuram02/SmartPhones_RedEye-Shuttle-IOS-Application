//
//  NUPDHomeViewController.h
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/16/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrendChartViewController.h"
#import "FrequentRides.h"
#import <Parse/Parse.h>

@interface NUPDHomeViewController : UIViewController
@property NSMutableArray *timeSlots;
@property NSMutableArray *details;

- (IBAction)btnTrend:(id)sender;

- (IBAction)logout:(id)sender;


@end
