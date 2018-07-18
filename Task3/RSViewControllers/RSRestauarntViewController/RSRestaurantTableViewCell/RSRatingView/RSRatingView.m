//
//  RSRatingView.m
//  Task3
//
//  Created by user on 04.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import "RSRatingView.h"

@implementation RSRatingView

-(void) setPercentOfMask:(CGFloat)percent
{
    CAShapeLayer *revealShape = [CAShapeLayer layer];
    revealShape.bounds = self.bounds;
    revealShape.fillColor = [UIColor whiteColor].CGColor;
    
    UIBezierPath *startPath = [UIBezierPath bezierPathWithRect:CGRectMake(0,
                                                                          0,
                                                                          CGRectGetMaxX(self.bounds) * percent,
                                                                          CGRectGetMaxY(self.bounds))];
    revealShape.path = startPath.CGPath;
    revealShape.position = CGPointMake(CGRectGetMidX(self.bounds),
                                       CGRectGetMidY(self.bounds));
    self.layer.mask = revealShape;
}

@end
