//
//  GreenView.m
//  textDemo
//
//  Created by liushaohua on 2017/1/1.
//  Copyright © 2017年 liushaohua. All rights reserved.
//

#import "GreenView.h"



@implementation GreenView

- (void)startAnimationFrom:(CGFloat)from To:(CGFloat)to
{
    self.from = from;
    self.to = to;
    if (self.displayLink == nil) {
        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];
        [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop]
                               forMode:NSDefaultRunLoopMode];
    }
}

// 重复调用这个方法以重绘整个 View
- (void)tick:(CADisplayLink *)displayLink
{
    [self setNeedsDisplay];
}


- (void)endAnimation
{
    
    [self.displayLink invalidate];
    self.displayLink = nil;
}



- (void)drawRect:(CGRect)rect
{
    CALayer *layer = self.layer.presentationLayer;
    CGFloat progress = 1 - (layer.position.y - self.to) / (self.from - self.to);
    CGFloat height = CGRectGetHeight(rect);
    CGFloat deltaHeight = height / 2 * (0.5 - fabs(progress - 0.5));
    CGPoint topLeft = CGPointMake(0, deltaHeight);
    CGPoint topRight = CGPointMake(CGRectGetWidth(rect), deltaHeight);
    CGPoint bottomLeft = CGPointMake(0, height);
    CGPoint bottomRight = CGPointMake(CGRectGetWidth(rect), height);
    UIBezierPath* path = [UIBezierPath bezierPath];
    [[UIColor redColor] setFill];
    [path moveToPoint:topLeft];
    [path addQuadCurveToPoint:topRight controlPoint:CGPointMake(CGRectGetMidX(rect), 0)];
    [path addLineToPoint:bottomRight];
    [path addQuadCurveToPoint:bottomLeft controlPoint:CGPointMake(CGRectGetMidX(rect), height - deltaHeight)];
    [path closePath];
    [path fill];
}


@end
