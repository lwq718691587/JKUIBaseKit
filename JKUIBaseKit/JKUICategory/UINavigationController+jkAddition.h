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
- (void) navigationGoBackButton:(id _Nonnull) content;

- (void) navigationLeftButton:(id _Nonnull) content event:(NavigationButtonEvent _Nullable) buttonEventBlcok;

- (void) navigationRightButton:(id _Nonnull) content event:(NavigationButtonEvent _Nullable) buttonEventBlcok;


/// SEL 名字 @selector(SELString)
- (void) navigationLeftsButton:(NSArray<id> * _Nonnull) contentArray event:(NSArray<NSString *> * _Nullable) SELStringArray;

- (void) navigationRightsButton:(NSArray<id> * _Nonnull) contentArray event:(NSArray<NSString *> * _Nullable) SELStringArray;


@end
