//
//  NSBundle+JKload.m
//  Pods
//
//  Created by 刘伟强 on 2017/8/10.
//
//

#import "NSBundle+JKload.h"

@implementation NSBundle (JKload)

+(NSBundle *)jkBundleWithClass:(Class )currentClass budleName:(NSString *)budleName{
     NSBundle *b= [NSBundle bundleWithURL:[[NSBundle bundleForClass:currentClass] URLForResource:budleName withExtension:@"bundle"]];
    
    return b;
}

@end
