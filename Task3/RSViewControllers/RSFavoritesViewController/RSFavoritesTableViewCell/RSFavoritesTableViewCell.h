//
//  RSFavoritesTableViewCell.h
//  Task3
//
//  Created by user on 06.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSRestaurant.h"

@protocol RSFavoritesTableViewCellDelegate<NSObject>
-(void) clickButtonOnFavoritesTableViewCell:(UITableViewCell *)cell;
@end

@interface RSFavoritesTableViewCell : UITableViewCell

@property (nonatomic, strong) id<RSFavoritesTableViewCellDelegate> delegate;

-(void) setDataWithRestaurant:(RSRestaurant *)rest;

@end
