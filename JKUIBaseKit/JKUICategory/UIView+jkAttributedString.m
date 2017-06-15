//
//  UIView+jkAttributedString.m
//  Pods
//
//  Created by A on 2017/5/31.
//
//

#import "UIView+jkAttributedString.h"

@implementation UIView(jkAttributedString)

- (void) rangeText:(NSRange) range font:(UIFont *) font {
    [self rangeText:range font:font color:nil];
}

- (void) rangeText:(NSRange) range font:(UIFont *) font color: (UIColor *) color {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString: [self la_getAttributedString]];
    {
        if (font == nil || font.pointSize == 0) font = [self la_getAttributedFont];
        
        [attributedString addAttribute: NSFontAttributeName
                                 value: font
                                 range: range.length  == 0 ? NSMakeRange(0, attributedString.length) : range];
        
        if (color != nil) {
            [attributedString addAttribute: NSForegroundColorAttributeName
                                     value: color
                                     range: range.length  == 0 ? NSMakeRange(0, attributedString.length) : range];
        }
    }
    [self setValue:attributedString forKey:@"attributedText"];
}

- (void) rangeTextSpace:(CGFloat) space {
    [self rangeText:NSMakeRange(0, 0) space:space];
}

- (void) rangeText:(NSRange)range space:(CGFloat)space {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString: [self la_getAttributedString]];
    {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = space;
        paragraphStyle.alignment   = NSTextAlignmentJustified;
        
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range.length  == 0 ? NSMakeRange(0, attributedString.length) : range];
    }
    [self setValue:attributedString forKey:@"attributedText"];
}

- (void) rangeText:(NSRange)range image:(UIImage *) image imageRect:(CGRect) imageRect {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString: [self la_getAttributedString]];
    {
        NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
        textAttachment.image = image;
        textAttachment.bounds = imageRect;
        [attributedString insertAttributedString:[NSAttributedString attributedStringWithAttachment:textAttachment ] atIndex:range.location];
    }
    [self setValue:attributedString forKey:@"attributedText"];
}



#pragma mark - Private Function

- (NSMutableAttributedString *) la_getAttributedString {
    NSMutableAttributedString *attributedString;
    
    if ([self respondsToSelector:@selector(attributedText)]) {
        attributedString = [self valueForKey:@"attributedText"];
    } else {
        NSLog(@"%s 没有相关的AttributedString",__FUNCTION__);
    }
    
    return attributedString;
}

- (UIFont *) la_getAttributedFont {
    UIFont *font;
    
    if ([self respondsToSelector:@selector(font)]) {
        font = [self valueForKey:@"font"];
    } else {
        NSLog(@"%s 没有相关的Font",__FUNCTION__);
    }
    
    return font;
}


@end


@implementation NSString(jkAttributedStringUtil)

- (CGRect) boundingRectWithSize:(CGSize)size font: (UIFont *) font lineSpace: (CGFloat) sapce {
    
    CGRect textRect    = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil];
    CGFloat textHeight = textRect.size.height;
    CGFloat charHeight = [@"y" boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size.height;
    
    NSInteger lineNum  = textHeight / charHeight;
    
    if (lineNum > 1) {
        lineNum = lineNum - 1;
    }
    
    return (CGRect){.origin = textRect.origin, .size = {textRect.size.width, textRect.size.height + lineNum * (sapce )}};//+ font.descender)}};
}

@end

