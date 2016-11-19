//
//  ViewController.m
//  self----转场且动画
//
//  Created by liushaohua on 16/9/4.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak)UIImageView * imgV;

@end

@implementation ViewController{

    NSInteger idx;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    idx = 1;
    [self setupUI];
}
#pragma  mark - 搭建界面
- (void)swipeAction:(UISwipeGestureRecognizer * )sender
{

    
    UIViewAnimationOptions option;
  
    NSString *   subtype;
    
    switch (sender.direction) {
        case UISwipeGestureRecognizerDirectionLeft:
           idx ++;
                if ( idx > 3) {
                    idx = 1;
                }
            option = UIViewAnimationOptionTransitionCurlUp;
            subtype = kCATransitionFromLeft;
            
            break;
        case UISwipeGestureRecognizerDirectionRight:
             idx --;
            if (idx < 1) {
                idx = 3;
            }
            option = UIViewAnimationOptionTransitionCurlDown;
            subtype = kCATransitionFromRight;  
            
        break;
     
        default:
            break;
    }
    UIImage * img = [UIImage imageNamed:[NSString stringWithFormat:@"%.2zd",idx]];
    NSLog(@"%.2zd",idx);
    
//    [UIView transitionWithView:self.view duration:0.25 options:option animations:^{
        _imgV.image = img;
//    } completion:nil];

    CATransition * transition = [CATransition animation];
//    transition.type = kCATransitionReveal;
    
    transition.type = @"oglFlip";
    
    transition.subtype = subtype;
    
    
    [_imgV.layer addAnimation:transition forKey:nil];
    
    
    
}

#pragma mark - 搭建界面
- (void)setupUI
{
    
    UIImageView * V = [[UIImageView alloc]initWithFrame:self.view.bounds];
    
    V.image = [UIImage imageNamed:@"01"];
    _imgV = V;
    
    [self.view addSubview:V];
    
    UISwipeGestureRecognizer * swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeAction:)];
    
    [self.view addGestureRecognizer:swipe];
    
    UISwipeGestureRecognizer * leftSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeAction:)];
    
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftSwipe];
    
  
}



@end
