//
//  UITextView+jkPlaceholder.h
//  Pods
//
//  Created by A on 2017/5/31.
//
//

#import <UIKit/UIKit.h>

@interface UITextView(jkPlaceholder)

- (void) setPlaceholder: (NSString *) string;

- (NSString *) placeholder;

/// 未知UITextView生命周期中的合适位置，所以暂时调用这个来触发 方法替换
- (void) defaultStart;


@end
