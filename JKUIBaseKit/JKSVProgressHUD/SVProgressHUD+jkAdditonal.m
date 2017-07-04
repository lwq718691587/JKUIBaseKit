//
//  SVProgressHUD+Additonal.m
//
//
//  Created by 刘伟强 on 2017/4/27.
//
//

#import "SVProgressHUD+jkAdditonal.h"
#import "SVProgressHUD.h"
#import "JKMacro_UIBase.h"


@implementation SVProgressHUD (jkAdditonal)

+ (void)jk_show{
    [SVProgressHUD setContainerView:jkKeyWindow];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeFlat];
    [SVProgressHUD show];
}

+ (void)jk_dismiss{
    [SVProgressHUD dismiss];
}

+ (void)jk_showSuccessWithStatus:(NSString *)status{
    [SVProgressHUD setContainerView:jkKeyWindow];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeFlat];
    [SVProgressHUD setMinimumDismissTimeInterval:1];
    [SVProgressHUD showSuccessWithStatus:status];
}

+ (void)jk_showErrorWithStatus:(NSString *)status{
    [SVProgressHUD setContainerView:jkKeyWindow];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeFlat];
    [SVProgressHUD setMinimumDismissTimeInterval:1];
    [SVProgressHUD showInfoWithStatus:status];
}



@end
