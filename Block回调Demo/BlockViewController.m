//
//  BlockViewController.m
//  Block回调Demo
//
//  Created by 宗炳林 on 2018/4/18.
//  Copyright © 2018年 宗炳林. All rights reserved.
//

#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height

#import "BlockViewController.h"

@interface BlockViewController ()

@property (nonatomic,strong)UITextField *dataTf;
@property (nonatomic,strong)UIButton *sureBtn;


@property (nonatomic,copy)NSArray *arrayData;
@property (nonatomic,copy)NSString *stringData;

@end

@implementation BlockViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self initData];
    
    [self initView];
}

#pragma mark - 初始化数据
- (void)initData
{
    _arrayData = @[@"block0",@"block1",@"block2"];
    _stringData = @"测试一下block";
}

#pragma mark - 初始化视图
- (void)initView
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    _dataTf = [[UITextField alloc] initWithFrame:CGRectMake( 20, 100, (SCREEN_WIDTH - 40), 50)];
    _dataTf.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_dataTf];
    
    
    _sureBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_dataTf.frame) + 40, (SCREEN_WIDTH - 40), 45)];
    _sureBtn.backgroundColor = [UIColor blackColor];
    [_sureBtn setTitle:@"确 定" forState:UIControlStateNormal];
    [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _sureBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [_sureBtn addTarget:self action:@selector(sureClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_sureBtn];

    
}

#pragma mark - 确定按钮
- (void)sureClick
{
    if (_dataTf.text.length == 0)
    {
        UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入内容" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"👌" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertVc addAction:sureAction];
        [self presentViewController:alertVc animated:YES completion:nil];
    }
    else
    {
        if (self.testBlcok)
        {
            self.testBlcok(@[@"1",@"2",@"3"], _dataTf.text);
        }
        [self.navigationController popViewControllerAnimated:YES];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}



@end
