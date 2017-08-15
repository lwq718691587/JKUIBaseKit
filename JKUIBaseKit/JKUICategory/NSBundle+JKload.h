//
//  NSBundle+JKload.h
//  Pods
//
//  Created by 刘伟强 on 2017/8/10.
//
//

#import <Foundation/Foundation.h>

@interface NSBundle (JKload)

+ (NSBundle *)jkBundleWithClass:(Class )currentClass budleName:(NSString *)budleName;

@end
