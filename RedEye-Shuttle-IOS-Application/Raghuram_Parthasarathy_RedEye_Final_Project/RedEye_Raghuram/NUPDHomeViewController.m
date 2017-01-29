//
//  NUPDHomeViewController.m
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/16/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import "NUPDHomeViewController.h"

@interface NUPDHomeViewController ()

@end

@implementation NUPDHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _timeSlots=[[NSMutableArray alloc]init];
    
    NSDateFormatter *mmddccyy = [[NSDateFormatter alloc] init];
    mmddccyy.timeStyle = NSDateFormatterNoStyle;
    mmddccyy.dateFormat = @"MM/dd/yyyy hh:mm:ss a";
    NSDate *d = [mmddccyy dateFromString:@"12/11/2005 06:00:00 PM"];
   
    NSString *strCurrentDate;
    NSString *strNewDate;
    
    NSDateFormatter *df =[[NSDateFormatter alloc]init];
    [df setDateStyle:NSDateFormatterMediumStyle];
    [df setTimeStyle:NSDateFormatterMediumStyle];
    strCurrentDate = [df stringFromDate:d];
    
    for (int hoursToAdd = 1;hoursToAdd<13;hoursToAdd++)
    {
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *components = [[NSDateComponents alloc] init];
        [components setHour:hoursToAdd];
        NSDate *newDate= [calendar dateByAddingComponents:components toDate:d options:0];
        [df setDateStyle:NSDateFormatterMediumStyle];
        [df setTimeStyle:NSDateFormatterMediumStyle];
        df.dateFormat=@"hh:mm a";
        strNewDate = [df stringFromDate:newDate];
        
        [ _timeSlots addObject:strNewDate];
    }

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

- (IBAction)btnTrend:(id)sender {
    
    _details=[[NSMutableArray alloc]init];
    
    
    for(NSString *str in _timeSlots){
        
        PFQuery *query=[PFQuery queryWithClassName:@"RideRequestStudent"];
        [query whereKey:@"timeSlot" equalTo:str];
        FrequentRides *time=[[FrequentRides alloc]init];
        time.rideTime=str;
        
        time.count=query.countObjects;
        [_details addObject:time];
        
        
   }
    
    [self performSegueWithIdentifier:@"trendChart" sender:sender];

}

- (IBAction)logout:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"trendChart"]) {
        TrendChartViewController *controller = segue.destinationViewController;
        controller.details=_details;
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
    
    
    
}





@end
