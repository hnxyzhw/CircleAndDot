//
//  CirleDotView.m
//  CircleAndDot
//
//  Created by andson-zhw on 16/12/20.
//  Copyright © 2016年 andson. All rights reserved.
//

#import "CirleDotView.h"

@interface CirleDotView ()
{
    UIView * dotView;
}
@end

@implementation CirleDotView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        float dotView_w = 10;
        CGFloat dotViewOrigin_x = frame.size.width/2;
        CGFloat dotViewOrigin_y = frame.size.height/2;
        //CGFloat radiusX = self.frame.size.height/2;
        dotView = [[UIImageView alloc] init];
        [self addSubview:dotView];
        dotView.frame = CGRectMake(dotViewOrigin_x*2 - dotView_w/2,dotViewOrigin_y-dotView_w/2, dotView_w, dotView_w);
        [dotView.layer setCornerRadius:dotView_w/2];
        dotView.layer.shadowColor = [UIColor whiteColor].CGColor;
        dotView.layer.shadowOffset = CGSizeMake(1, 0);
        dotView.layer.shadowOpacity = 0.80;
        dotView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)createCircle:(float)startAngle andEndAngle:(float)endAngle
{
    //        //设置运转动画的路径
    //        CGMutablePathRef curvedPath = CGPathCreateMutable();
    //        //    //160,240为圆心,100为半径 （0，2*M_PI）为起始角度和结束角度，1为顺时针，0 为逆时针
    //        CGPathAddArc(curvedPath, NULL, self.frame.size.width/2, self.frame.size.height/2, radiusLength+x*2, startAngle, endAngle, 0);
    //        pathAnimation.path = curvedPath;
    //        CGPathRelease(curvedPath);
    
    //创建运动的轨迹动画
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.duration = 2.5 * (endAngle/(2*M_PI));
    pathAnimation.repeatCount = 0;
    
    float radiuscale = 1;
    
    CGFloat origin_x = self.frame.size.width/2;
    CGFloat origin_y = self.frame.size.height/2;
    CGFloat radiusX = self.frame.size.height/2;
    
    CGMutablePathRef ovalfromarc = CGPathCreateMutable();
    CGAffineTransform t2 = CGAffineTransformConcat(CGAffineTransformConcat(
                                                                           CGAffineTransformMakeTranslation(-origin_x, -origin_y),
                                                                           CGAffineTransformMakeScale(1, radiuscale)),
                                                   CGAffineTransformMakeTranslation(origin_x, origin_y));
    CGPathAddArc(ovalfromarc, &t2, origin_x, origin_y, radiusX,startAngle,endAngle, NO);//最后一个参数是设置顺时针,跟逆时针的方向
    pathAnimation.path = ovalfromarc;
    CGPathRelease(ovalfromarc);
    
    //设置运转的动画
    [dotView.layer addAnimation:pathAnimation forKey:@"moveTheCircleOne"];
    
    //画标准圆
    //    UIGraphicsBeginImageContext(CGSizeMake(320,origin_x*2));
    //    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    //    CGContextAddArc(ctx, origin_x, origin_y, 100,startAngle,endAngle, 1);
    //    CGContextDrawPath(ctx, kCGPathStroke);
    //    UIImage *curve = UIGraphicsGetImageFromCurrentImageContext();
    //    UIGraphicsEndImageContext();
    //
    //    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    //    imageView.image = curve;
    //    [self addSubview:imageView];
}
////贝塞尔
//- (void)drawRect:(CGRect)rect {
//    CGFloat origin_x = self.frame.size.width/2;
//    CGFloat origin_y = self.frame.size.height/2;
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSaveGState(context);
//    
//    //    一段圆弧
//    //    CGFloat startAngle = 0, endAngle = M_PI*2 ;
//    //
//    //    CGPoint center = CGPointMake(origin_x, origin_y);
//    //    UIBezierPath* clip = [UIBezierPath bezierPathWithArcCenter:center
//    //                                                        radius:MAX(200, 200)
//    //                                                    startAngle:startAngle
//    //                                                      endAngle:endAngle
//    //                                                     clockwise:YES];
//    //    [clip addLineToPoint:center];
//    //    [clip closePath];
//    //    [clip addClip];
//    //整个椭圆
//    UIBezierPath *arc = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(origin_x-100, origin_y-100, 200, 200)];
//    [[UIColor whiteColor] setStroke];
//    [arc stroke];
//    CGContextRestoreGState(context);
//}

-(void)setCircleAnimationBackgroundColor:(UIColor *)aColor startAngle:(float)startAngle andEndAngle:(float)endAngle
{
    self.backgroundColor = aColor;
    //[self createCircle: M_PI / 6 andEndAngle:M_PI / 6 + 2 * M_PI];
    [self createCircle: startAngle andEndAngle:endAngle];
    
}
@end
