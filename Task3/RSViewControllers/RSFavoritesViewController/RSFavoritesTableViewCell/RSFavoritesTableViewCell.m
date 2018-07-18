//
//  RSFavoritesTableViewCell.m
//  Task3
//
//  Created by user on 06.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import "RSFavoritesTableViewCell.h"

@interface RSFavoritesTableViewCell()
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UIButton *favoriteButton;
@end

@implementation RSFavoritesTableViewCell

-(IBAction)pushVavoriteBitton:(id)sender
{
    if([self.delegate respondsToSelector:@selector(clickButtonOnFavoritesTableViewCell:)]){
        [self.delegate clickButtonOnFavoritesTableViewCell:self];
    }
}

-(void) setDataWithRestaurant:(RSRestaurant *)rest
{
    self.nameLabel.text = rest.restaurantName;
    if(rest.restaurantFavorite){
        self.favoriteButton.hidden = NO;
    } else {
        self.favoriteButton.hidden = YES;
    }
}

@end
