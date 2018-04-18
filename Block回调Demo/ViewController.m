//
//  ViewController.m
//  Block回调Demo
//
//  Created by 宗炳林 on 2018/4/18.
//  Copyright © 2018年 宗炳林. All rights reserved.
//

#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height

#import "ViewController.h"
#import "BlockViewController.h"

@interface ViewController ()

@property (nonatomic,strong)UIButton *blockBtn;
@property (nonatomic,strong)UITextField *blockTf;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self initView];
}

#pragma mark - 视图定制
- (void)initView
{
    self.title = @"Block回调";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _blockBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, (SCREEN_WIDTH - 40), 45)];
    _blockBtn.backgroundColor = [UIColor blackColor];
    [_blockBtn setTitle:@"Blcok回调" forState:UIControlStateNormal];
    [_blockBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _blockBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [_blockBtn addTarget:self action:@selector(blockClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_blockBtn];
    
    
    
    _blockTf = [[UITextField alloc] initWithFrame:CGRectMake( 20, CGRectGetMaxY(_blockBtn.frame) + 40, (SCREEN_WIDTH - 40), 50)];
    _blockTf.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_blockTf];
    
    
}

#pragma mark - 事件处理
- (void)blockClick
{
    BlockViewController *blockVc = [[BlockViewController alloc] init];
    blockVc.testBlcok = ^(NSArray *blockArray, NSString *blockString) {
      
        NSLog(@"数组 ========= %@ \n 字符串 ======== %@",blockArray,blockString);
        _blockTf.text = blockString;
        
    };
    [self.navigationController pushViewController:blockVc animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}


@end
