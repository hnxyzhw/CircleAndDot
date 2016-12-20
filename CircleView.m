//
//  CircleView.m
//  PersonalUIViewAnimation
//
//  Created by andson-zhw on 16/5/18.
//  Copyright © 2016年 andson. All rights reserved.
//

#import "CircleView.h"
#import "CirleDotView.h"

@interface CircleView ()
@property(nonatomic,strong) CircleProgressLayer *circleProgressLayer;
@property(nonatomic,strong)CirleDotView *cirleDotView;
@property(nonatomic,strong) UILabel *progressLabel;
@property(nonatomic,strong)CAShapeLayer *progressLayer;
@end

@implementation CircleView


-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
//        self.circleProgressLayer = [CircleProgressLayer layer];
//        self.circleProgressLayer.frame = self.bounds;
//        self.circleProgressLayer.contentsScale = [UIScreen mainScreen].scale;
//        [self.layer addSublayer:self.circleProgressLayer];
        
        self.transform = CGAffineTransformMakeRotation(-M_PI_2);
        CGFloat kLineWidth = 4;
        CGRect rect = CGRectMake(kLineWidth/2, kLineWidth/2, frame.size.width - kLineWidth, frame.size.height - kLineWidth);
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
        self.progressLayer = [CAShapeLayer layer];
        self.progressLayer.fillColor = [UIColor clearColor].CGColor;
        self.progressLayer.strokeColor = [UIColor clearColor].CGColor;
        self.progressLayer.lineWidth = kLineWidth;
        self.progressLayer.lineCap = kCALineCapRound;
        self.progressLayer.path = path.CGPath;
        self.progressLayer.strokeEnd =  0;
        [self.layer addSublayer:self.progressLayer];
        
        self.cirleDotView = [[CirleDotView alloc]initWithFrame:rect];
        [self addSubview:self.cirleDotView];
    }
    
    return self;
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //绘制外围的灰色圆形框
    CGFloat radius = self.bounds.size.width/2;
    CGFloat lineWidth = 2.5;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius) radius:radius-lineWidth startAngle:0.f endAngle:M_PI *2  clockwise:YES];
//    [[UIColor colorWithRed:0.5 green:0.5 blue:0.9 alpha:1.0] setStroke];
//    [[UIColor lightGrayColor] setStroke];
    [[UIColor colorWithRed:255./255. green:251./255. blue:240./255. alpha:0.3] setStroke];
    [path setLineWidth:lineWidth];
    [path stroke];
}


-(void)setProgress:(CGFloat)progress{
    _progress = progress;
    [self cleanProgressLayer];
    __block typeof(self) weakSelf = self;
//    ///*延迟执行时间*/
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        [weakSelf updateProgressLayer];
    });
    
//    [self.circleProgressLayer removeFromSuperlayer];
//    
//    self.circleProgressLayer = [CircleProgressLayer layer];
//    self.circleProgressLayer.bounds = self.bounds;
//    self.circleProgressLayer.contentsScale = [UIScreen mainScreen].scale;
//    [self.layer addSublayer:self.circleProgressLayer];
//    
//    self.circleProgressLayer.progress = progress;
//    //根据进度值来判断需要显示何种类型的颜色
//    int cirleValue = (int)(progress * 100);
//    if (cirleValue > 0 && cirleValue <= 10) {
//        [self setColorWithType:0];
//    }else if (cirleValue > 10 && cirleValue <= 30) {
//        [self setColorWithType:1];
//    }else if (cirleValue > 30 && cirleValue <= 60){
//        [self setColorWithType:2];
//    }else if (cirleValue > 60 && cirleValue <= 80){
//        [self setColorWithType:3];
//    }
//
//    //添加一个过度动画
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"progress"];
//    animation.duration = 1.0;//1.0 *fabs(progress - _progress);//1.5 * progress;//
//    animation.fromValue = @0.0;
//    animation.toValue = @1.0;
//    //animation.removedOnCompletion = YES;
//    //animation.autoreverses = YES;
//    //animation.fillMode = kCAFillModeBoth;
//    //animation.delegate = self;
//    [self.circleProgressLayer addAnimation:animation forKey:nil];

    

}

-(void)cleanProgressLayer{
    self.progressLayer.fillColor = [UIColor clearColor].CGColor;
    self.progressLayer.strokeColor = [UIColor clearColor].CGColor;
    self.progressLayer.strokeStart = 0;
    self.progressLayer.strokeEnd =  0;
}
-(void)updateProgressLayer{
    
//    int cirleValue = (int)(_progress * 100);
    self.progressLayer.strokeColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0].CGColor;
    [CATransaction begin];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [CATransaction setAnimationDuration:2.5 * _progress];
