//
//  ZCCommentView.m
//  ZCKeyboardTool
//
//  Created by Huang Zhicong on 2018/5/5.
//  Copyright © 2018年 hzc. All rights reserved.
//

#import "ZCCommentView.h"

@interface ZCCommentView()

@end
@implementation ZCCommentView
-(UITextView *)textV{
    if (_textV==nil) {
        _textV=[[UITextView alloc]init];
        _textV.layer.cornerRadius=3;
        _textV.layer.borderWidth=1;
        _textV.layer.borderColor=[[UIColor colorWithRed:245.0/255 green:220.0/245 blue:247.0/255 alpha:1] CGColor];
        _textV.font=[UIFont systemFontOfSize:15];
    }
    return _textV;
}
///init方法内部会自动调用-(instancetype)initWithFrame:(CGRect)frame  方法
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        _btn =[[UIButton alloc]init];
        [_btn setTitleColor:[UIColor colorWithRed:124.0/255 green:77.0/255 blue:1 alpha:1] forState:UIControlStateNormal];
        [_btn setTitle:@"send" forState:UIControlStateNormal];
        [self addSubview:_btn];
        _btn.frame=CGRectMake(screenWidth-60,0, 50, 40);

        
        self.textV.frame=CGRectMake(5, 2.5, screenWidth-75, 35);
        [self addSubview:self.textV];
        self.textV.inputAccessoryView=self;
        
    }
    return self;
}
/**
 * 这个方法专门用来布局子控件，一般在这里设置子控件的frame
 * 当控件本身的尺寸发生改变的时候，系统会自动调用这个方
 */
-(void)layoutSubviews{
    // 一定要调用super方法
    [super layoutSubviews];
    
}

@end
