//
//  MainPageViewController.h
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/7/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface MainPageViewController : UIViewController


- (IBAction)loginSegment:(UISegmentedControl*)sender;

@property (weak, nonatomic) IBOutlet UIView *login;


@property (weak, nonatomic) IBOutlet UIView *Register;


@end
