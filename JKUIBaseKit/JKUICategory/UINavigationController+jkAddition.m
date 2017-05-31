//
//  UINavigationController+jkAddition.m
//  Pods
//
//  Created by A on 2017/5/26.
//
//

#import "UINavigationController+jkAddition.h"
#import <objc/runtime.h>

void static * const jkLeftButtonPropertyKey = @"jkLeftButtonPropertyKey";
void static * const jkRightButtonPropertyKey = @"jkRightButtonPropertyKey";


@implementation UINavigationController(jkAddition)

/// Content:  UIImage, NSString, NSAttributedString, UIButton，UIBarButtonItem
- (void) navigationGoBackButton:(UIViewController *_Nonnull) viewController
                        content:(id _Nonnull) content{
    [self navigationButton:viewController contents:@[content] events:@[@"goBackEvent:"] isRight:false isDefault:true];
}

- (void) navigationLeftButton:(UIViewController *_Nonnull) viewController
                      content: (id _Nonnull) content
                        event:(NavigationButtonEvent _Nullable) buttonEventBlcok{
    objc_setAssociatedObject(self, jkLeftButtonPropertyKey, buttonEventBlcok, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self navigationButton:viewController contents:@[content] events:@[@"blockEvent:"] isRight:false isDefault:true];
}

- (void) navigationRightButton:(UIViewController *_Nonnull) viewController
                       content:(id _Nonnull) content
                         event:(NavigationButtonEvent _Nullable) buttonEventBlcok{
    objc_setAssociatedObject(self, jkRightButtonPropertyKey, buttonEventBlcok, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self navigationButton:viewController contents:@[content] events:@[@"blockEvent:"] isRight:true isDefault:true];
}


/// SEL 名字 @selector(SELString)
- (void) navigationLeftButtons:(UIViewController *_Nonnull) viewController
                      contents:(NSArray<id> * _Nonnull) contentArray
                        events:(NSArray<NSString *> * _Nullable) SELStringArray {
    [self navigationButton:viewController contents:contentArray events:SELStringArray isRight:false isDefault:false];
}

- (void) navigationRightButtons:(UIViewController *_Nonnull) viewController
                       contents:(NSArray<id> * _Nonnull) contentArray
                         events:(NSArray<NSString *> * _Nullable) SELStringArray {
    [self navigationButton:viewController contents:contentArray events:SELStringArray isRight:true isDefault:false];
}

- (void) navigationButton:(UIViewController * _Nonnull) viewController
                 contents:(NSArray<id> * _Nonnull) contentArray
                   events:(NSArray<NSString *> * _Nullable) SELStringArray
                  isRight:(BOOL) isRight
                isDefault:(BOOL) isDefault {
    
    NSMutableArray<UIBarButtonItem *> *barButtonArray = [NSMutableArray<UIBarButtonItem *> array];
    for (int i = 0; i < [contentArray count]; i ++) {
        id content = contentArray[i];
        
        if ([content isKindOfClass:[UIImage class]]
            || [content isKindOfClass:[NSString class]]
            || [content isKindOfClass:[NSAttributedString class]]){
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0, 0, 44, 44);
            
            if([content isKindOfClass:[NSString class]]){
                [button setTitle:content forState:UIControlStateNormal];
                button.titleLabel.font = [UIFont systemFontOfSize:14];
            }
            if ([content isKindOfClass:[UIImage class]]) {
                [button setImage:content forState:UIControlStateNormal];
            }
            if ([content isKindOfClass:[NSAttributedString class]]) {
                [button setAttributedTitle:content forState:UIControlStateNormal];
            }
            
            SEL action = nil;
            if (SELStringArray.count > i) {
                action = NSSelectorFromString(SELStringArray[i]);
            }
            
            [button addTarget:isDefault ? self : viewController action:action forControlEvents:UIControlEventTouchUpInside];
            [barButtonArray addObject:[[UIBarButtonItem alloc] initWithCustomView:button]];
            
        } else if ([content isKindOfClass:[UIButton class]]) {
            [barButtonArray addObject:[[UIBarButtonItem alloc] initWithCustomView:content]];
        } else if ([content isKindOfClass:[UIBarButtonItem class]]){
            [barButtonArray addObject:content];
        }
    }
    
    if (isRight) {
        viewController.navigationItem.rightBarButtonItems = barButtonArray;
    } else {
        viewController.navigationItem.leftBarButtonItems = barButtonArray;
    }
}



#pragma mark - NavigationGoBackButtonEvent

- (void) goBackEvent:(UIButton *) buttonEvent {
    [self.navigationController popViewControllerAnimated:true];
}

- (void) blockEvent:(UIButton *) buttonEvent {
    NavigationButtonEvent  navigationButtonEventBlock = objc_getAssociatedObject(self, (buttonEvent.tag == 0 ? jkLeftButtonPropertyKey : jkRightButtonPropertyKey));
    if (navigationButtonEventBlock) navigationButtonEventBlock();
}

@end
