//
//  RSDataSource.h
//  Task3
//
//  Created by user on 28.06.18.
//  Copyright © 2018 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UITableView.h>
#import "RSTableViewCell.h"
#import "RSRestaurant.h"

@interface RSDataSource : NSObject <UITableViewDataSource>

-(void) arrayWithArray:(NSArray<RSRestaurant *> *)array;
@end
