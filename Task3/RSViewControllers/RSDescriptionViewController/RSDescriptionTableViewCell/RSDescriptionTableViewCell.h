//
//  RSDescriptionTableViewCell.h
//  Task3
//
//  Created by user on 04.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSRestaurant.h"

@interface RSDescriptionTableViewCell : UITableViewCell

-(void) setDataWithRestaurant:(RSRestaurant *)rest;

-(UIFont *) fontOfCell;

@end
