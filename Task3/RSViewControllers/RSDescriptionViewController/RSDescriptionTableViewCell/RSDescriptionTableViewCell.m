//
//  RSDescriptionTableViewCell.m
//  Task3
//
//  Created by user on 04.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import "RSDescriptionTableViewCell.h"

@interface RSDescriptionTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, strong) NSString *text;
@end

@implementation RSDescriptionTableViewCell

-(void)setDataWithRestaurant:(RSRestaurant *)rest
{
    self.text = [NSString stringWithFormat:@"%@\r\nAddress: %@",rest.restaurantDescription, rest.restaurantAddress];
    self.descriptionLabel.text = self.text;
}

-(UIFont *) fontOfCell
{
    return self.descriptionLabel.font;
}

@end
