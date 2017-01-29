//
//  TrendChartViewController.h
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/16/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCBarChartView.h"
#import <Parse/Parse.h>
#import "FrequentRides.h"
@interface TrendChartViewController : UIViewController<MCBarChartViewDataSource, MCBarChartViewDelegate>
@property NSMutableArray *details;

@property (strong, nonatomic) IBOutlet MCBarChartView *barChart;

@property (strong, nonatomic) IBOutlet UILabel *cornerRadiusLabel;

@property (strong, nonatomic) IBOutlet UILabel *interBarSpaceLabel;

@end
