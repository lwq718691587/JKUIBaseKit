//
//  JKTableViewControllerProtocol.h
//  JKUIBaseKit
//
//  Created by 刘伟强 on 2020/6/18.
//

#import <Foundation/Foundation.h>
#import <MJRefresh/MJRefresh.h>
NS_ASSUME_NONNULL_BEGIN

@protocol JKTableViewControllerProtocol <NSObject>

@required
- (void)requestDataWithPage:(NSInteger)page
                   complete:(void(^)(NSArray *dataArr))complete;

@optional

///当前头部刷新样式不能满足时，子类自己返回
- (MJRefreshHeader *)getRefreshHeader;
///当前尾部刷新样式不能满足时，子类自己返回
- (MJRefreshFooter *)getRefreshFooter;

@end

NS_ASSUME_NONNULL_END
