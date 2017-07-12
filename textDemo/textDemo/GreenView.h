//
//  GreenView.h
//  textDemo
//
//  Created by liushaohua on 2017/1/1.
//  Copyright © 2017年 liushaohua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GreenView : UIView

@property (nonatomic,assign) float from;


@property (nonatomic,assign) float to;


@property (nonatomic,strong) CADisplayLink *displayLink;


- (void)startAnimationFrom:(CGFloat)from To:(CGFloat)to;

- (void)endAnimation;

@end
