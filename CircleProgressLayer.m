//
//  CircleProgressLayer.m
//  PersonalUIViewAnimation
//
//  Created by andson-zhw on 16/5/18.
//  Copyright © 2016年 andson. All rights reserved.
//

#import "CircleProgressLayer.h"
#import <UIKit/UIKit.h>

@implementation CircleProgressLayer
@dynamic progress;

- (void)drawInContext:(CGContextRef)ctx {
    //绘制进度条
    CGFloat radius = self.bounds.size.width/2;
    CGFloat lineWidth = 5.0;
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius) radius:radius - lineWidth / 2 startAngle:M_PI * 1.5 endAngle: M_PI * 1.5 + M_PI * 2 * self.progress clockwise:YES];
    //CGContextSetRGBStrokeColor(ctx, 0.5, 0.5, 0.9, 1.0);//笔颜色
    CGContextSetRGBStrokeColor(ctx, self.redValue, self.greenValue, self.blueValue, 1.0);
    CGContextSetLineWidth(ctx, lineWidth);//线条宽度
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);
}
-(void)setColorWithType:(int)type{
    if (type == 0) {
        self.redValue = 90.0/255.0;
        self.greenValue = 90.0/255.0;
        self.blueValue = 90.0/255.0;
    }else if (type == 1) {
        self.redValue = 252.0/255.0;
        self.greenValue = 184.0/255.0;
        self.blueValue = 91.0/255.0;
    }else if (type == 2){
        self.redValue = 0.0;
        self.greenValue = 107.0/255.0;
        self.blueValue = 202.0/255.0;
    }else if (type == 3){
        self.redValue = 245.0/255.0;
        self.greenValue = 83.0/255.0;
        self.blueValue = 82.0/255.0;
    }
}

//-(void)setProgress:(CGFloat)progress{
//    _progress = progress;
//    [self setNeedsDisplay];
//}
+(BOOL)needsDisplayForKey:(NSString *)key{
    if ([key isEqualToString:@"porgress"]) {
        return YES;
    }
    
    return [super needsDisplayForKey:key];
}
@end
