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

/// Content:  UIImage, NSString, NSAttributedString, UIButton
- (void) navigationGoBackButton:(id) content;

- (void) navigationLeftButton:(id) content event:(NavigationButtonEvent) buttonEventBlcok;

- (void) navigationRightButton:(id) content event:(NavigationButtonEvent) buttonEventBlcok;


/// SEL 名字 @selector(SELString)
- (void) navigationLeftsButton:(NSArray<id> *) content event:(NSArray<NSString *> *) SELStringArray;

- (void) navigationRightsButton:(NSArray<id> *) content event:(NSArray<NSString *> *) SELStringArray;


@end
