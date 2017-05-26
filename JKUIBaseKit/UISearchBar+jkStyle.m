//
//  UISearchBar+style.m
//  JianKeDoctor
//
//  Created by 刘伟强 on 2017/3/16.
//  Copyright © 2017年 lijiawei. All rights reserved.
//

#import "UISearchBar+jkStyle.h"

@implementation UISearchBar (jkStyle)

- (void)setHasCentredPlaceholder:(BOOL)hasCentredPlaceholder
{
    
    SEL centerSelector = NSSelectorFromString([NSString stringWithFormat:@"%@%@", @"setCenter", @"Placeholder:"]);
    if ([self respondsToSelector:centerSelector])
    {
        NSMethodSignature *signature = [[UISearchBar class] instanceMethodSignatureForSelector:centerSelector];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self];
        [invocation setSelector:centerSelector];
        [invocation setArgument:&hasCentredPlaceholder atIndex:2];
        [invocation invoke];
    }
    
}


@end
