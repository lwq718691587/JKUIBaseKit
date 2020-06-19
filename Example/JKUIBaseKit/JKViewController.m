//
//  JKViewController.m
//  JKUIBaseKit
//
//  Created by liuweiqiang on 05/26/2017.
//  Copyright (c) 2017 liuweiqiang. All rights reserved.
//

#import "JKViewController.h"
#import <JKUIBaseKit/JKUIBaseKit.h>
#import "JKTestViewController.h"

@interface JKViewController ()

@end

@implementation JKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapFun)];
    [self.view addGestureRecognizer:tap];
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
}


-(void)tapFun{
    JKTestViewController * vc = [[JKTestViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
