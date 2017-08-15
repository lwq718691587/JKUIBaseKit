//
//  DRTextView.h
//  TextViewCustom
//
//  Created by 李树诚 on 15/12/23.
//  Copyright © 2015年 李树诚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JKPlaceholderTextView : UITextView

/**
 * 占位文字
 */
@property (nonatomic, copy) NSString *placeholder;
/**
 * 占位文字的颜色
 */
@property (nonatomic, strong) UIColor *placeholderColor;

@end
