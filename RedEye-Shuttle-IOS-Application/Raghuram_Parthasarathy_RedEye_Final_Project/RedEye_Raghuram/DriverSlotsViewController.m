//
//  DriverSlotsViewController.m
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/16/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import "DriverSlotsViewController.h"

@interface DriverSlotsViewController ()

@end

@implementation DriverSlotsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSlotPickerView1];
    [self timeSlotData];
    
    _datePicker1=[[UIDatePicker alloc]init];
    _datePicker1.datePickerMode=UIDatePickerModeDate;
    [self.dateField setInputView:_datePicker1];
    
    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolBar setTintColor:[UIColor grayColor]];
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain
                                                            target:self action:@selector(ShowSelectedDate)];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                        target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space,doneBtn, nil]];
    [self.dateField setInputAccessoryView:toolBar];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)ShowSelectedDate{
    
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"MM/dd/yyyy"];
    
    self.dateField.text=[NSString stringWithFormat:@"%@",[formatter stringFromDate:_datePicker1.date]];
    [self.dateField resignFirstResponder];
}

-(void)timeSlotData{
    
    _requestedTime=[[NSMutableArray alloc]init];
    
    NSDateFormatter *mmddccyy = [[NSDateFormatter alloc] init];
    mmddccyy.timeStyle = NSDateFormatterNoStyle;
    mmddccyy.dateFormat = @"MM/dd/yyyy hh:mm:ss a";
    NSDate *d = [mmddccyy dateFromString:@"12/11/2005 06:00:00 PM"];
    NSLog(@"%@", d);
    NSString *strCurrentDate;
    NSString *strNewDate;
    
    NSDateFormatter *df =[[NSDateFormatter alloc]init];
    [df setDateStyle:NSDateFormatterMediumStyle];
    [df setTimeStyle:NSDateFormatterMediumStyle];
    strCurrentDate = [df stringFromDate:d];
    NSLog(@"Current Date and Time: %@",strCurrentDate);
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
        NSLog(@"New Date and Time: %@",strNewDate);
        [ _requestedTime addObject:strNewDate];
    }
}


-(void)addSlotPickerView1{
    
    
    
    _slotView = [[UIPickerView alloc]init];
    
    _slotView.dataSource = self;
    
    _slotView.delegate = self;
    
    _slotView.showsSelectionIndicator = YES;
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(setTime)];
    
    
    
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame: CGRectMake(0, 50, 320, 50)];
    
    [toolBar setBarStyle:UIBarStyleBlackTranslucent];
    
    NSArray *toolbarItems = [NSArray arrayWithObjects: doneButton, nil];
    
    [toolBar setItems:toolbarItems];
    
    _timeSlotField.inputView = _slotView;
    
    _timeSlotField.inputAccessoryView = toolBar;
    
}

- (IBAction)submitBtn:(id)sender {
    if([_dateField.text isEqualToString:@""]|| [_timeSlotField.text isEqualToString:@""]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Fields cannot be empty" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
        
        
        return;
        
    }
    
    
    _rideDetails=[[NSMutableArray alloc]init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"RideRequestStudent"];
    
    [query whereKey:@"currentDate" equalTo:_dateField.text];
    [query whereKey:@"timeSlot" equalTo:_timeSlotField.text];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
     {
        
         NSLog(@"%lu Ride history count",objects.count);
         
         for(id obj in objects){
             [_rideDetails addObject:obj];
         }
         
         [self performSegueWithIdentifier:@"rideDetails" sender:sender];
         
         
     }];
    
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"rideDetails"]) {
        DriverTripDetailsTableViewController *controller = segue.destinationViewController;
        controller.rideDetailsArray=_rideDetails;
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
    
    
    
}


-(void)setTime{
    
    NSInteger row;
    
    row=[_slotView selectedRowInComponent:0];
    
    [_timeSlotField setText:[_requestedTime objectAtIndex:row]];
    
    [self.timeSlotField resignFirstResponder];
    
    
    
}



-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
    
}



-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return [_requestedTime count];
    
    
    
}



-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    [_timeSlotField setText:[_requestedTime objectAtIndex:row]];
    
}



- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [_requestedTime objectAtIndex:row];
    
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
