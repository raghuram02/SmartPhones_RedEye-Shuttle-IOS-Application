//
//  Feedback.h
//  RedEye_Raghuram
//
//  Created by Raghuram Parthasarathy on 12/15/16.
//  Copyright © 2016 Raghuram Parthasarathy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
@interface Feedback : NSObject
@property NSString *nuid;
@property NSString *feedback;
@property NSString *currentDate;
@property NSString *timeSlot;
@property NSString *rideAddress;
@end
