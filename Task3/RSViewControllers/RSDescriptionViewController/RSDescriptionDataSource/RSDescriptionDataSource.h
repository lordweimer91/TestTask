//
//  RSDescriptionDataSource.h
//  Task3
//
//  Created by user on 04.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UITableView.h>
#import "RSTableViewCell.h"
#import "RSRestaurant.h"
#import "RSImageTableViewCell.h"
#import "RSReviewTableViewCell.h"
#import "RSDescriptionTableViewCell.h"

@interface RSDescriptionDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) RSRestaurant *restaurant;

-(void) itemsWithReviewsArray:(NSArray<RSReview *> *)array;
-(RSReview *) itemAtIndexPath:(NSIndexPath *)indexPath;
@end

