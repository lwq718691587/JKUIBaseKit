//
//  JKMacro_UIBase.h
//  Pods
//
//  Created by 刘伟强 on 2017/5/26.
//
//

#ifndef JKMacro_UIBase_h
#define JKMacro_UIBase_h

//获取keyWindow
#define jkKeyWindow                               [[UIApplication sharedApplication] keyWindow]

/// UI Macro
#define jkScreenWidth        ([UIScreen mainScreen].bounds).size.width

#define jkScreenHeight       ([UIScreen mainScreen].bounds).size.height

#define jkStatusBarHeight    [UIApplication sharedApplication].statusBarFrame.size.height

//颜色
#define jkHexColor(hexString)                     [UIColor colorWithHexString:hexString]

#define jkHexColorAlpha(hexString,alpha)          [UIColor colorWithHexString:hexString andAlpha:alpha]

#define jkRGBA(r,g,b,a)                           [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]
#define jkRGB(r, g, b)                            [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:1.0f]

#endif /* JKMacro_UIBase_h */
