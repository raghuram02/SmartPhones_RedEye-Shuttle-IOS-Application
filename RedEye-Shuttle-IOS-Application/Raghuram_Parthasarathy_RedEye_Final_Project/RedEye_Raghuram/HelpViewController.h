//
//  HelpViewController.h
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/2/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelpViewController : UIViewController

- (IBAction)helpAbout:(UISegmentedControl *)sender;

@property (weak, nonatomic) IBOutlet UIView *About;

@property (weak, nonatomic) IBOutlet UIView *NUPD;

@property (weak, nonatomic) IBOutlet UIView *Help;

@end
