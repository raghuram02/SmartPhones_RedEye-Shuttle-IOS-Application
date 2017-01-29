//
//  RegisterViewController.m
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/7/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self addRolePickerView];
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

-(void)addRolePickerView{
    
    _roleArray = [[NSArray alloc]initWithObjects:@"Student",@"Driver",@"NUPD", nil];
    
    
    
    _rolePickerView = [[UIPickerView alloc]init];
    
    _rolePickerView.dataSource = self;
    
    _rolePickerView.delegate = self;
    
    _rolePickerView.showsSelectionIndicator = YES;
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(setRole)];
    
    
    
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame: CGRectMake(0, 50, 320, 50)];
    
    [toolBar setBarStyle:UIBarStyleBlackTranslucent];
    
    NSArray *toolbarItems = [NSArray arrayWithObjects: doneButton, nil];
    
    [toolBar setItems:toolbarItems];
    
    _roleField.inputView = _rolePickerView;
    
    _roleField.inputAccessoryView = toolBar;
    
}



-(void)setRole{
    
    NSInteger row;
    
    row=[_rolePickerView selectedRowInComponent:0];
    
    [_roleField setText:[_roleArray objectAtIndex:row]];
    
    [self.roleField resignFirstResponder];
    
    
    
}



-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
    
}



-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return [_roleArray count];
    
    
    
}



-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    [_roleField setText:[_roleArray objectAtIndex:row]];
    
}



- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [_roleArray objectAtIndex:row];
    
}


-(BOOL)isAlphabetic:(NSString *)text{
    NSString *alpha=@"[a-zA-Z]*";
    
    NSPredicate *regexTest=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",alpha];
    
    return [regexTest evaluateWithObject:text];
    
    
    
}

-(BOOL)isNumeric:(NSString *)text{
    
    
    BOOL isValid = NO;
    
    NSCharacterSet *alphaNums = [NSCharacterSet decimalDigitCharacterSet];
    
    NSCharacterSet *inStringSet = [NSCharacterSet characterSetWithCharactersInString:text];
    
    isValid= [alphaNums isSupersetOfSet:inStringSet];
    
    return isValid;
    
}







-(BOOL)isPhone:(NSString *)phoneNo{
    
    
    
    NSString *phoneRegex = @"[0-9]{10}";
    
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    
    return [test evaluateWithObject:phoneNo];
    
    
    
}



- (BOOL)isEmail:(NSString*)email

{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    NSLog(@"%@ email",email);
    
    return [emailTest evaluateWithObject:email];
    
}







- (IBAction)signUpButton:(id)sender {
    
    PFObject *student = [PFObject objectWithClassName:@"StudentRE"];
    
    
    
    [student setObject:_fnameField.text forKey:@"firstName"];
    
    [student setObject:_lnameField.text forKey:@"lastName"];
    
    [student setObject:_emailField.text forKey:@"emailID"];
    
    [student setObject: _passwordField.text forKey:@"password"];
    
    [student setObject:_phoneField.text forKey:@"phoneNumber"];
    [student setObject:_roleField.text forKey:@"role"];
    
    
    if([_fnameField.text isEqualToString:@""]|| [_lnameField.text isEqualToString:@""]|| [_emailField.text isEqualToString:@""]|| [_passwordField.text isEqualToString:@""]|| [_phoneField.text isEqualToString:@""]|| [_roleField.text isEqualToString:@""]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Field cannot be null" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
        
        
        return;
        
    }
    
    if([self isAlphabetic:_fnameField.text]==NO){
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter only String for First Name" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
        
        
        return;
        
    }

    if([self isAlphabetic:_lnameField.text]==NO){
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter only String for Last Name" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
        
        
        return;
        
    }

    if([self isEmail:_emailField.text]==NO){
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter a valid email" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
        
        
        return;
        
    }
    
    
    
    if([self isPhone:_phoneField.text]==NO){
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter a phone number" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
        
        
        return;
        
    }
    self.emailField.text = @"";
    self.lnameField.text = @"";
    self.fnameField.text = @"";
    self.roleField.text = @"";
    self.passwordField.text = @"";
    self.phoneField.text = @"";
    
    
   
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Registered successfully" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alert show];
    
    
    [student save];
    
}
@end
