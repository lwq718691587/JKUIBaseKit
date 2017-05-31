//
//  UINavigationController+jkAddition.h
//  Pods
//
//  Created by A on 2017/5/26.
//
//

#import <UIKit/UIKit.h>

typedef void(^NavigationButtonEvent)(void);

@interface UINavigationController(jkAddition)

/// Content:  UIImage, NSString, NSAttributedString, UIButton，UIBarButtonItem
- (void) navigationGoBackButton:(UIViewController *_Nonnull) viewController
                        content:(id _Nonnull) content;

- (void) navigationLeftButton:(UIViewController *_Nonnull) viewController
                      content: (id _Nonnull) content
                        event:(NavigationButtonEvent _Nullable) buttonEventBlcok;

- (void) navigationRightButton:(UIViewController *_Nonnull) viewController
                       content:(id _Nonnull) content
                         event:(NavigationButtonEvent _Nullable) buttonEventBlcok;


/// SEL 名字 @selector(SELString)
- (void) navigationLeftButtons:(UIViewController *_Nonnull) viewController
                      contents:(NSArray<id> * _Nonnull) contentArray
                        events:(NSArray<NSString *> * _Nullable) SELStringArray;

- (void) navigationRightButtons:(UIViewController *_Nonnull) viewController
                       contents:(NSArray<id> * _Nonnull) contentArray
                         events:(NSArray<NSString *> * _Nullable) SELStringArray;


@end
