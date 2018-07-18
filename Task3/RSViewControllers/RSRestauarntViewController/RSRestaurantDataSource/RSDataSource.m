//
//  RSDataSource.m
//  Task3
//
//  Created by user on 28.06.18.
//  Copyright © 2018 user. All rights reserved.
//

#import "RSDataSource.h"

@interface RSDataSource()
@property (nonatomic, strong) NSArray<RSRestaurant *> *arrayOfRestaurant;
@end

@implementation RSDataSource

-(instancetype)init
{
    if(self = [super init]) {
        _arrayOfRestaurant = [NSMutableArray new];
    }
    return self;
}

-(void) arrayWithArray:(NSArray<RSRestaurant *> *)array
{
    self.arrayOfRestaurant = [NSArray arrayWithArray:array];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.arrayOfRestaurant.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RSTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"restaurantCellID"];
    [cell setDataWithRestaurant:self.arrayOfRestaurant[indexPath.row]];
    return cell;
}

@end
