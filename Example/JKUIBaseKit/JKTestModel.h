//
//  JKTestModel.h
//  JKUIBaseKit_Example
//
//  Created by 刘伟强 on 2020/6/18.
//  Copyright © 2020 liuweiqiang. All rights reserved.
//

// import分组次序：Frameworks、Services、UI
#import <Foundation/Foundation.h>

#pragma mark - @class

#pragma mark - 常量

#pragma mark - 枚举

NS_ASSUME_NONNULL_BEGIN

/**
 * <#类注释，说明类的功能#>
 * @note <#额外说明的注意项，说明一些需要注意的地方，没有可取消此项。#>
 */
@interface JKTestModel : NSObject

@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *updatetime;

@end

NS_ASSUME_NONNULL_END
