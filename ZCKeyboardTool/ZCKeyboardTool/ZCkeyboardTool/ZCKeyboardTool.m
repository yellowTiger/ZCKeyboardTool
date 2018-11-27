//
//  ZCKeyboardTool.m
//  xxoogo
//
//  Created by Huang Zhicong on 2018/5/4.
//  Copyright © 2018年 xinchidao. All rights reserved.
//

#import "ZCKeyboardTool.h"

#import "UIView+UIView_ZCExtension.h"
//提供一个static修饰的全局变量，强引用着已经实例化的单例对象实例
static ZCKeyboardTool *_instance;
@interface ZCKeyboardTool()
//@property(nonatomic,strong)UIView * blankV;
//@property(nonatomic,strong) UITextView* textV;
@property(nonatomic,copy)void (^zcBlock)(NSString*);

@property (nonatomic, strong) UIView* coverV;
@property (nonatomic, strong) UITextView* txtF;
@end
@implementation ZCKeyboardTool


//类方法，返回一个单例对象
+(instancetype)shareTools
{
    //注意：这里建议使用self,而不是直接使用类名Tools（考虑继承）
    return [[self alloc]init];
}

//保证永远只分配一次存储空间
+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    //使用GCD中的一次性代码
    //    static dispatch_once_t onceToken;
    //    dispatch_once(&onceToken, ^{
    //        _instance = [super allocWithZone:zone];
    //    });
    //使用加锁的方式，保证只分配一次存储空间
    @synchronized(self) {
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
        }
    }
    return _instance;
}
/*
 1. mutableCopy 创建一个新的可变对象，并初始化为原对象的值，新对象的引用计数为 1；
 2. copy 返回一个不可变对象。分两种情况：（1）若原对象是不可变对象，那么返回原对象，并将其引用计数加 1 ；（2）若原对象是可变对象，那么创建一个新的不可变对象，并初始化为原对象的值，新对象的引用计数为 1。
 */
//让代码更加的严谨
-(nonnull id)copyWithZone:(nullable NSZone *)zone
{
    //    return [[self class] allocWithZone:zone];
    return _instance;
}
-(nonnull id)mutableCopyWithZone:(nullable NSZone *)zone
{
    return _instance;
}

-(void)showInputTextViewKeyboard:(UIView*)superV txtBlock:(void(^)(NSString* txt))block{
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    self.coverV=[[UIView alloc]init];
    [_coverV addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeClick)]];
    [superV addSubview:_coverV];
    _coverV.frame=CGRectMake(0, 0, screenWidth, screenHeight);
    self.txtF=[[UITextView alloc]init];
    _txtF.hidden=YES;
    //        txtF.userInteractionEnabled=NO;
    [superV addSubview:_txtF];
    _txtF.frame=CGRectMake(0, screenHeight, 1, 1);
    self.commentsV=[[ZCCommentView alloc]init];
    self.txtF.inputAccessoryView=self.commentsV;
    self.commentsV.frame=CGRectMake(0, 0, screenWidth, 40);
    
    [self.txtF becomeFirstResponder];
    [self.commentsV.textV becomeFirstResponder];
    self.zcBlock=block;
    [self.commentsV.btn addTarget:self action:@selector(sendClick:) forControlEvents:UIControlEventTouchUpInside];
//        [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeClick)]];
//    if (_commentsV==nil) {
//         self.commentsV=[[ZCCommentView alloc] initWithFrame:CGRectMake(0.0, 0, screenWidth, 40.0)];
//
//    }
//    [self.commentsV.btn addTarget:self action:@selector(sendClick:) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:self.commentsV];
//
//    self.zcBlock=block;
//    self.frame=CGRectMake(0, 0, screenWidth, screenHeight);
//    [[[UIApplication sharedApplication] keyWindow]  addSubview:self];
//    [self.commentsV.textV becomeFirstResponder];
}

-(void)sendClick:(UIButton*)btn{
    [self.commentsV.textV endEditing:YES];
    self.zcBlock(self.commentsV.textV.text);
    [self closeClick];
}

//退出键盘
-(void)closeClick{
    [self.commentsV.textV resignFirstResponder];
    [self.txtF resignFirstResponder];
    [self.coverV removeFromSuperview];
    if (self.closeBlock!=nil) {
        self.closeBlock();
    }
}

@end
