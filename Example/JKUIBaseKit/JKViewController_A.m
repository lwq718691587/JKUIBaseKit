//
//  JKViewController_A.m
//  JKUIBaseKit
//
//  Created by 刘伟强 on 2017/5/26.
//  Copyright © 2017年 liuweiqiang. All rights reserved.
//

#import "JKViewController_A.h"
#import <JKUIBaseKit/JKUIBaseKit.h>
@interface JKViewController_A ()

@end

@implementation JKViewController_A

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self.navigationController navigationGoBackButton:@"a"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
