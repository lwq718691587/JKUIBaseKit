//
//  UISearchBar+style.m
//  JianKeDoctor
//
//  Created by 刘伟强 on 2017/3/16.
//  Copyright © 2017年 lijiawei. All rights reserved.
//

#import "UISearchBar+jkStyle.h"

@implementation UISearchBar (jkStyle)

-(void)jkStyle{
    [self setImage:[UIImage imageNamed:@"icon_input_search"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"btn_input_erase"] forSearchBarIcon:UISearchBarIconClear state:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"btn_input_erase"] forSearchBarIcon:UISearchBarIconClear state:UIControlStateHighlighted];
    
    [self setBarStyle:UIBarStyleDefault];
    [self setBackgroundColor:[UIColor clearColor]];
    [[[self.subviews objectAtIndex:0].subviews objectAtIndex:0] removeFromSuperview];
    UITextField *searchFiled = [self valueForKey:@"_searchField"];
    searchFiled.layer.cornerRadius = 15;
    searchFiled.layer.masksToBounds = YES;
    //searchFiled.backgroundColor = HexColor(@"f5f5f5");
    
}

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
