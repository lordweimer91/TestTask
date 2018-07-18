//
//  RSTableViewCell.h
//  Task3
//
//  Created by user on 28.06.18.
//  Copyright © 2018 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSRestaurant.h"

@interface RSTableViewCell : UITableViewCell

-(void) setDataWithRestaurant:(RSRestaurant *)restaurant;

@end
