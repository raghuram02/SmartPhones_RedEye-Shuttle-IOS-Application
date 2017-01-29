//
//  RideHistoryViewController.m
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/7/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import "RideHistoryViewController.h"

@interface RideHistoryViewController ()

@end

@implementation RideHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if(_rideRequest == nil){
        _rideRequest=[[NSMutableArray alloc]init];
        
    }
    
    PFQuery *query = [PFQuery queryWithClassName:@"RideRequestStudent"];
   
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
     
     {
         
         for (id object in objects) {
             
             [ _rideRequest addObject:[object valueForKey:@"currentDate"]];
             [ _rideRequest addObject:[object valueForKey:@"rideAddress"]];
             [ _rideRequest addObject:[object valueForKey:@"timeSlot"]];
         }
         [self.tableView reloadData];
         
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
#warning Incomplete implementation, return the number of sections
    
    return [_rideRequest count];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
#warning Incomplete implementation, return the number of rows
    
    return [_rideRequest count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"requestCell"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"requestCell" forIndexPath:indexPath];
    
    NSString *str=[_rideRequest objectAtIndex:indexPath.row];
    
    cell.textLabel.text = str;
    
    
    
    return cell;
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Return NO if you do not want the specified item to be editable.
    
    return YES;
    
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // Delete the row from the data source
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        
    }   
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self performSegueWithIdentifier:@"rideDetails" sender:self];
    
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
