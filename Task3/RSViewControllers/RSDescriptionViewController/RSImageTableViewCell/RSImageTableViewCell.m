//
//  RSImageTableViewCell.m
//  Task3
//
//  Created by user on 03.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import "RSImageTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

NSString *const kRSImageTableViewCellErrorNotification = @"kRSImageTableViewCellErrorNotification";

@interface RSImageTableViewCell()
@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;
@end

@implementation RSImageTableViewCell

-(void)setDataWithRestaurant:(RSRestaurant *)rest
{
    while (self.imageScrollView.subviews.count) {
        [self.imageScrollView.subviews.lastObject removeFromSuperview];
    }
    self.imageScrollView.contentSize = CGSizeMake(0.0f, self.imageScrollView.frame.size.width);
    
    CGRect frame = CGRectMake(0,
                              0,
                              self.imageScrollView.contentSize.height,
                              self.imageScrollView.contentSize.height);
    for(NSURL *imageURL in rest.restaurantImagePath){
        UIImageView *imageView = [UIImageView new];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.frame = frame;
        UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]
                     initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        indicator.color = [UIColor redColor];
        indicator.center = imageView.center;
        [imageView addSubview:indicator];
        indicator.hidesWhenStopped = YES;
        [indicator startAnimating];
        [imageView sd_setImageWithURL:imageURL
                            completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            if(error) {
                [[NSNotificationCenter defaultCenter] postNotificationName:kRSImageTableViewCellErrorNotification
                                                                    object:error];
            }
            [indicator stopAnimating];
        }];
        [self.imageScrollView addSubview:imageView];
        frame.origin.x += self.imageScrollView.contentSize.height;
        self.imageScrollView.contentSize = CGSizeMake(self.imageScrollView.contentSize.width + self.imageScrollView.contentSize.height,
                                                      self.imageScrollView.contentSize.height);
    }
}

@end
