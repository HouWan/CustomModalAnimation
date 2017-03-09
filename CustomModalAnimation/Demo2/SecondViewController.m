//
//  SecondViewController.m
//  CustomModalAnimation
//
//  Created by 侯万 on 2017/3/9.
//  Copyright © 2017年 HW. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self updatePreferredContentSizeWithTraitCollection:self.traitCollection];
}



//| ----------------------------------------------------------------------------
- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
    
    // When the current trait collection changes (e.g. the device rotates),
    // update the preferredContentSize.
    [self updatePreferredContentSizeWithTraitCollection:newCollection];
}


//| ----------------------------------------------------------------------------
//! Updates the receiver's preferredContentSize based on the verticalSizeClass
//! of the provided \a traitCollection.
//
- (void)updatePreferredContentSizeWithTraitCollection:(UITraitCollection *)traitCollection
{
    // 左右留35
    // 上下留80
    
    CGFloat w = self.view.bounds.size.width - 35.f * 2;
    CGFloat h = self.view.bounds.size.height - 80.f * 2;
    
    self.preferredContentSize = CGSizeMake(w,h);
}




- (void)dealloc
{
    NSLog(@"%@ --> dealloc",[self class]);
}


@end
