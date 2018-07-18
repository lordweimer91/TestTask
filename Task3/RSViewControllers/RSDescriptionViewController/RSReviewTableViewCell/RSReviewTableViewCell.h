//
//  RSReviewTableViewCell.h
//  Task3
//
//  Created by user on 03.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSReview.h"

@interface RSReviewTableViewCell : UITableViewCell

-(void) setDataWithReview:(RSReview *)review;
-(UIFont *) fontOfCell;
@end
