//
//  AccountViewController.m
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/7/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import "AccountViewController.h"

@interface AccountViewController ()

@end

@implementation AccountViewController
//@synthesize photoView;
//@synthesize imageController;

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _emailID= [defaults stringForKey:@"emailID"];
      NSLog(@"%@ Account screen",_emailID);
  
    PFQuery *query=[PFQuery queryWithClassName:@"StudentRE"];
    [query whereKey:@"emailID" equalTo:_emailID];
    
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
     
     
     {
         
           NSLog(@"%lu count",objects.count);
         
         if(objects.count>0){
             PFObject *obj=[objects firstObject];
             _firstName=[obj objectForKey:@"firstName"];
             NSLog(@"%@ Fname",_firstName);
              _lastName=[obj objectForKey:@"lastName"];
             NSLog(@"%@ lname",_lastName);
              _phoneNumber=[obj objectForKey:@"phoneNumber"];
             NSLog(@"%@ phone",_phoneNumber);
             
         }
     
         
         
     }];
    
    
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

//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
//{
//    
//    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
//    photoView.image = image;
//    
//    [self dismissModalViewControllerAnimated:YES];
//    
//    
//}
//
//- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
//{
//    [self dismissModalViewControllerAnimated:YES];
//}
//
//- (IBAction)imageSubmit:(id)sender {
//    
//    imageController = [[UIImagePickerController alloc] init];
//    
//    imageController.delegate = self;
//    
//    [self presentViewController:imageController animated:YES completion:NULL];
//}
//
//- (IBAction)saveImage:(UIImage*)image saveImageName:(NSString*) imageName
//
//{
//    
//    if (image != nil)
//        
//    {
//  
//        
//        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
//                                                             
//                                                             NSUserDomainMask, YES);
//        
//        NSString *documentsDirectory = [paths objectAtIndex:0];
//        
//        NSString* path = [documentsDirectory stringByAppendingPathComponent:
//                          
//                          imageName ];
//        
//
//        
//        NSData* data = UIImagePNGRepresentation(image);
//        
//        [image setAccessibilityIdentifier:imageName];
//        
//        [data writeToFile:path atomically:YES];
//        
//    }
//    
//}

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




- (IBAction)submitAccount:(id)sender {
    
    if([_nuidField.text isEqualToString:@""]|| [_addressField.text isEqualToString:@""]||[_cityField.text isEqualToString:@""]|| [_stateField.text isEqualToString:@""]||[_zipField.text isEqualToString:@""]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Fields cannot be null" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
        
        
        return;
        
    }
    
    
      if([self isAlphabetic:_cityField.text]==NO){
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter only String for city" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
        
        
        return;
        
    }
    
    if([self isAlphabetic:_stateField.text]==NO){
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter only String for State" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
        
        
        return;
        
    }
    
    
    if([self isNumeric:_nuidField.text]==NO){
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter only Number for NUID" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
        
        
        return;
        
    }

    
    
    if([self isNumeric:_zipField.text]==NO){
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter only Number for zipcode" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
        
        
        return;
        
    }

    
    PFObject *account = [PFObject objectWithClassName:@"Account_Student"];
    
    [account setObject:_nuidField.text forKey:@"nuid"];
    [account setObject:_addressField.text forKey:@"address"];
    [account setObject:_cityField.text forKey:@"city"];
    [account setObject:_stateField.text forKey:@"state"];
    [account setObject:_zipField.text forKey:@"zip"];
    
    
//    NSString *photoName=[_nuidField.text stringByAppendingString:_cityField.text];
//    photoName=[photoName stringByAppendingString:@".png"];
//    [self saveImage:photoView.image saveImageName:photoName];
//    
//    [account setObject:photoName forKey:@"photo"];
    [account setObject:_emailID forKey:@"emailID"];
    [account setObject:_firstName forKey:@"firstName"];
    [account setObject:_lastName forKey:@"lastName"];
    [account setObject:_phoneNumber forKey:@"phoneNumber"];
    
    
    [account save];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Account_Student"];
    
    NSLog(@"%@",query);
    
    // [query whereKey:@"username" equalTo:@"normal"];
    [query whereKey:@"nuid" equalTo:_nuidField.text];
    
    
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
     
     
     
     {
         
         
         
         NSLog(@"%lu", objects.count);
         
         if(objects.count>0){
             
             
             PFObject *obj = [objects firstObject];
             NSLog(@"%@", [obj valueForKey:@"nuid"]);
             
             NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
             
             [defaults setValue:[obj valueForKey:@"nuid"] forKey:@"nuid"];
             
             [defaults synchronize];
             
             NSString *email= [defaults stringForKey:@"nuid"];
             NSLog(@"%@",email);
             
             
             
             
             [self performSegueWithIdentifier:@"pushSegue" sender:sender];
             
             
             
             
             
         }else{
             
             UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
             [alert show];
             
         }
         
     }];
    
    
    
    UIAlertView *success = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Account Details Saved Successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    
    
    [success show];
}

@end
