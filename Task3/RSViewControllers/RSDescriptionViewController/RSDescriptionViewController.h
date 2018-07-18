//
//  RSDescriptionViewController.h
//  Task3
//
//  Created by user on 28.06.18.
//  Copyright © 2018 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+RSAlert.h"
#import "RSModel.h"

@interface RSDescriptionViewController : UIViewController

@property (nonatomic, strong) RSRestaurant *restaurant;
@property (nonatomic, strong) RSModel *restaurantModel;

@end
