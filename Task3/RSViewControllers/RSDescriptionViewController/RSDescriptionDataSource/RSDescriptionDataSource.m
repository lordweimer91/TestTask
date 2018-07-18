//
//  RSDescriptionDataSource.m
//  Task3
//
//  Created by user on 04.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import "RSDescriptionDataSource.h"

@interface RSDescriptionDataSource()

@property (nonatomic, strong) NSMutableArray<RSReview *> *arrayOfReview;

@end

@implementation RSDescriptionDataSource

-(instancetype)init
{
    if(self = [super init]){
        _arrayOfReview = [NSMutableArray new];
        _restaurant = [RSRestaurant new];
    }
    return self;
}

-(void) itemsWithReviewsArray:(NSArray<RSReview *> *)array
{
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"dateString"
                                                           ascending:YES
                                                            selector:@selector(caseInsensitiveCompare:)];
    self.arrayOfReview = [NSMutableArray arrayWithArray:[array sortedArrayUsingDescriptors:@[sort]]];
}

-(RSReview *) itemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < self.arrayOfReview.count){
        return self.arrayOfReview[indexPath.row];
    }
    return  nil;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSInteger number = self.arrayOfReview.count;
    if(self.restaurant.restaurantImagePath.count) {
        number++;
    }
    return (number + 1);
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0){
        RSDescriptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"descriptionTableViewCellID"];
        [cell setDataWithRestaurant:self.restaurant];
        return cell;
    }
    if(indexPath.row == 1){
        RSImageTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"imageTableViewCellID"];
        [cell setDataWithRestaurant:self.restaurant];
        return cell;
    }
    RSReviewTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"reviewTableViewCellID"];
    [cell setDataWithReview:self.arrayOfReview[indexPath.row - 2]];
    return cell;
}

@end
