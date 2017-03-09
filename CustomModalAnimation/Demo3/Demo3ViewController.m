//
//  Demo3ViewController.m
//  CustomModalAnimation
//
//  Created by 侯万 on 2017/3/9.
//  Copyright © 2017年 HW. All rights reserved.
//

#import "Demo3ViewController.h"

@interface Demo3ViewController ()

/** 暗色背景 */
@property (nonatomic, weak) UIView *bgView;
/** 控件View */
@property (nonatomic, weak) UIView *contentView;
/** 控件View */
@property (nonatomic, weak) UILabel *showLab;
@end

@implementation Demo3ViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // 必须写这句话，不然看不到上一个控制器的View
        self.modalPresentationStyle = UIModalPresentationCustom ;
        [self setupUI];
    }
    return self;
}

#pragma mark - 布局UI
/** 布局UI */
- (void)setupUI
{
    self.view.backgroundColor = [UIColor clearColor];
    
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:0.5f];
    [self.view addSubview:bgView];
    self.bgView = bgView;
    self.bgView.alpha = 0.0f;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickBgView)];
    [bgView addGestureRecognizer:tap];
    
    
    UIView *cView = [[UIView alloc] init];
    cView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:cView];
    self.contentView = cView;
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectZero];
    lab.frame = CGRectMake(10.f, 0, CGRectGetWidth([UIScreen mainScreen].bounds) - 20.f, 300.f);
    lab.text = @"在此View上添加自己的具体实现，通过viewWillAppear和clickBgVie，可以自定义出很绚的动画效果，这种动画方式只是给大家提供一种思路，实现问题的方法有很多，有时候很多效果感觉很难实现，也许它用了一些障眼法之类的。我比较喜欢投机取巧的方式实现一些效果的，不过对于新技术，还是要积极去学习的，本Demo没有使用Swift，但是代码注释很详细，Swift对应方法和步骤敲出来即可！欢迎点赞。";
    lab.numberOfLines = 0 ;
    lab.font = [UIFont systemFontOfSize:16.f];
    [cView addSubview:lab];
    self.showLab = lab;
    
    cView.layer.borderColor = [UIColor redColor].CGColor;
    cView.layer.borderWidth = 1.0 ;
}


#pragma mark - 在此方法做动画呈现
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.bgView.frame = [UIScreen mainScreen].bounds;
    self.contentView.frame = CGRectMake(0,[UIScreen mainScreen].bounds.size.height, CGRectGetWidth([UIScreen mainScreen].bounds), 300.0);
    
    
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.95 initialSpringVelocity:0.05 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.bgView.alpha = 1.0f ;
        
        self.contentView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 300.f, CGRectGetWidth([UIScreen mainScreen].bounds), 300.0f);
        
    } completion:^(BOOL finished) {
    }];
}


#pragma mark - 消失
- (void)clickBgView
{
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.95 initialSpringVelocity:0.05 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.bgView.alpha = 0.0f ;
        self.contentView.frame = CGRectMake(0,[UIScreen mainScreen].bounds.size.height, CGRectGetWidth([UIScreen mainScreen].bounds), 300.0);
        
    } completion:^(BOOL finished) {
        // 动画Animated必须是NO，不然消失之后，会有0.35s时间，再点击无效
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
}



// 这里主动释放一些空间，加速内存的释放，防止有时候消失之后，再点不出来。
- (void)dealloc
{
    NSLog(@"%@ --> dealloc",[self class]);
    [self.bgView removeFromSuperview];
    self.bgView = nil;
    [self.contentView removeFromSuperview];
    self.contentView = nil;
}


@end
