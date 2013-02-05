//
//  UIView+Wiggle.m
//  NJASAP
//
//  Created by Ryan Nystrom on 1/7/13.
//  Copyright (c) 2013 Ryan Nystrom. All rights reserved.
//

#import "UIView+Wiggle.h"
#import "UIView+Sizes.h"

@implementation UIView (Wiggle)

- (void)wiggle {
    [UIView animateWithDuration:0.07f animations:^{
        self.left -= 10.f;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.06f animations:^{
            self.left += 18.f;
        } completion:^(BOOL finished1) {
            [UIView animateWithDuration:0.05f animations:^{
                self.left -= 14.f;
            } completion:^(BOOL finished2) {
                [UIView animateWithDuration:0.05f animations:^{
                    self.left += 6.f;
                }];
            }];
        }];
    }];
}

@end
