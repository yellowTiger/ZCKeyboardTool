//
//  ZCKeyboardTool.h
//  xxoogo
//
//  Created by Huang Zhicong on 2018/5/4.
//  Copyright © 2018年 xinchidao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCKeyboardTool : UIView
+(instancetype)shareTools;
//展示包含UITextView输入框的键盘
-(void)showInputTextViewKeyboard:(void(^)(NSString* txt))block;
@end
