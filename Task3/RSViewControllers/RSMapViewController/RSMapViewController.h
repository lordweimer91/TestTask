//
//  RSMapViewController.h
//  Task3
//
//  Created by user on 05.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSModel.h"

@interface RSMapViewController : UIViewController
@property (nonatomic, strong) RSModel *restaurantModel;
@property (nonatomic, strong) RSRestaurant *restaurant;

-(void) showRestaurantOnMap:(RSRestaurant *)rest
           withValueForSpan:(double)value;
@end
