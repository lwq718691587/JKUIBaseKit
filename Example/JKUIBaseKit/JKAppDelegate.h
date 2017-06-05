//
//  JKAppDelegate.h
//  JKUIBaseKit
//
//  Created by liuweiqiang on 05/26/2017.
//  Copyright (c) 2017 liuweiqiang. All rights reserved.
//
//s.public_header_files = 'JKUIBaseKit/JKUIBaseKit.h'
//s.source_files = 'JKUIBaseKit/JKUIBaseKit.h'
//
//s.subspec 'JKUIMacro' do |ss|
//ss.source_files = "JKUIBaseKit/JKUIMacro","*.{h,m}"
//end
//
//s.subspec 'JKSVProgressHUD' do |ss|
//
//ss.dependency 'JKUIBaseKit/JKUIMacro'
//ss.source_files = "JKUIBaseKit/JKSVProgressHUD","*.{h,m}"
//end
//
//s.subspec 'JKUI' do |ss|
//
//ss.dependency 'JKUIBaseKit/JKUIMacro'
//
//ss.source_files = "JKUIBaseKit/JKUI","*.{h,m}"
//
//end
//
//s.subspec 'JKUICategory' do |ss|
//ss.source_files = "JKUIBaseKit/JKUICategory","*.{h,m}"
//end
@import UIKit;

@interface JKAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
