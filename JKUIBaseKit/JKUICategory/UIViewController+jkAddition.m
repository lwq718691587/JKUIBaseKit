//
//  UIViewController+jkAddition.m
//  Pods
//
//  Created by A on 2017/6/5.
//
//

#import "UIViewController+jkAddition.h"
#import "JKMacro_UIBase.h"
#import <objc/runtime.h>

void static * const jkLeftButtonPropertyKey = @"jkLeftButtonPropertyKey";
void static * const jkRightButtonPropertyKey = @"jkRightButtonPropertyKey";


@implementation UIViewController(jkAddition)



- (void)setNavTitle:(NSString * _Nonnull)title
              color:(UIColor *_Nonnull)color
               font:(UIFont *_Nonnull)font {
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, jkScreenWidth, 44)];
    titleView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    titleView.autoresizesSubviews = YES;
    titleView.backgroundColor = [UIColor clearColor];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, jkScreenWidth, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = color;
    titleLabel.font = font;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    titleLabel.autoresizingMask = titleView.autoresizingMask;
    
    CGSize size = [titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 44)
                              options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                           attributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil]
                              context:NULL].size;
    CGFloat width = size.width;
    //        CGFloat width = 100;
    CGFloat maxWidth = 120;
    if(width <= jkScreenWidth-2*maxWidth){
        titleLabel.frame = CGRectMake(0, 0, jkScreenWidth-maxWidth*2, 44);
        titleView.frame = CGRectMake(maxWidth, 0, jkScreenWidth-maxWidth*2, 44);
    }else{
        CGRect leftViewbounds = self.navigationItem.leftBarButtonItem.customView.bounds;
        CGRect rightViewbounds = self.navigationItem.rightBarButtonItem.customView.bounds;
        CGRect frame;
        CGFloat maxWidth = leftViewbounds.size.width > rightViewbounds.size.width ? leftViewbounds.size.width : rightViewbounds.size.width;
        maxWidth += 15;
        frame = titleLabel.frame;
        frame.size.width = jkScreenWidth - maxWidth * 2;
        titleLabel.frame = frame;
        
        frame = titleView.frame;
        frame.size.width = jkScreenWidth - maxWidth * 2;
        titleView.frame = frame;
    }
    titleLabel.text = title;
    [titleView addSubview:titleLabel];
    self.navigationItem.titleView = titleView;
}

- (void)creatNavigationBarButton:(NSString *_Nonnull)title
             backgroundImageName:(NSString *_Nonnull)imageName
                      titleColor:(UIColor *_Nonnull)color
                       titleFont:(UIFont *_Nonnull)font
                          action:(SEL _Nonnull)action
                            type:(Navtiontype)type {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 44, 44);
    if(title){
        [button setTitle:title forState:UIControlStateNormal];
        button.titleLabel.font = font;
        [button setTitleColor:color forState:UIControlStateNormal];
    }
    if (imageName) {
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *butItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    if (type == BarButton_Left) {
        self.navigationItem.leftBarButtonItem = butItem;
        [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    }
    else if(type == BarButton_Right){
        self.navigationItem.rightBarButtonItem = butItem;
        [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    }
}


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
            
            SEL action = @selector(nilEvent:);
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

- (void) nilEvent:(UIButton *) buttonEvetn {
    NSLog(@"未有对应的点击事件");
}

@end

