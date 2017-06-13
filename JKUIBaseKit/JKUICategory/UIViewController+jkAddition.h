//
//  UIViewController+jkAddition.h
//  Pods
//
//  Created by A on 2017/6/5.
//
//
//  UIViewController  Navigation

#import <UIKit/UIKit.h>

typedef void(^NavigationButtonEvent)(UIButton *_Nonnull);
typedef NS_ENUM(NSInteger, Navtiontype) {
    BarButton_Left = 0,
    BarButton_Right
};
@interface UIViewController(jkAddition)


/**
 用一个label 作为一个 标题
 
 @param title 标题
 @param color 颜色
 @param font 字体
 */
- (void)setNavTitle:(NSString * _Nonnull)title
              color:(UIColor *_Nonnull)color
               font:(UIFont *_Nonnull)font;

/**
 创建导航栏左右btn
 
 @param title 标题
 @param imageName 图片名字
 @param color 字体颜色
 @param font 字体
 @param action 相应事件
 @param type 左 或 右
 */
- (void)creatNavigationBarButton:(NSString *_Nonnull)title
             backgroundImageName:(NSString *_Nonnull)imageName
                      titleColor:(UIColor *_Nonnull)color
                       titleFont:(UIFont *_Nonnull)font
                          action:(SEL _Nonnull)action
                            type:(Navtiontype)type;

/**
 *  返回按钮
 *
 *  @param content 返回按钮的样式， 可以传入 UIImage, NSString, NSAttributedString, UIButton，UIBarButtonItem
 *
 */
- (void) navigationGoBackButton:(id _Nonnull) content;

/**
 *  左边按钮
 *
 *  @param content 返回按钮的样式， 可以传入 UIImage, NSString, NSAttributedString, UIButton，UIBarButtonItem
 *  @param buttonEventBlcok   事件回调的Block
 *
 */
- (void) navigationLeftButton: (id _Nonnull) content
                        event:(NavigationButtonEvent _Nullable) buttonEventBlcok;

- (void) navigationRightButton:(id _Nonnull) content
                         event:(NavigationButtonEvent _Nullable) buttonEventBlcok;


/**
 *  左边按钮
 *
 *  @param contentArray 返回按钮的样式， 可以传入 UIImage, NSString, NSAttributedString, UIButton，UIBarButtonItem   数组
 *  @param SELStringArray 事件方法的数组  SEL 名字 @selector(SELString)
 *
 */
- (void) navigationLeftButtons:(NSArray<id> * _Nonnull) contentArray
                        events:(NSArray<NSString *> * _Nullable) SELStringArray;

- (void) navigationRightButtons:(NSArray<id> * _Nonnull) contentArray
                         events:(NSArray<NSString *> * _Nullable) SELStringArray;


@end
