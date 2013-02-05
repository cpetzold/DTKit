//
//  UIView+Fading.m
//  NJASAP
//
//  Created by Ryan Nystrom on 1/24/13.
//  Copyright (c) 2013 Ryan Nystrom. All rights reserved.
//

#import "UIView+Fading.h"

@implementation UIView (Fading)

- (void)fadeInWithDuration:(CGFloat)duration {
    [UIView animateWithDuration:duration
                          delay:0
                        options:kNilOptions
                     animations:^{
                         self.alpha = 1;
                     }
                     completion:NULL];
}

- (void)fadeOutWithDuration:(CGFloat)duration {
    [UIView animateWithDuration:duration
                          delay:0
                        options:kNilOptions
                     animations:^{
                         self.alpha = 0;
                     }
                     completion:NULL];
}

@end
