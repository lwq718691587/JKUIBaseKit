//
//  UIView+jkAttributedString.h
//  Pods
//
//  Created by A on 2017/5/31.
//
//

#import <UIKit/UIKit.h>

@interface UIView(jkAttributedString)

- (void) rangeText:(NSRange) range font:(UIFont *) font;

- (void) rangeText:(NSRange) range font:(UIFont *) font color: (UIColor *) color;

- (void) rangeTextSpace:(CGFloat) space;

- (void) rangeText:(NSRange)range space:(CGFloat) space;

- (void) rangeText:(NSRange)range image:(UIImage *) image imageRect:(CGRect) imageRect;

@end

@interface NSString(jkAttributedStringUtil)

- (CGRect) boundingRectWithSize:(CGSize)size font: (UIFont *) font lineSpace: (CGFloat) sapce;

@end
