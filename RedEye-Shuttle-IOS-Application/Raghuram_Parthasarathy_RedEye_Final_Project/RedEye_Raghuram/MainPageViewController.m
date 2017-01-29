//
//  MainPageViewController.m
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/7/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import "MainPageViewController.h"

@interface MainPageViewController ()

@end

@implementation MainPageViewController

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

- (IBAction)loginSegment:(UISegmentedControl*)sender {
    
    
    if(sender.selectedSegmentIndex ==0){
        
        [UIView animateWithDuration:0.5 animations:^{
            
            
            
            _login.alpha=0.0;
            
            _Register.alpha=1.0;
            
           
            
            
            
        }];
        
        
        
    }else if(sender.selectedSegmentIndex ==1){
        
        [UIView animateWithDuration:0.5 animations:^{
            
            
            
            
            
            _login.alpha=1.0;
            
            _Register.alpha=0.0;
            
            
            
        }];
        
    }
}
@end
