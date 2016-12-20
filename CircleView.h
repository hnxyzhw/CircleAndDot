//
//  CircleView.h
//  PersonalUIViewAnimation
//
//  Created by andson-zhw on 16/5/18.
//  Copyright © 2016年 andson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleProgressLayer.h"

@interface CircleView : UIView
@property(nonatomic,assign) CGFloat progress;
//-(void)setColorWithType:(int)circleType;
-(void)cleanProgressLayer;
-(void)rotateDotView;
@end