//    //根据进度值来判断需要显示何种类型的颜色
//    CGFloat f1 = 30.0/360.0;
//    CGFloat f2 = 50.0/360.0;
//    CGFloat f3 = 90.0/360.0;
//    CGFloat f4 = 120.0/360.0;
//    CGFloat f5 = 150.0/360.0;
//    CGFloat f6 = 210.0/360.0;
//    CGFloat f7 = 250.0/360.0;
//    CGFloat f8 = 300.0/360.0;
//    CGFloat f9 = 330.0/360.0;
//
//    if (_progress >= 0 && _progress <= f1) {
//        self.progressLayer.strokeColor = RGBA(90.0, 90.0, 90.0, 1.0).CGColor;
//    }else if (_progress > f1 && _progress <= f2) {
//        self.progressLayer.strokeColor = RGBA(252.0, 184.0, 91.0, 1.0).CGColor;
//    }else if (_progress > f2 && _progress <= f3){
//        self.progressLayer.strokeColor = RGBA(252.0, 184.0, 91.0, 1.0).CGColor;
//    }else if (_progress > f3 && _progress <= f4){
//        self.progressLayer.strokeColor = RGBA(252.0, 184.0, 91.0, 1.0).CGColor;
//    }else if (_progress > f4 && _progress <= f5){
//        self.progressLayer.strokeColor = RGBA(0.0, 107.0, 202.0, 1.0).CGColor;
//    }else if (_progress > f5 && _progress <= f6){
//        self.progressLayer.strokeColor = RGBA(0.0, 107.0, 202.0, 1.0).CGColor;
//    }else if (_progress > f6 && _progress <= f7){
//        self.progressLayer.strokeColor = RGBA(245.0, 83.0, 82.0, 1.0).CGColor;
//    }else if (_progress > f7 && _progress <= f8){
//        self.progressLayer.strokeColor = RGBA(245.0, 83.0, 82.0, 1.0).CGColor;
//    }else if (_progress > f8 && _progress <= f9){
//        self.progressLayer.strokeColor = RGBA(245.0, 83.0, 82.0, 1.0).CGColor;
//    }
    

    self.progressLayer.strokeStart = 0;
    self.progressLayer.strokeEnd =  _progress;
    [self.cirleDotView setCircleAnimationBackgroundColor:[UIColor clearColor] startAngle:0 andEndAngle:_progress *2*M_PI];
    [CATransaction commit];
    
    
   
}

//-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
//    self.circleProgressLayer.progress = self.progress;
//}
//
//-(void)setColorWithType:(int)circleType{
//    [self.circleProgressLayer setColorWithType:circleType];
//}

-(void)rotateDotView{
    //CGAffineTransform transform = self.cirleDotView.transform;
    
    float centerX = self.bounds.size.width/2;
    float centerY = self.bounds.size.height/2;
    float x = self.cirleDotView.center.x;
    float y = self.cirleDotView.center.y;
    [UIView animateWithDuration:2.0 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        //self.cirleDotView.transform = CGAffineTransformRotate(transform,M_PI_2);//_progress*2*M_PI
        CGAffineTransform trans = [self GetCGAffineTransformRotateAroundPointWithCenterX:centerX centerY:centerY x:x y:y angle:45.0/180.0*M_PI];
        self.cirleDotView.transform = CGAffineTransformIdentity;
        self.cirleDotView.transform = trans;
//        CGAffineTransform transform= CGAffineTransformMakeRotation(M_PI*0.38);
//        self.cirleDotView.transform = transform;
    } completion:^(BOOL finished) {
    }];
    
    
    
    
}

-(CGAffineTransform)GetCGAffineTransformRotateAroundPointWithCenterX:(CGFloat) centerX centerY:(CGFloat)centerY x:(CGFloat)x y:(CGFloat)y angle:(CGFloat)angle{
    x = x - centerX; //计算(x,y)从(0,0)为原点的坐标系变换到(CenterX ，CenterY)为原点的坐标系下的坐标
    y = y - centerY; //(0，0)坐标系的右横轴、下竖轴是正轴,(CenterX,CenterY)坐标系的正轴也一样
    
    CGAffineTransform  trans = CGAffineTransformMakeTranslation(x, y);
    trans = CGAffineTransformRotate(trans,angle);
    trans = CGAffineTransformTranslate(trans,-x, -y);
    return trans;
}
@end
