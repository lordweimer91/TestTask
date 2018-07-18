//
//  RSFavoritesViewController.h
//  Task3
//
//  Created by user on 06.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSModel.h"
#import "RSFavoritesTableViewCell.h"

@interface RSFavoritesViewController : UIViewController <RSFavoritesTableViewCellDelegate>

@property (nonatomic, strong) RSModel *restaurantModel;

@end
