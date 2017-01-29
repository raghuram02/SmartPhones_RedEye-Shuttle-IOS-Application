//
//  RequestRideViewController.m
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/7/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import "RequestRideViewController.h"

@interface RequestRideViewController ()

@end

@implementation RequestRideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self timeSlotData];
    [self addSlotPickerView];
    _datePicker=[[UIDatePicker alloc]init];
    _datePicker.datePickerMode=UIDatePickerModeDate;
    [self.currentDateField setInputView:_datePicker];
    
    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolBar setTintColor:[UIColor grayColor]];
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain
                                                            target:self action:@selector(ShowSelectedDate)];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                        target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space,doneBtn, nil]];
    [self.currentDateField setInputAccessoryView:toolBar];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _nuid= [defaults stringForKey:@"nuid"];
    

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)ShowSelectedDate{
    
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"MM/dd/yyyy"];
    
    self.currentDateField.text=[NSString stringWithFormat:@"%@",[formatter stringFromDate:_datePicker.date]];
    [self.currentDateField resignFirstResponder];
}

-(void)timeSlotData{
    
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
}


-(void)addSlotPickerView{
    
    
    
    _slotPickerView = [[UIPickerView alloc]init];
    
    _slotPickerView.dataSource = self;
    
    _slotPickerView.delegate = self;
    
    _slotPickerView.showsSelectionIndicator = YES;
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(setTime)];
    
    
    
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame: CGRectMake(0, 50, 320, 50)];
    
    [toolBar setBarStyle:UIBarStyleBlackTranslucent];
    
    NSArray *toolbarItems = [NSArray arrayWithObjects: doneButton, nil];
    
    [toolBar setItems:toolbarItems];
    
    _slotField.inputView = _slotPickerView;
    
    _slotField.inputAccessoryView = toolBar;
    
}



-(void)setTime{
    
    NSInteger row;
    
    row=[_slotPickerView selectedRowInComponent:0];
    
    [_slotField setText:[_timeSlots objectAtIndex:row]];
    
    [self.slotField resignFirstResponder];
    
    
    
}



-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
    
}



-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return [_timeSlots count];
    
    
    
}



-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    [_slotField setText:[_timeSlots objectAtIndex:row]];
    
}



- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [_timeSlots objectAtIndex:row];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)submitRideRequest:(id)sender {
    
    if([_currentDateField.text isEqualToString:@""]|| [_slotField.text isEqualToString:@""]||[_rideAddressField.text isEqualToString:@""]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Fields cannot be null" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
        
        
        return;
        
    }
    
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSLog(@"%@ defaults email",[defaults valueForKey:@"emailID"]);
    PFQuery *query = [PFQuery queryWithClassName:@"RideRequestStudent"];
    [query whereKey:@"timeSlot" equalTo:_slotField.text];
    [query whereKey:@"currentDate" equalTo:_currentDateField.text];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
    
    {
        if(objects.count<=3){
            PFQuery *query1=[PFQuery queryWithClassName:@"Account_Student"];
             [query1 whereKey:@"emailID" equalTo:[defaults valueForKey:@"emailID"]];
            PFObject *obj=[query1 getFirstObject];
            
            PFObject *requestRide = [PFObject objectWithClassName:@"RideRequestStudent"];
            [requestRide setObject:_currentDateField.text forKey:@"currentDate"];
            [requestRide setObject:_slotField.text forKey:@"timeSlot"];
            [requestRide setObject:_rideAddressField.text forKey:@"rideAddress"];
            
            
            
            [requestRide setObject:[obj valueForKey:@"nuid"] forKey:@"nuid"];
            [requestRide setObject:[obj valueForKey:@"firstName"] forKey:@"firstName"];
            [requestRide setObject:[obj valueForKey:@"lastName"] forKey:@"lastName"];
            [requestRide save];
            
            UIAlertView *success = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Shuttle Ride Requested Successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            
            
            
            [success show];
        }else{
            
            UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Slots are full" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            
            
            
            [error show];
        }
        
        
    }];
    
    
    
    
    
    
    

}
@end
