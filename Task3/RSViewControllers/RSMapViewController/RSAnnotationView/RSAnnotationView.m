//
//  RSAnnotationView.m
//  Task3
//
//  Created by user on 05.07.18.
//  Copyright © 2018 user. All rights reserved.
//

#import "RSAnnotationView.h"

@implementation RSAnnotationView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    
    [super setSelected:selected animated:animated];
    
    if(selected){
        self.buttonCustomeCallOut = [UIButton buttonWithType:UIButtonTypeCustom];//iconShare//iconShareBlue
        
        [self.buttonCustomeCallOut addTarget:self action:@selector(buttonHandlerCallOut:) forControlEvents:UIControlEventTouchDown];
        [self.buttonCustomeCallOut setBackgroundColor:[UIColor blueColor]];
        
        [self.buttonCustomeCallOut setFrame:CGRectMake(-40,-80, 100, 100)];
        
        [self addSubview:self.buttonCustomeCallOut];
        
        [self.buttonCustomeCallOut setUserInteractionEnabled:YES];
    }
    else
    {
        //Remove your custom view...
        [self.buttonCustomeCallOut setUserInteractionEnabled:NO];
        [self.buttonCustomeCallOut removeFromSuperview];
        
        self.buttonCustomeCallOut=nil;
    }
}
-(void)buttonHandlerCallOut:(UIButton*)sender{
    NSLog(@"Annotation Clicked");
}

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent*)event
{
    UIView* v = [super hitTest:point withEvent:event];
    if (v != nil)
    {
        [self.superview bringSubviewToFront:self];
    }
    return v;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event
{
    CGRect rec = self.bounds;
    BOOL isIn = CGRectContainsPoint(rec, point);
    if(!isIn)
    {
        for (UIView *v in self.subviews)
        {
            isIn = CGRectContainsPoint(v.frame, point);
            if(isIn)
                break;
        }
    }
    return isIn;
}

@end
