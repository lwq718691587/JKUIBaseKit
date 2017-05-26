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

/// Content:  UIImage, NSString, NSAttributedString
- (void) navigationGoBackButton:(id) content {
    
}

- (void) navigationLeftButton:(id) content event:(NavigationButtonEvent) buttonEventBlcok {
    objc_setAssociatedObject(self, jkLeftButtonPropertyKey, buttonEventBlcok, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(0, 0, 44, 44);
//    if(title){
//        [button setTitle:title forState:UIControlStateNormal];
//        button.titleLabel.font = [UIFont systemFontOfSize:14];
//        [button setTitleColor:KTextTitleColorlalala forState:UIControlStateNormal];
//    }
//    if (imageName) {
//        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
//    }
//    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *butItem = [[UIBarButtonItem alloc] initWithCustomView:button];
//    if (type == BarButton_Left) {
//        self.navigationItem.leftBarButtonItem = butItem;
//        [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
//    }
//    else if(type == BarButton_Right){
//        self.navigationItem.rightBarButtonItem = butItem;
//        [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
//    }
}

- (void) navigationRightButton:(id) content event:(NavigationButtonEvent) buttonEventBlcok {
    objc_setAssociatedObject(self, jkLeftButtonPropertyKey, buttonEventBlcok, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    
}


/// SEL 名字 @selector(SELString)
- (void) navigationLeftsButton:(NSArray<id> *) content event:(NSArray<NSString *> *) SELStringArray {
    [self navigationButton:content event:SELStringArray isRight:false];
}

- (void) navigationRightsButton:(NSArray<id> *) content event:(NSArray<NSString *> *) SELStringArray {
    [self navigationButton:content event:SELStringArray isRight:true];
}

- (void) navigationButton:(NSArray<id> *) content event:(NSArray<NSString *> *) SELStringArray isRight:(BOOL) isRight {
    
    
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
