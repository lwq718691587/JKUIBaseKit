//
//  JKEmptyView.m
//  JKUIBaseKit
//
//  Created by 刘伟强 on 2020/6/19.
//

// import分组次序：Frameworks、Services、UI
#import "JKEmptyView.h"
#import <Masonry.h>
#pragma mark - @class

#pragma mark - 常量

#pragma mark - 枚举

@interface JKEmptyView ()

#pragma mark - 私有属性
@property (nonatomic, strong) UIView *centerBackView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;


@end

@implementation JKEmptyView


#pragma mark - Life cycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self createSubViews];
        [self createSubViewsConstraints];
    }
    return self;
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (void)dealloc {
    NSLog(@"%@ - dealloc", NSStringFromClass([self class]));
}

#pragma mark - Events

#pragma mark - UIOtherComponentDelegate

#pragma mark - Custom Delegates

#pragma mark - Public Methods

#pragma mark - Private Methods

// 添加子视图
- (void)createSubViews {
    [self addSubview:self.centerBackView];
    [self.centerBackView addSubview:self.imageView];
    [self.centerBackView addSubview:self.titleLabel];
}

// 添加约束
- (void)createSubViewsConstraints {
    [self.centerBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(0);
    }];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageView.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.width.mas_lessThanOrEqualTo(self.imageView.mas_width);
        make.bottom.mas_equalTo(0);
    }];
}

#pragma mark - Getters and Setters

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = _title;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageView.image = _image;
}

- (void)setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;
    self.titleLabel.font = _titleFont;
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    self.titleLabel.textColor = _titleColor;
}

- (UIView *)centerBackView {
    if (!_centerBackView) {
        _centerBackView = [[UIView alloc] init];
    }
    return _centerBackView;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:30];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

@end
