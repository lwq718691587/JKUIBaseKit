//
//  JKPickerView.h
//  Pods
//
//  Created by A on 2017/5/31.
//
//

#import <UIKit/UIKit.h>

typedef void (^PickerScrollBlock)(NSString * _Nullable displayTitle, NSInteger index);
typedef void (^PickerSubmitBlock)(NSDictionary *_Nullable selectedValue, NSInteger index);

@interface JKPickerView : UIView

- (void) initView: (nullable NSString *) title
        dataArray: (nullable NSMutableArray<NSDictionary<NSString *, id> *> *) dataArray
     pickerScroll: (nullable PickerScrollBlock) pickerScrollBlock
           submit: (nullable PickerSubmitBlock) submitBlock;

- (void) setSelected: (NSInteger) index;

@end
