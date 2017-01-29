//
//  DriverHomeViewController.m
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/16/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import "DriverHomeViewController.h"

@interface DriverHomeViewController ()

@end

@implementation DriverHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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


- (IBAction)viewRideBtnclick:(id)sender {
     [self performSegueWithIdentifier:@"viewRide" sender:sender];
}

- (IBAction)logoutBtn:(id)sender {
    
     [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)mapBtn:(id)sender {
     [self performSegueWithIdentifier:@"driverLocate" sender:sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"viewRide"]) {
        DriverSlotsViewController *controller = segue.destinationViewController;
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
    
    else  if ([[segue identifier] isEqualToString:@"driverLocate"]) {
        DriverSlotsViewController *controller = segue.destinationViewController;
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
    
    
    
}


@end
