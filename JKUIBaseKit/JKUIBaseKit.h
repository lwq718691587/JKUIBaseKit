//
//  JKUIBaseKit.h
//  test
//
//  Created by 刘伟强 on 2017/5/25.
//  Copyright © 2017年 刘伟强. All rights reserved.
//

#ifndef JKUIBaseKit_h
#define JKUIBaseKit_h

#import "SVProgressHUD+Additonal.h"
#import "UIColor+HEX.h"
#import "UIImage+Addition.h"
#import "UIView+Additional.h"

//获取keyWindow
#define KeyWindow                               [[UIApplication sharedApplication] keyWindow]

//屏幕宽
#define kMainScreenWidth                        ([UIScreen mainScreen].bounds).size.width
//屏幕高
#define kMainScreenHeight                       ([UIScreen mainScreen].bounds).size.height
#define kTabBarHeight                           49.0f
#define kNaviBarHeight                          44.0f
#define kHeightFor4InchScreen                   568.0f
#define kHeightFor3p5InchScreen                 480.0f

#define kStatusBarHeight                        [UIApplication sharedApplication].statusBarFrame.size.height
//颜色
#define HexColor(hexString)                     [UIColor colorWithHexString:hexString]

#define HexColorAlpha(hexString,alpha)          [UIColor colorWithHexString:hexString andAlpha:alpha]

#define RGBA(r,g,b,a)                           [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]
#define RGB(r, g, b)                            [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:1.0f]




#endif /* JKUIBaseKit_h */
