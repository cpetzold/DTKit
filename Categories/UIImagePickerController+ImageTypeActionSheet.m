//
//  UIImagePickerController+ImageTypeActionSheet.m
//  NJASAP
//
//  Created by Ryan Nystrom on 1/23/13.
//  Copyright (c) 2013 Ryan Nystrom. All rights reserved.
//

#import "UIImagePickerController+ImageTypeActionSheet.h"
#import <objc/runtime.h>

@interface ImageTypeActionSheetDelegate : NSObject
<UIActionSheetDelegate>
@property (strong, nonatomic) NSArray *titles;
@property (weak, nonatomic) id <UIImagePickerControllerDelegate,UINavigationControllerDelegate> imagePickerDelegate;
@end

@implementation ImageTypeActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 2) {
        return;
    }
    
    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
    controller.delegate = self.imagePickerDelegate;
    if (buttonIndex == 0) {
        controller.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    if ([[UIApplication sharedApplication].keyWindow.rootViewController presentedViewController]) {
        [[[UIApplication sharedApplication].keyWindow.rootViewController presentedViewController] presentViewController:controller animated:YES completion:NULL];
    }
    else {
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:controller animated:YES completion:NULL];
    }
}
@end

static const void *ImageTypeActionSheetDelegateKey = &ImageTypeActionSheetDelegateKey;

@interface UIImagePickerController ()

@property (strong, nonatomic) ImageTypeActionSheetDelegate *actionSheetDelegate;

@end

@implementation UIImagePickerController (ImageTypeActionSheet)

- (void)promptImagePickerTypeWithText:(NSString*)text titles:(NSArray*)titles delegate:(id <UIImagePickerControllerDelegate,UINavigationControllerDelegate>)delegate {
    if ([titles count] < 2) {
        titles = @[@"Take a Photo", @"Choose from Library"];
    }
    ImageTypeActionSheetDelegate *actionSheetDelegate = [[ImageTypeActionSheetDelegate alloc] init];
    actionSheetDelegate.titles = titles;
    actionSheetDelegate.imagePickerDelegate = delegate;
    self.actionSheetDelegate = actionSheetDelegate;
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:text delegate:actionSheetDelegate cancelButtonTitle:@"Cancel" destructiveButtonTitle:titles[0] otherButtonTitles:titles[1], nil];
    if ([UIApplication sharedApplication].keyWindow.rootViewController.presentedViewController) {
        [actionSheet showInView:[UIApplication sharedApplication].keyWindow.rootViewController.presentedViewController.view];
    }
    else {
        [actionSheet showInView:[UIApplication sharedApplication].keyWindow.rootViewController.view];
    }
}

- (void)setActionSheetDelegate:(ImageTypeActionSheetDelegate *)actionSheetDelegate {
    objc_setAssociatedObject(self, ImageTypeActionSheetDelegateKey, actionSheetDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ImageTypeActionSheetDelegate*)actionSheetDelegate {
    return objc_getAssociatedObject(self, ImageTypeActionSheetDelegateKey);
}

@end
