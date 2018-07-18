//
//  RSDescriptionViewController.m
//  Task3
//
//  Created by user on 28.06.18.
//  Copyright © 2018 user. All rights reserved.
//

#import "RSDescriptionViewController.h"
#import "RSDescriptionDataSource.h"
#import "RSMapViewController.h"

@interface RSDescriptionViewController () <UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UILabel *ratingLabel;
@property (nonatomic ,weak) IBOutlet UITextField *authorTextField;
@property (nonatomic, weak) IBOutlet UITextView *addReviewTextView;
@property (nonatomic, weak) IBOutlet UITableView *contentTableView;
@property (nonatomic, weak) IBOutlet UIButton *favoriteButton;

@property (nonatomic, strong) RSDescriptionDataSource *dataSourse;

@end

@implementation RSDescriptionViewController

-(void) viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(imageTableViewCellSendError:)
                                                 name:kRSImageTableViewCellErrorNotification
                                               object:nil];
    
    self.dataSourse = [RSDescriptionDataSource new];
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    self.dataSourse.restaurant = self.restaurant;
    
    self.contentTableView.dataSource = self.dataSourse;
    
    self.ratingLabel.text = [NSString stringWithFormat:@"%0.1f", self.restaurant.restaurantRating];
    self.title = self.restaurant.restaurantName;
    [self setFavorite:self.restaurant.restaurantFavorite];
    [self addReview];
}

-(void) setFavorite:(BOOL)favorite
{
    if(favorite){
        [self.favoriteButton setImage:[UIImage imageNamed:@"favorites128_icon"]
                             forState:UIControlStateNormal];
    } else {
        [self.favoriteButton setImage:[UIImage imageNamed:@"unfavorites128_icon"]
                             forState:UIControlStateNormal];
    }
}

-(void) imageTableViewCellSendError:(NSNotification *)notification
{
    if([notification.object isKindOfClass:[NSError class]]){
        NSError *error = notification.object;
        [self showAlertWithError:error];
    }
}

-(void) addReview
{
    NSArray *reviews = [self.restaurantModel getReviewRestaurant:self.restaurant
                                                         success:^(NSArray<RSReview *> *arrayWithRestaurantsReview) {
                                                             [self.dataSourse itemsWithReviewsArray:arrayWithRestaurantsReview];
                                                             [self.contentTableView reloadData];
                                                         }
                                                         failure:^(NSError *error) {
                                                            [self showAlertWithError:error];
                                                         }];
    [self.dataSourse itemsWithReviewsArray:reviews];
    [self.contentTableView reloadData];
}

-(IBAction)addReviewButton:(id)sender
{
    if(self.authorTextField.text.length && self.addReviewTextView.text.length){
        RSReview *review = [RSReview reviewWithKey:@""
                                            author:self.authorTextField.text
                                                id:self.restaurant.restaurantID
                                              text:self.addReviewTextView.text
                                              date:[NSDate date]];
        [self.restaurantModel postNewReview:review
                          completionHandler:^(id responseObject, NSError * error) {
                              if(error){
                                  [self showAlertWithError:error];
                              } else {
                                  [self addReview];
                              }
                          }];
        self.addReviewTextView.text = @"";
        self.authorTextField.text = @"";
    }
}

-(IBAction)showOnMap:(id)sender
{
    RSMapViewController *ctrl = [self.storyboard instantiateViewControllerWithIdentifier:@"RSMapViewController"];
    ctrl.restaurantModel = self.restaurantModel;
    ctrl.restaurant = self.restaurant;
    ctrl.title = self.restaurant.restaurantName;
    [self.navigationController pushViewController:ctrl
                                        animated:YES];
}

-(IBAction)clickFavoriteButton:(id)sender
{
    [self.restaurantModel setFavoritesRestaurant:self.restaurant
                                    withFavorite:!self.restaurant.restaurantFavorite];
    [self setFavorite:self.restaurant.restaurantFavorite];
}

#pragma mark - UITableViewDelegate

-    (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if(indexPath.row == 1){
        return tableView.contentSize.width - 10.0;
    }
    return UITableViewAutomaticDimension;
}


@end
