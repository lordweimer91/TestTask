//
//  RSReviewTableViewCell.m
//  Task3
//
//  Created by user on 03.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import "RSReviewTableViewCell.h"

@interface RSReviewTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *reviewLabel;
@end

@implementation RSReviewTableViewCell

-(void)setDataWithReview:(RSReview *)review
{
    self.nameLabel.text = review.author;
    self.dateLabel.text = review.dateString;
    self.reviewLabel.text = review.text;
}

-(UIFont *) fontOfCell
{
    return self.reviewLabel.font;
}

@end
