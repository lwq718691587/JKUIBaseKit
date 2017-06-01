//
//  UITextView+jkPlaceholder.m
//  Pods
//
//  Created by A on 2017/5/31.
//
//

#import "UITextView+jkPlaceholder.h"
#import <objc/runtime.h>

static const void *placeholderKey = &placeholderKey;
static const void *defaultTextColorKey = &defaultTextColorKey;

@implementation UITextView(jkPlaceholder)

- (void) setPlaceholder: (NSString *) string {
    objc_setAssociatedObject(self, placeholderKey, string, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.text = string;
    UIColor *tempColor = self.defaultTextColor;
    self.defaultTextColor = self.textColor;
    self.textColor = tempColor;
}

- (NSString *) placeholder {
    return objc_getAssociatedObject(self, placeholderKey);
}

#pragma mark Private
- (UIColor *) defaultTextColor {
    UIColor *defaultTextColor = objc_getAssociatedObject(self, defaultTextColorKey);
    if (defaultTextColor == nil) {
        defaultTextColor = [UIColor lightGrayColor];
        objc_setAssociatedObject(self, defaultTextColorKey, defaultTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return defaultTextColor;
}

- (void) setDefaultTextColor: (UIColor *) color {
    objc_setAssociatedObject(self, defaultTextColorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void) defaultStart {
    
    SEL original1Selector = @selector(textViewShouldBeginEditing:);
    SEL swizzled1Selector = @selector(la_textViewShouldBeginEditing:);
    Method original1Method = class_getInstanceMethod(object_getClass(self.delegate), original1Selector);
    Method swizled1Method  = class_getInstanceMethod(object_getClass(self), swizzled1Selector);
    
    BOOL didAddMethod = class_addMethod(object_getClass(self.delegate), original1Selector, method_getImplementation(swizled1Method), method_getTypeEncoding(swizled1Method));
    if (didAddMethod) {
        class_replaceMethod(object_getClass(self.delegate), swizzled1Selector, method_getImplementation(original1Method), method_getTypeEncoding(original1Method));
    } else {
        method_exchangeImplementations(original1Method, swizled1Method);
    }
    
    SEL original2Selector = @selector(textViewShouldEndEditing:);
    SEL swizzled2Selector = @selector(la_textViewShouldEndEditing:);
    Method original2Method = class_getInstanceMethod(object_getClass(self.delegate), original2Selector);
    Method swizled2Method  = class_getInstanceMethod(object_getClass(self), swizzled2Selector);
    
    BOOL didAddMethod1 = class_addMethod(object_getClass(self.delegate), original2Selector, method_getImplementation(swizled2Method), method_getTypeEncoding(swizled2Method));
    if (didAddMethod1) {
        class_replaceMethod(object_getClass(self.delegate), swizzled2Selector, method_getImplementation(original2Method), method_getTypeEncoding(original2Method));
    } else {
        method_exchangeImplementations(original2Method, swizled2Method);
    }
}

- (BOOL)la_textViewShouldBeginEditing:(UITextView *)textView {
    
    if (textView.placeholder != nil
        && [textView.placeholder isEqualToString:textView.text]) {
        textView.text  = @"";
        UIColor *tempColor = textView.defaultTextColor;
        textView.defaultTextColor = textView.textColor;
        textView.textColor = tempColor;
    }
    
    /// 实际上是调用Delegate里面实现的 textViewShouldBeginEditing == la_textViewShouldBeginEditing
    if ([self respondsToSelector:@selector(la_textViewShouldBeginEditing:)]) {
        return [self la_textViewShouldBeginEditing:textView];
    } else {
        return true;
    }
}

- (BOOL)la_textViewShouldEndEditing:(UITextView *)textView {
    
    if (textView.text == nil
        || [textView.text isEqualToString:@""]) {
        textView.text  = textView.placeholder;
        UIColor *tempColor = textView.defaultTextColor;
        textView.defaultTextColor = textView.textColor;
        textView.textColor = tempColor;
    }
    
    if ([self respondsToSelector:@selector(la_textViewShouldEndEditing:)]) {
        return [self la_textViewShouldEndEditing:textView];
    } else {
        return true;
    }
}


@end
