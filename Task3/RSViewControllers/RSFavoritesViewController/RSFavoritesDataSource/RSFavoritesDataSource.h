//
//  RSFavoritesDataSource.h
//  Task3
//
//  Created by user on 06.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UITableView.h>
#import "RSFavoritesTableViewCell.h"
#import "RSRestaurant.h"

@interface RSFavoritesDataSource : NSObject<UITableViewDataSource>

@property (nonatomic, weak) id<RSFavoritesTableViewCellDelegate> delegate;

-(void) favoritesArrayWithArray:(NSArray<RSRestaurant *> *)array;
-(RSRestaurant *) restaurantAtIndexPath:(NSIndexPath *)indexPath;

@end
