//
//  UIImageView+AnimatedSwap.m
//  NJASAP
//
//  Created by Ryan Nystrom on 1/23/13.
//  Copyright (c) 2013 Ryan Nystrom. All rights reserved.
//

#import "UIImageView+AnimatedSwap.h"

@implementation UIImageView (AnimatedSwap)

- (void)swapCurrentImageWithImage:(UIImage*)image {
    [UIView transitionWithView:self.superview
                      duration:0.1f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        self.image = image;
                    }
                    completion:NULL];
}

@end
