//
//  UIViewController+jkAddition.h
//  Pods
//
//  Created by A on 2017/6/5.
//
//
//  UIViewController  Navigation

#import <UIKit/UIKit.h>

typedef void(^NavigationButtonEvent)(void);

@interface UIViewController(jkAddition)

/**
 *  返回按钮
 *
 *  @param content: 返回按钮的样式， 可以传入 UIImage, NSString, NSAttributedString, UIButton，UIBarButtonItem
 *
 *  @return label的rect
 */
- (void) navigationGoBackButton:(id _Nonnull) content;

/**
 *  左边按钮
 *
 *  @param content: 返回按钮的样式， 可以传入 UIImage, NSString, NSAttributedString, UIButton，UIBarButtonItem
 *  @param event:   事件回调的Block
 *
 *  @return label的rect
 */
- (void) navigationLeftButton: (id _Nonnull) content
                        event:(NavigationButtonEvent _Nullable) buttonEventBlcok;

- (void) navigationRightButton:(id _Nonnull) content
                         event:(NavigationButtonEvent _Nullable) buttonEventBlcok;


/**
 *  左边按钮
 *
 *  @param contentArray: 返回按钮的样式， 可以传入 UIImage, NSString, NSAttributedString, UIButton，UIBarButtonItem   数组
 *  @param SELStringArray: 事件方法的数组  SEL 名字 @selector(SELString)
 *
 *  @return label的rect
 */
- (void) navigationLeftButtons:(NSArray<id> * _Nonnull) contentArray
                        events:(NSArray<NSString *> * _Nullable) SELStringArray;

- (void) navigationRightButtons:(NSArray<id> * _Nonnull) contentArray
                         events:(NSArray<NSString *> * _Nullable) SELStringArray;


@end
