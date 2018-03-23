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
#define jkScreenWidth                             ([UIScreen mainScreen].bounds).size.width

#define jkScreenHeight                            ([UIScreen mainScreen].bounds).size.height

#define jkStatusBarHeight                         [UIApplication sharedApplication].statusBarFrame.size.height

//颜色
#define jkHexColor(hexString)                     [UIColor colorWithHexString:hexString]

#define jkHexColorAlpha(hexString,alpha)          [UIColor colorWithHexString:hexString andAlpha:alpha]

#define jkRGBA(r,g,b,a)                           [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]
#define jkRGB(r, g, b)                            [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:1.0f]

//错误提示
#define AlertError(msg)                         [SVProgressHUD jk_showErrorWithStatus:msg]
//成功提示
#define AlertSuccess(msg)                       [SVProgressHUD jk_showSuccessWithStatus:msg]

//iPhone X
#define IS_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
//状态栏高度
#define jkStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height
//安全区距离底部距离
#define jkTabbarSafeBottomMargin    (IS_iPhoneX ? 34 :0)
//底部按钮边距
#define jkBottomBtnTopMargin        15
#define jkBottomBtnLeftMargin       15
#define jkBottomBtnBottomMargin     15
#define jkBottomBtnRightMargin      15
//底部按钮高度
#define jkBottomBtnHeight           44

#endif /* JKMacro_UIBase_h */
