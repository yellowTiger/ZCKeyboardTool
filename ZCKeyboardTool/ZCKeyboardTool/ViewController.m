//
//  ViewController.m
//  ZCKeyboardTool
//
//  Created by Huang Zhicong on 2018/5/5.
//  Copyright © 2018年 hzc. All rights reserved.
//

#import "ViewController.h"
#import "ZCKeyboardTool.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)btnClick:(id)sender {
    [[ZCKeyboardTool shareTools] showInputTextViewKeyboard:^(NSString *txt) {
        NSLog(@"发送");
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
