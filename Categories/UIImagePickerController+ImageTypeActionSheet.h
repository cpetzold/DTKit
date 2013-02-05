//
//  UIImagePickerController+ImageTypeActionSheet.h
//  NJASAP
//
//  Created by Ryan Nystrom on 1/23/13.
//  Copyright (c) 2013 Ryan Nystrom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImagePickerController (ImageTypeActionSheet)

- (void)promptImagePickerTypeWithText:(NSString*)text titles:(NSArray*)titles delegate:(id <UIImagePickerControllerDelegate,UINavigationControllerDelegate>)delegate;

@end
