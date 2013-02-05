//
//  UIView+AnimatedSwap.m
//  NJASAP
//
//  Created by Ryan Nystrom on 1/10/13.
//  Copyright (c) 2013 Ryan Nystrom. All rights reserved.
//

#import "UIView+AnimatedSwap.h"

@implementation UIView (AnimatedSwap)

- (void)swapWithView:(UIView*)view duration:(CGFloat)duration {
    [UIView animateWithDuration:duration
                          delay:0
                        options:kNilOptions
                     animations:^{
                         self.alpha = 0;
                         view.alpha = 1;
                     }
                     completion:NULL];
}

@end
