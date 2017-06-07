//
//  UIViewController+jkAddition.m
//  Pods
//
//  Created by A on 2017/6/5.
//
//

#import "UIViewController+jkAddition.h"

#import <objc/runtime.h>

void static * const jkLeftButtonPropertyKey = @"jkLeftButtonPropertyKey";
void static * const jkRightButtonPropertyKey = @"jkRightButtonPropertyKey";


@implementation UIViewController(jkAddition)

/// Content:  UIImage, NSString, NSAttributedString, UIButton，UIBarButtonItem
- (void) navigationGoBackButton:(id _Nonnull) content{
    [self navigationButtons:@[content] events:@[@"goBackEvent:"] isRight:false];
}

- (void) navigationLeftButton: (id _Nonnull) content
                        event:(NavigationButtonEvent _Nullable) buttonEventBlcok{
    objc_setAssociatedObject(self, jkLeftButtonPropertyKey, buttonEventBlcok, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self navigationButtons:@[content] events:@[@"blockEvent:"] isRight:false];
}

- (void) navigationRightButton:(id _Nonnull) content
                         event:(NavigationButtonEvent _Nullable) buttonEventBlcok{
    objc_setAssociatedObject(self, jkRightButtonPropertyKey, buttonEventBlcok, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self navigationButtons:@[content] events:@[@"blockEvent:"] isRight:true];
}


/// SEL 名字 @selector(SELString)
- (void) navigationLeftButtons:(NSArray<id> * _Nonnull) contentArray
                        events:(NSArray<NSString *> * _Nullable) SELStringArray {
    [self navigationButtons:contentArray events:SELStringArray isRight:false];
}

- (void) navigationRightButtons:(NSArray<id> * _Nonnull) contentArray
                         events:(NSArray<NSString *> * _Nullable) SELStringArray {
    [self navigationButtons:contentArray events:SELStringArray isRight:true];
}

- (void) navigationButtons:(NSArray<id> * _Nonnull) contentArray
                    events:(NSArray<NSString *> * _Nullable) SELStringArray
                   isRight:(BOOL) isRight {
    
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
            
            [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
            [barButtonArray addObject:[[UIBarButtonItem alloc] initWithCustomView:button]];
            
        } else if ([content isKindOfClass:[UIButton class]]) {
            [barButtonArray addObject:[[UIBarButtonItem alloc] initWithCustomView:content]];
        } else if ([content isKindOfClass:[UIBarButtonItem class]]){
            [barButtonArray addObject:content];
        }
    }
    
    if (isRight) {
        self.navigationItem.rightBarButtonItems = barButtonArray;
    } else {
        self.navigationItem.leftBarButtonItems = barButtonArray;
    }
}



#pragma mark - NavigationGoBackButtonEvent

- (void) goBackEvent:(UIButton *) buttonEvent {
    [self.navigationController popViewControllerAnimated:true];
}

- (void) blockEvent:(UIButton *) buttonEvent {
    NavigationButtonEvent  navigationButtonEventBlock = objc_getAssociatedObject(self, (buttonEvent.tag == 0 ? jkLeftButtonPropertyKey : jkRightButtonPropertyKey));
    if (navigationButtonEventBlock) navigationButtonEventBlock(buttonEvent);
}

@end

