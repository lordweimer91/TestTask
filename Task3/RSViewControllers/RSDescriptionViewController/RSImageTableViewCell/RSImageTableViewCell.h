//
//  RSImageTableViewCell.h
//  Task3
//
//  Created by user on 03.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSRestaurant.h"

extern NSString *const kRSImageTableViewCellErrorNotification;

@interface RSImageTableViewCell : UITableViewCell

-(void) setDataWithRestaurant:(RSRestaurant *)rest;

@end
