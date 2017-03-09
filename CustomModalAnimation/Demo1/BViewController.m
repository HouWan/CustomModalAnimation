//
//  BViewController.m
//  CustomModalAnimation
//
//  Created by 侯万 on 2017/3/9.
//  Copyright © 2017年 HW. All rights reserved.
//

#import "BViewController.h"


@implementation BViewController


- (IBAction)clickCloseButton:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)dealloc
{
    NSLog(@"%@ --> dealloc",[self class]);
}


@end
