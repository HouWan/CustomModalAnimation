//
//  ViewController.m
//  CustomModalAnimation
//
//  Created by 侯万 on 2017/3/9.
//  Copyright © 2017年 HW. All rights reserved.
//

#import "ViewController.h"

#import "BViewController.h"
#import "BCustomPresentationController.h"

#import "SecondViewController.h"
#import "SecPresentationController.h"

#import "Demo3ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *demo1Btn;
@property (weak, nonatomic) IBOutlet UIButton *demo2Btn;
@property (weak, nonatomic) IBOutlet UIButton *demo3Btn;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _demo1Btn.layer.borderColor = [UIColor redColor].CGColor;
    _demo1Btn.layer.borderWidth = 1.0 ;
    _demo2Btn.layer.borderColor = [UIColor purpleColor].CGColor;
    _demo2Btn.layer.borderWidth = 1.0 ;
    _demo3Btn.layer.borderColor = [UIColor orangeColor].CGColor;
    _demo3Btn.layer.borderWidth = 1.0 ;
}


#pragma mark - Demo1
- (IBAction)clickDemo1:(UIButton *)sender
{
    BViewController *toVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BViewController"];
    
    BCustomPresentationController *presentationC = [[BCustomPresentationController alloc] initWithPresentedViewController:toVC presentingViewController:self];
    toVC.transitioningDelegate = presentationC ;  // 指定自定义modal动画的代理
    
    [self presentViewController:toVC animated:YES completion:nil];
    
    // animated必须是YES，因为此Demo1没有自己实现动画细节协议。
}

#pragma mark - Demo2
- (IBAction)clickDemo2:(UIButton *)sender
{
    SecondViewController *toVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    
    SecPresentationController *presentationC = [[SecPresentationController alloc] initWithPresentedViewController:toVC presentingViewController:self];
    toVC.transitioningDelegate = presentationC ;  // 指定自定义modal动画的代理
    
    [self presentViewController:toVC animated:YES completion:nil];
}

#pragma mark - Demo3
- (IBAction)clickDemo3:(UIButton *)sender
{
    Demo3ViewController *vc = [[Demo3ViewController alloc] init];
    [self presentViewController:vc animated:NO completion:nil];
    
    // animated:NO 必须是no
}






@end
