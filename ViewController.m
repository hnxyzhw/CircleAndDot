//
//  ViewController.m
//  CircleAndDot
//
//  Created by andson-zhw on 16/12/20.
//  Copyright © 2016年 andson. All rights reserved.
//

#import "ViewController.h"
#import "CircleView.h"
#import "CirleDotView.h"
#import <QuartzCore/QuartzCore.h>

//判断设备是否是iphone4s
#define isIPhone4s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
//判断设备是否是iphone5
#define isIPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
@interface ViewController ()
@property(nonatomic, strong)CircleView *circleView;  //圆圈
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    CGRect frame = self.view.frame;
    //圆圈
    CGFloat margin_top;
    CGFloat cirleWidth;
    if (isIPhone4s) {
        margin_top = 25+64;
    }else{
        margin_top = 30+64;
    }
    if (isIPhone4s) {
        cirleWidth = [[NSString stringWithFormat:@"%.f",frame.size.height*0.35] floatValue];
    }else if (isIPhone5){
        cirleWidth = [[NSString stringWithFormat:@"%.f",frame.size.height*0.33] floatValue];
    }else{
        cirleWidth = [[NSString stringWithFormat:@"%.f",frame.size.height*0.38] floatValue];
    }
    CGRect cirlFrame = CGRectMake((self.view.frame.size.width - cirleWidth)/2, margin_top, cirleWidth, cirleWidth);
    _circleView = [[CircleView alloc]initWithFrame:cirlFrame];
    [self.view addSubview:_circleView];
    
    
//    UIView *tempView = [[UIView alloc]init];
//    tempView.frame = CGRectMake(self.view.frame.size.width/2-50, self.view.frame.size.height/2 - 100, 50, 50);
//    tempView.backgroundColor = [UIColor orangeColor];
//    [self.view addSubview:tempView];
//    tempView.tag = 100;
    
//    CirleDotView *circle = [[CirleDotView alloc] initWithFrame:CGRectMake(0, 120, 320, 300)];
//    [circle setCircleAnimationBackgroundColor:[UIColor orangeColor]];
//    [self.view addSubview:circle];

}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    _circleView.progress = 180.0/360.0;
    
//    UIView *tempView = [self.view viewWithTag:100];
//    float centerX = self.view.bounds.size.width/2;
//    float centerY = self.view.bounds.size.height/2;
//    float x = tempView.frame.origin.x;
//    float y = tempView.frame.origin.y;
//    [UIView animateWithDuration:2.0 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
//        //self.cirleDotView.transform = CGAffineTransformRotate(transform,M_PI_2);//_progress*2*M_PI
//        CGAffineTransform trans = [self GetCGAffineTransformRotateAroundPointWithCenterX:centerX centerY:centerY x:x y:y angle:90.0/180.0*M_PI];
//        tempView.transform = CGAffineTransformIdentity;
//        tempView.transform = trans;
//    } completion:^(BOOL finished) {
//    }];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGAffineTransform)GetCGAffineTransformRotateAroundPointWithCenterX:(CGFloat) centerX centerY:(CGFloat)centerY x:(CGFloat)x y:(CGFloat)y angle:(CGFloat)angle{
    x = x - centerX; //计算(x,y)从(0,0)为原点的坐标系变换到(CenterX ，CenterY)为原点的坐标系下的坐标
    y = y - centerY; //(0，0)坐标系的右横轴、下竖轴是正轴,(CenterX,CenterY)坐标系的正轴也一样
    
    CGAffineTransform  trans = CGAffineTransformMakeTranslation(x, y);
    trans = CGAffineTransformRotate(trans,angle);
    CGPoint endPot = [self calcCircleCoordinateWithCenter:CGPointMake(centerX, centerY) andWithAngle:angle andWithRadius:75];
    //trans = CGAffineTransformTranslate(trans,-x, -y);
    trans = CGAffineTransformTranslate(trans,endPot.x, endPot.y);
    return trans;
}

-(CGPoint) calcCircleCoordinateWithCenter:(CGPoint) center  andWithAngle : (CGFloat) angle andWithRadius: (CGFloat) radius{
    CGFloat x2 = radius*cosf(angle*M_PI/180);
    CGFloat y2 = radius*sinf(angle*M_PI/180);
    return CGPointMake(center.x+x2, center.y-y2);
}
@end
