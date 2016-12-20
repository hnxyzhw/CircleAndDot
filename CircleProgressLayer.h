//
//  CircleProgressLayer.h
//  PersonalUIViewAnimation
//
//  Created by andson-zhw on 16/5/18.
//  Copyright © 2016年 andson. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CircleProgressLayer : CALayer
@property(nonatomic,assign) CGFloat progress;
-(void)setColorWithType:(int)type;
@property(nonatomic,assign)CGFloat redValue;
@property(nonatomic,assign)CGFloat greenValue;
@property(nonatomic,assign)CGFloat blueValue;
@end
