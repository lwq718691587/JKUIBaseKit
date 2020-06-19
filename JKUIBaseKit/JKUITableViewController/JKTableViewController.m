//
//  JKTableViewController.m
//  JKUIBaseKit
//
//  Created by 刘伟强 on 2020/6/18.
//

// import分组次序：Frameworks、Services、UI
#import "JKTableViewController.h"
#import <Masonry.h>
#import "JKEmptyView.h"
#import <JKMacro_UIBase.h>
#pragma mark - @class

#pragma mark - 常量

#pragma mark - 枚举

@interface JKTableViewController ()<UITableViewDelegate,UITableViewDataSource>

#pragma mark - 私有属性
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong, readwrite) NSMutableArray *dataArr;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) JKEmptyView *emptyView;
@end

@implementation JKTableViewController

#pragma mark - Life cycle


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self.tableView addSubview:self.emptyView];
    self.isHideRefresHeader = NO;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(jkStatusBarHeight + 44);
        make.left.right.bottom.mas_equalTo(0);
    }];
    self.emptyTop = 0;
    [self refresHeaderData];
}

#pragma mark - UITableViewDataSource

//设置row的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

//设置cell的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell  alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return cell;
}

#pragma mark - UITableViewDelegate
//设置cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

#pragma mark - Public Methods
- (void)setEmptyImage:(UIImage *)image title:(NSString *)title {
    self.emptyView.image = image;
    self.emptyView.title = title;
}
#pragma mark - Private Methods

- (void)refresHeaderData {
    self.page = 0;
    [self requestDataWithPage:self.page complete:^(NSArray * _Nonnull dataArr) {
        
        if (dataArr.count == 0) {
            self.emptyView.hidden = NO;
            self.isHideRefresFooter = YES;
        } else {
            self.emptyView.hidden = YES;
            self.isHideRefresFooter = NO;
        }
        self.dataArr = dataArr.mutableCopy;
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    }];
}

- (void)refresFooterData {
    NSInteger currentPage = self.page;
    currentPage++;
    [self requestDataWithPage:self.page complete:^(NSArray * _Nonnull dataArr) {
        if (dataArr.count > 0) {
            [self.dataArr addObjectsFromArray:dataArr];
            [self.tableView reloadData];
            [self.tableView.mj_footer endRefreshing];
            self.page = currentPage;
        } else {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
        
    }];
}

#pragma mark - Getters and Setters

-(void)setIsHideRefresHeader:(BOOL)isHideRefresHeader {
    _isHideRefresHeader = isHideRefresHeader;
    if (_isHideRefresHeader) {
        self.tableView.mj_header = nil;
    } else {
        if (!self.tableView.mj_header) {
            self.tableView.mj_header = [self getRefreshHeader];
            [self.tableView.mj_header setRefreshingTarget:self refreshingAction:@selector(refresHeaderData)];
        }
    }
}

- (void)setIsHideRefresFooter:(BOOL)isHideRefresFooter {
    _isHideRefresFooter = isHideRefresFooter;
    if (_isHideRefresFooter) {
        self.tableView.mj_footer = nil;
    } else {
        if (!self.tableView.mj_footer) {
            self.tableView.mj_footer = [self getRefreshFooter];
            [self.tableView.mj_footer setRefreshingTarget:self refreshingAction:@selector(refresFooterData)];
        }
    }
}

- (void)setEmptyTop:(CGFloat)emptyTop {
    _emptyTop = emptyTop;
    self.emptyView.frame = CGRectMake(0, _emptyTop, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - _emptyTop - jkStatusBarHeight - 44);
}

- (JKEmptyView *)emptyView {
    if (!_emptyView) {
        _emptyView = [[JKEmptyView alloc] initWithFrame:CGRectMake(0, 0, 200, self.view.bounds.size.height )];
        _emptyView.hidden = YES;
    }
    return _emptyView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        //cell分割线的风格
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    }
    return _tableView;
}

#pragma mark - JKTableViewControllerProtocol

- (void)requestDataWithPage:(NSInteger)page complete:(void(^)(NSArray *dataArr))complete {
    
}

- (MJRefreshHeader *)getRefreshHeader {
    return [[MJRefreshNormalHeader alloc] init];
}

- (MJRefreshFooter *)getRefreshFooter {
    return [[MJRefreshAutoNormalFooter alloc] init];
}

@end
