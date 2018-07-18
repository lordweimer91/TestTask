//
//  RSTabBarController.h
//  Task3
//
//  Created by user on 05.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSModel.h"

@interface RSTabBarController : UITabBarController
@property (nonatomic, strong) RSModel *restaurantModel;
@property (nonatomic, strong) RSRestaurant *restaurant;
@end
