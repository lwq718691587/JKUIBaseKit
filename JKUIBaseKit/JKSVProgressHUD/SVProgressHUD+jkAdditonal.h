//
//  SVProgressHUD+Additonal.h
//  
//
//  Created by 刘伟强 on 2017/4/27.
//
//

#import <SVProgressHUD/SVProgressHUD.h>

@interface SVProgressHUD (jkAdditonal)

+ (void)jk_show;

+ (void)jk_dismiss;

+ (void)jk_showSuccessWithStatus:(NSString *)status;

+ (void)jk_showErrorWithStatus:(NSString *)status;

@end
