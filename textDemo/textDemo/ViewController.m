//
//  ViewController.m
//  textDemo
//
//  Created by liushaohua on 2017/1/1.
//  Copyright © 2017年 liushaohua. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "GreenView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet GreenView *redView;


@property(nonatomic,strong)UIDynamicAnimator *animator;

@end

@implementation ViewController


-(UIDynamicAnimator *)animator
{
    if (!_animator) {
        //创建物理仿真器（referecnce 物理仿真范围）
        self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
        
    }
    return _animator;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.redView setHidden:YES];
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{


//    [UIView animateKeyframesWithDuration:2.0 delay:0.0 options:UIViewKeyframeAnimationOptionRepeat | UIViewKeyframeAnimationOptionAutoreverse animations:^{
//        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.5 animations:^{
//            self.redView.frame = CGRectMake(10, 50, 100, 100);
//        }];
//        [UIView addKeyframeWithRelativeStartTime: 0.5 relativeDuration:0.3 animations:^{
//            self.redView.frame = CGRectMake(20, 100, 100, 100);
//        }];
//        [UIView addKeyframeWithRelativeStartTime:0.8 relativeDuration:0.2 animations:^{
//            self.redView.transform = CGAffineTransformMakeScale(0.5, 0.5);
//        }];
//    } completion:nil];
    
    
    
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
//    animation.toValue = @200;
//    animation.duration = 0.8;
//    animation.repeatCount = 5;
//    animation.beginTime = CACurrentMediaTime() + 0.5;
//    animation.fillMode = kCAFillModeRemoved;
//    [self.redView.layer addAnimation:animation forKey:nil];
    
    
//    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];//在这里@"transform.rotation"==@"transform.rotation.z"
//    NSValue *value1 = [NSNumber numberWithFloat:-M_PI/180*4];
//    NSValue *value2 = [NSNumber numberWithFloat:M_PI/180*4];
//    NSValue *value3 = [NSNumber numberWithFloat:-M_PI/180*4];
//    anima.values = @[value1,value2,value3];
//    // anima.keyTimes = @[@0.0, @0.5, @1.0];
//    anima.repeatCount = MAXFLOAT;
//    
//    [_redView.layer addAnimation:anima forKey:@"shakeAnimation"];

    
//    
//    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake([UIScreen mainScreen].bounds.size.width/2-100, [UIScreen mainScreen].bounds.size.height/2-100, 200, 200)];
//    anima.path = path.CGPath;
//    anima.duration = 2.0f;
//    [_redView.layer addAnimation:anima forKey:@"pathAnimation"];
    
    
    
//    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
//    CABasicAnimation *animationOne = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    
//    animationOne.toValue = @2.0;
//    animationOne.duration = 1.0;
//    
//    CABasicAnimation *animationTwo = [CABasicAnimation animationWithKeyPath:@"position.x"];
//    animationTwo.toValue = @400;
//    animationTwo.duration = 1.0;
//    
//    
//    [group setAnimations:@[animationOne, animationTwo]];
//    [self.redView.layer addAnimation:group forKey:nil];
    
    
    
//    self.redView.backgroundColor = [UIColor redColor];
//    CATransition *trans = [CATransition animation];
//    trans.duration = 1.0;
//    trans.type = @"push";
//    [self.redView.layer addAnimation:trans forKey:nil];
//
    
    
    
    
    
//    CGFloat from = CGRectGetHeight(self.view.bounds) - CGRectGetHeight(self.redView.bounds) / 2;
//    CGFloat to = 100;
//    
//    self.redView.center = CGPointMake(self.redView.center.x, from);
//    
//    [self.redView startAnimationFrom:from To:to];
//    
//    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.85 initialSpringVelocity:0 options:0 animations:^{
//        
//        self.redView.center = CGPointMake(self.redView.center.x, to);
//        
//    } completion:^(BOOL finished) {
//        
//        [self.redView endAnimation];
//        
//    }];
    
    
    
    //  物理仿真
    
    
//    UITouch *touch = [touches anyObject];
//    CGPoint point = [touch locationInView:touch.view];
//    
//    UISnapBehavior *snap = [[UISnapBehavior alloc]initWithItem:self.redView snapToPoint:point];
//    
//    //减震
//    snap.damping = 0.5;
//    [self.animator removeAllBehaviors];//移除之前所有行为
//    [self.animator addBehavior:snap];//添加新的行为
    

    [self CAEmitterLayerDemo];
    
}




// 粒子效果
- (void)CAEmitterLayerDemo{
    
    
    // 粒子效果
    
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer]; // 1
    emitterLayer.emitterPosition = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.origin.y); // 2
    emitterLayer.emitterZPosition = 10; // 3
    emitterLayer.emitterSize = CGSizeMake(self.view.bounds.size.width, 0); // 4
    emitterLayer.emitterShape = kCAEmitterLayerSphere; // 5
    
    CAEmitterCell *emitterCell = [CAEmitterCell emitterCell]; // 6
    emitterCell.scale = 0.1; // 7
    emitterCell.scaleRange = 0.2; // 8
    emitterCell.emissionRange = (CGFloat)M_PI_2; // 9
    emitterCell.lifetime = 5.0; // 10
    emitterCell.birthRate = 10; // 11
    emitterCell.velocity = 200; // 12
    emitterCell.velocityRange = 50; // 13
    emitterCell.yAcceleration = 250; // 14
    
    emitterCell.contents = (id)[[UIImage imageNamed:@"Ball_blue"] CGImage]; // 15
    
    
    
    CAEmitterCell *emitterCell2 = [CAEmitterCell emitterCell];
    emitterCell2.scale = 0.1;
    emitterCell2.scaleRange = 0.3;
    emitterCell2.emissionRange = (CGFloat)M_PI;
    emitterCell2.lifetime = 10.0;
    emitterCell2.birthRate = 10.0;
    emitterCell2.velocity = 100.0;
    emitterCell2.velocityRange = 100.0;
    emitterCell2.yAcceleration = 300.0;
    emitterCell2.contents = (id)[[UIImage imageNamed:@"Ball_red"] CGImage];
    
    
    emitterLayer.emitterCells = @[emitterCell, emitterCell2]; // 16
    
    [self.view.layer addSublayer:emitterLayer];


}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
