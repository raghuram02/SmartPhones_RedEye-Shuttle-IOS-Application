//
//  LoginViewController.m
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/7/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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

//- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(nullable id)sender
//
//{
//    
//    return _compare;
//    
//}



// In a storyboard-based application, you will often want to do a little preparation before navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"pushSegue"]) {
        
        WelcomeViewController *controller = [segue destinationViewController];
        
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        
        controller.navigationItem.leftItemsSupplementBackButton = YES;
        
    }
    
    
    
    
    
    
    
}



- (BOOL)isEmail:(NSString*)email

{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    NSLog(@"%@ email",email);
    
    return [emailTest evaluateWithObject:email];
    
}



-(BOOL)isPassword:(NSString*)password{
    
    NSString *regex = @"^(?=.{10,})(?=.*[0-9])(?=.*[a-zA-Z])([@#$%^&=a-zA-Z0-9_-]+)$";
    
    NSPredicate *pass = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pass evaluateWithObject:password];
    
}





- (IBAction)loginBtn:(id)sender {
   
    
 
    if([_emailField1.text isEqualToString:@""]|| [_passwordField1.text isEqualToString:@""]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Fields cannot be null" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
        
        
        return;
        
    }

    
    
    if([self isEmail:_emailField1.text]==NO){
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter a valid email" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
        
        
        return;
        
    }
    
  
    

    
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"StudentRE"];
    
    NSLog(@"%@",query);
    
    // [query whereKey:@"username" equalTo:@"normal"];
    [query whereKey:@"emailID" equalTo:_emailField1.text];
    
    [query whereKey:@"password" equalTo:_passwordField1.text];
    
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
     
     
     
     {
         
         
         
         NSLog(@"%lu", objects.count);
         
         if(objects.count>0){
             
             
             PFObject *obj = [objects firstObject];
              NSString *role=[obj valueForKey:@"role"];
             NSLog(@"%@", [obj valueForKey:@"emailID"]);
             
             NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
             
             [defaults setValue:[obj valueForKey:@"emailID"] forKey:@"emailID"];
             
             [defaults synchronize];
             
             if([role isEqualToString:@"Student"]){
                 
                 [self performSegueWithIdentifier:@"pushSegue" sender:sender];
                 
             }else if ([role isEqualToString:@"Driver"]){
                 
                 [self performSegueWithIdentifier:@"driverSegue" sender:sender];
                 
             }else if ([role isEqualToString:@"NUPD"]){
                 
                 [self performSegueWithIdentifier:@"nupdSegue" sender:sender];
                 
             }
             self.emailField1.text = @"";
             self.passwordField1.text = @"";
             
             
      
             
             
             
         }else{
              UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter the credentials correctly" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
             
             
             
              [error show];
             
         }
         
     }];
    
    
    
}
@end
