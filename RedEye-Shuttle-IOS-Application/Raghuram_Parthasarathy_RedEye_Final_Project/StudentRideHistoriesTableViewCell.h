//
//  StudentRideHistoriesTableViewCell.h
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/16/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentRideHistoriesTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *firstName;
@property (weak, nonatomic) IBOutlet UILabel *lastName;
@property (weak, nonatomic) IBOutlet UILabel *nuid;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UILabel *rideTime;
@property (weak, nonatomic) IBOutlet UILabel *rideDate;
@property (weak, nonatomic) IBOutlet UILabel *rideAddress;
@property (weak, nonatomic) IBOutlet UILabel *feedBack;
@end
