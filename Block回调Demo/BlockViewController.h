//
//  BlockViewController.h
//  Block回调Demo
//
//  Created by 宗炳林 on 2018/4/18.
//  Copyright © 2018年 宗炳林. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  TestBlockName:  回调block名字
 *
 *  blockArray,blockString: 回调回来的数据
 *
 */
typedef void(^TestBlockName)(NSArray *blockArray,NSString *blockString);

@interface BlockViewController : UIViewController

@property (nonatomic,copy)TestBlockName testBlcok;  // block只是VC的一个属性

@end
