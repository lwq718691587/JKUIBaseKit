//
//  JKTestViewController.m
//  JKUIBaseKit_Example
//
//  Created by 刘伟强 on 2020/6/18.
//  Copyright © 2020 liuweiqiang. All rights reserved.
//

// import分组次序：Frameworks、Services、UI
#import "JKTestViewController.h"

#pragma mark - @class

#pragma mark - 常量

#pragma mark - 枚举

@interface JKTestViewController ()

#pragma mark - 私有属性

@end

@implementation JKTestViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setEmptyImage:[UIImage imageNamed:@"Common_error_networkError"] title:@"暂无数据"];
    
    [self configureNavigationbar];
    [self createSubViews];
    [self createSubViewsConstraints];
}

#pragma mark - Events

#pragma mark - UITextFieldDelegate

#pragma mark - UITableViewDataSource
//设置cell的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell  alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    NSDictionary *dic = self.dataArr[indexPath.row];
    cell.textLabel.text = dic[@"content"];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

#pragma mark - UITableViewDelegate
//设置cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}
#pragma mark - UITableViewDelegate

#pragma mark - UIOtherComponentDelegate

#pragma mark - Custom Delegates

#pragma mark - Public Methods

#pragma mark - Private Methods
// 配置导航栏
- (void)configureNavigationbar {
    self.title = @"列表";
    self.view.backgroundColor = [UIColor whiteColor];
}

// 添加子视图
- (void)createSubViews {
    
}

// 添加约束
- (void)createSubViewsConstraints {
    
}

- (void)requestDataWithPage:(NSInteger)page complete:(void(^)(NSArray *dataArr))complete {
    
    //请求地址
    NSString *urlStr = [NSString stringWithFormat:@"http://v.juhe.cn/joke/content/text.php?key=1b276db92deba10fa14b00035ad110a7&page=%ld&pagesize=10",page] ;
    
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            BOOL flag = NO;
            if (flag) {
                NSArray *arr = dict[@"result"][@"data"];
                complete(arr);
            } else {
                complete(@[]);
            }
           
            
        });
    }];
    [dataTask resume];
}

#pragma mark - Getters and Setters

@end
