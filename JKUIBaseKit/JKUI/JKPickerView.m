//
//  JKPickerView.m
//  Pods
//
//  Created by A on 2017/5/31.
//
//

#import "JKPickerView.h"
#import "JKUIBaseKit.h"


@interface JKPickerView () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) UIPickerView *pickerView;

@property (nonatomic, strong) UIView *coverView;

@property (nonatomic, strong) NSMutableArray<NSDictionary<NSString *, id> *> * dataArray;

@property (nonatomic, strong) PickerScrollBlock pickerScrollBlock;

@property (nonatomic, strong) PickerSubmitBlock submitBlock;

@property (nonatomic, strong) NSMutableDictionary *currentValue;

@end

@implementation JKPickerView

- (void) initView: (nullable NSString *) title
        dataArray: (nullable NSMutableArray<NSDictionary<NSString *, id> *> *) dataArray
     pickerScroll: (nullable PickerScrollBlock) pickerScrollBlock
           submit: (nullable PickerSubmitBlock) submitBlock {
    self.dataArray         = dataArray;
    self.pickerScrollBlock = pickerScrollBlock;
    self.submitBlock       = submitBlock;
    self.currentValue      = [NSMutableDictionary dictionary];
    
    _coverView = [[UIView alloc] init];
    _coverView.backgroundColor = [UIColor colorWithRed:0.0 / 255.0f green:0.0 / 255.0f blue:0.0 / 255.0f alpha:0.5];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizer:)];
    [_coverView addGestureRecognizer:tapGestureRecognizer];
    
    [jkKeyWindow addSubview:_coverView];
    
    UIView *toolsView = [[UIView alloc] init];
    toolsView.backgroundColor = [UIColor whiteColor];
    
    UIButton *toolsCancelBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [toolsCancelBt setTitle:@"取消" forState:UIControlStateNormal];
    [toolsCancelBt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [toolsCancelBt.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
    [toolsCancelBt addTarget:self action:@selector(cancelEvent:) forControlEvents:UIControlEventTouchDown];
    [toolsView addSubview:toolsCancelBt];
    
    UILabel * toolsTitleLb = [[UILabel alloc] init];
    toolsTitleLb.text          = title;
    toolsTitleLb.textAlignment = NSTextAlignmentCenter;
    toolsTitleLb.font          = [UIFont systemFontOfSize:14.0];
    toolsTitleLb.textColor     = [UIColor colorWithRed:128.0 / 255.0f green:61.0f /255.0f blue:135.0f / 255.0f alpha:1];
    [toolsView addSubview:toolsTitleLb];
    
    UIButton *toolsSubmitBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [toolsSubmitBt setTitle:@"确认" forState:UIControlStateNormal];
    [toolsSubmitBt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [toolsSubmitBt.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
    [toolsSubmitBt addTarget:self action:@selector(submitEvent:) forControlEvents:UIControlEventTouchDown];
    [toolsView addSubview:toolsSubmitBt];
    
    [_coverView addSubview:toolsView];
    
    toolsView.layer.borderWidth = 0.5;
    toolsView.layer.borderColor = [UIColor grayColor].CGColor;
    
    _pickerView = [[UIPickerView alloc] init];
    _pickerView.backgroundColor = [UIColor whiteColor];
    _pickerView.delegate        = self;
    _pickerView.dataSource      = self;
    [_currentValue setValue:self.dataArray[0] forKey:@"value"];
    [_currentValue setValue:@(0) forKey:@"index"];
    [_coverView addSubview:_pickerView];
    
    
//    [_coverView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(jkKeyWindow.mas_top);
//        make.size.equalTo(CGSizeMake(jkScreenWidth, SCREEN_HEIGHT));
//    }];
//    
//    
//    [toolsView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(jkKeyWindow.mas_bottom).with.offset(-190);
//        make.size.equalTo(CGSizeMake(jkScreenWidth, 40));
//    }];
//    
//    [toolsCancelBt mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(toolsView.mas_top);
//        make.left.equalTo(toolsView.mas_left);
//        make.size.equalTo(CGSizeMake(60, 40));
//    }];
//    
//    [toolsSubmitBt mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(toolsView.mas_top);
//        make.right.equalTo(toolsView.mas_right);
//        make.size.equalTo(CGSizeMake(60, 40));
//    }];
//    
//    [toolsTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(toolsView.mas_top);
//        make.left.equalTo(toolsCancelBt.mas_right);
//        make.right.equalTo(toolsSubmitBt.mas_left);
//        make.height.equalTo(40);
//    }];
//    
//    [_pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(toolsView.mas_bottom);//.width.offset(10);
//        make.size.equalTo(CGSizeMake(SCREEN_WIDTH, 190));
//    }];
}

- (void) setSelected: (NSInteger) index {
    [_pickerView selectRow:index inComponent:0 animated:true];
    [_currentValue setValue:self.dataArray[index] forKey:@"value"];
    [_currentValue setValue:@(index) forKey:@"index"];
}

#pragma mark - UIPickerViewDelegate, DataSource

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.dataArray count];
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    NSString * displayTitle =  [[self.dataArray[row] allKeys] firstObject];
    
    if (self.pickerScrollBlock) {
        self.pickerScrollBlock(displayTitle, component);
    }
    
    return displayTitle;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    //    _currentValue = self.dataArray[row];
    [_currentValue setValue:self.dataArray[row] forKey:@"value"];
    [_currentValue setValue:@(row) forKey:@"index"];
}

#pragma mark - ButtonEvent

- (void) cancelEvent: (UIButton *) button {
    [self removeFromSuperview];
    [_coverView removeFromSuperview];
}

- (void) submitEvent: (UIButton *) button {
    
    if (self.submitBlock) {
        self.submitBlock([_currentValue objectForKey:@"value"],[[_currentValue objectForKey:@"index"] integerValue]);
    }
    
    [self removeFromSuperview];
    [_coverView removeFromSuperview];
}

#pragma mark - UIGestureRecognizer
- (void) tapGestureRecognizer : (UIGestureRecognizer *) gestureRecognizer
{
    [self removeFromSuperview];
    [_coverView removeFromSuperview];
    
}

@end
