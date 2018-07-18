//
//  RSTableViewCell.m
//  Task3
//
//  Created by user on 28.06.18.
//  Copyright © 2018 user. All rights reserved.
//

#import "RSTableViewCell.h"
#import "RSRatingView.h"

@interface RSTableViewCell()
@property (nonatomic,weak) IBOutlet UILabel *nameLabel;
@property (nonatomic,weak) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet RSRatingView *rating0ImageView;
@property (weak, nonatomic) IBOutlet RSRatingView *rating1ImageView;
@property (weak, nonatomic) IBOutlet RSRatingView *rating2ImageView;
@property (weak, nonatomic) IBOutlet RSRatingView *rating3ImageView;
@property (weak, nonatomic) IBOutlet RSRatingView *rating4ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *favoriteImageView;

@end

@implementation RSTableViewCell

-(void) setDataWithRestaurant:(RSRestaurant *)restaurant
{
    self.nameLabel.text = restaurant.restaurantName;
    self.ratingLabel.text = [NSString stringWithFormat:@"%0.1f",restaurant.restaurantRating];
    self.favoriteImageView.hidden = !restaurant.restaurantFavorite;
    NSArray<RSRatingView *> *ratingViews = [NSArray arrayWithObjects:self.rating0ImageView,
                                                                     self.rating1ImageView,
                                                                     self.rating2ImageView,
                                                                     self.rating3ImageView,
                                                                     self.rating4ImageView, nil];
    for(RSRatingView *ratingView in ratingViews){
        ratingView.hidden = YES;
    }
    CGFloat rating = restaurant.restaurantRating / 2.0f;
    if(rating > 5.0f){
        rating = 5.0f;
    }
    NSUInteger i = 4;
    while(rating > 1.0f){
        ratingViews[i--].hidden = NO;
        [ratingViews[i] setPercentOfMask:1.0f];
        rating -= 1.0f;
    }
    ratingViews[i].hidden = NO;
    [ratingViews[i] setPercentOfMask:rating];
}


@end
