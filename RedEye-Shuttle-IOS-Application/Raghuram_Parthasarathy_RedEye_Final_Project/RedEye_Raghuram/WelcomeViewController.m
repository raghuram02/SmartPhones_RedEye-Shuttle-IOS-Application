//
//  WelcomeViewController.m
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/7/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import "WelcomeViewController.h"

@interface WelcomeViewController ()

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnRideHistory:(id)sender {
    
    _rideRequest=[[NSMutableArray alloc]init];
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
     PFQuery *query = [PFQuery queryWithClassName:@"RideRequestStudent"];

   
[query whereKey:@"nuid" equalTo:[defaults valueForKey:@"nuid"]];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
     
     {
         
         NSLog(@"%lu Ride history count",objects.count);
         
         for (id object in objects) {
             
             [ _rideRequest addObject:object];
             
         }
         
          NSLog(@"%lu Ride history count",_rideRequest.count);
      [self performSegueWithIdentifier:@"rideHistory" sender:self];
         
     }];
    
    
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"rideHistory"]) {
        RideHistoryTableViewController *controller = segue.destinationViewController;
       controller.rides=_rideRequest;
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
      }
    else if ([[segue identifier] isEqualToString:@"requestSegue"]) {
        RequestRideViewController *controller = segue.destinationViewController;
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
    
    else if ([[segue identifier] isEqualToString:@"accountsegue"]) {
        AccountViewController *controller = segue.destinationViewController;
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
        
        
    
    
    
}

- (IBAction)accBtn:(id)sender {
    
    [self performSegueWithIdentifier:@"accountsegue" sender:self];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)btnLogout:(id)sender {
     [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)requestBtn:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSLog(@"%@ defaults id",[defaults valueForKey:@"nuid"]);
    PFQuery *query = [PFQuery queryWithClassName:@"Account_Student"];
    [query whereKey:@"emailID" equalTo:[defaults valueForKey:@"emailID"]];
     [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
      {
          if(objects.count==0){
              UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Please complete your account details to proceed with a request" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
              
              
              
              [error show];
          }
          else{
          [self performSegueWithIdentifier:@"requestSegue" sender:self ];}
          
      }];
    
    
    
    
}
@end
