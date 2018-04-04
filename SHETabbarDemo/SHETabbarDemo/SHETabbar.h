//
//  SHETabbar.h
//  SHETabbarDemo
//
//  Created by 天津一侨科技有限公司 on 2018/4/4.
//  Copyright © 2018年 xxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHETabbar : UITabBar
/// 中间凸起的按钮
@property (nonatomic, strong) UIButton *centerBtn;
@property (copy, nonatomic) void (^composeButtonClick)();
@end
