//
//  RideHistoryCell.h
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/15/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RideHistoryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *timeslot;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *address;

@property (weak, nonatomic) IBOutlet UITextView *feedbackView;
@end
