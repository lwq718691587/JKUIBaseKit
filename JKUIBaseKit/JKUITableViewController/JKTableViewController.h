//
//  JKTableViewController.h
//  JKUIBaseKit
//
//  Created by 刘伟强 on 2020/6/18.
//

// import分组次序：Frameworks、Services、UI
#import <UIKit/UIKit.h>
#import "JKTableViewControllerProtocol.h"
#pragma mark - @class

#pragma mark - 常量

#pragma mark - 枚举

NS_ASSUME_NONNULL_BEGIN

/**
 * <#类注释，说明类的功能#>
 * @note <#额外说明的注意项，说明一些需要注意的地方，没有可取消此项。#>
 */
@interface JKTableViewController : UIViewController<JKTableViewControllerProtocol,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong,readonly) NSMutableArray *dataArr;

@property (nonatomic, assign) BOOL isHideRefresHeader;
@property (nonatomic, assign) BOOL isHideRefresFooter;
@property (nonatomic, assign) CGFloat emptyTop;

- (void)setEmptyImage:(UIImage *)image title:(NSString *)title;


@end

NS_ASSUME_NONNULL_END
