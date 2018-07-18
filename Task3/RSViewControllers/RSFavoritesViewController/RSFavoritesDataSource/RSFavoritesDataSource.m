//
//  RSFavoritesDataSource.m
//  Task3
//
//  Created by user on 06.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import "RSFavoritesDataSource.h"

@interface RSFavoritesDataSource()
@property (nonatomic, strong) NSArray<RSRestaurant *> *favoriteArray;
@end

@implementation RSFavoritesDataSource

-(instancetype)init
{
    if(self = [super init]){
        _favoriteArray = [NSArray new];
    }
    return self;
}

-(void) favoritesArrayWithArray:(NSArray<RSRestaurant *> *)array
{
    self.favoriteArray = [NSArray arrayWithArray:array];
}

-(RSRestaurant *) restaurantAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row < self.favoriteArray.count){
        return self.favoriteArray[indexPath.row];
    }
    return nil;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.favoriteArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RSFavoritesTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"favoritesCellID"];
    [cell setDataWithRestaurant:self.favoriteArray[indexPath.row]];
    cell.delegate = self.delegate;
    return cell;
}


@end
