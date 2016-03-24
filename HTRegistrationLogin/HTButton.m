//
//  HTButton.m
//  HTRegistrationLogin
//
//  Created by Hermine on 3/19/16.
//  Copyright © 2016 Hermine. All rights reserved.
//

#import "HTButton.h"

@implementation HTButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithCoder:(NSCoder*)coder {
    
    self = [super initWithCoder:coder];
    
    if (self) {

        UIColor *myColor = [UIColor colorWithRed:0.0/255.0 green:175.0/255.0 blue:178.0/255.0 alpha:1.0];
        
        self.backgroundColor = myColor;
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.layer.cornerRadius = 6;
        CGRect frame = self.frame;
        frame.size.height = 30;
        self.frame = frame;
        
    }
    return self;
}





@end
