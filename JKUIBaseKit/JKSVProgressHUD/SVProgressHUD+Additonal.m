//
//  SVProgressHUD+Additonal.m
//  
//
//  Created by 刘伟强 on 2017/4/27.
//
//

#import "SVProgressHUD+Additonal.h"

@implementation SVProgressHUD (Additonal)


+ (void)jk_show{
    [SVProgressHUD setOffsetFromCenter:UIOffsetMake([UIApplication sharedApplication].keyWindow.frame.size.width/2, [UIApplication sharedApplication].keyWindow.frame.size.height/2)];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeFlat];
    [SVProgressHUD show];
}

+ (void)jk_dismiss{
    [SVProgressHUD dismiss];
}

+ (void)jk_showSuccessWithStatus:(NSString *)status{
    [SVProgressHUD setOffsetFromCenter:UIOffsetMake([UIApplication sharedApplication].keyWindow.frame.size.width/2, [UIApplication sharedApplication].keyWindow.frame.size.height/2)];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeFlat];
    [SVProgressHUD setMinimumDismissTimeInterval:1];
    [SVProgressHUD showSuccessWithStatus:status];
}

+ (void)jk_showErrorWithStatus:(NSString *)status{
    [SVProgressHUD setOffsetFromCenter:UIOffsetMake([UIApplication sharedApplication].keyWindow.frame.size.width/2, [UIApplication sharedApplication].keyWindow.frame.size.height/2)];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeFlat];
    [SVProgressHUD setMinimumDismissTimeInterval:1];
    [SVProgressHUD showInfoWithStatus:status];
}



@end
