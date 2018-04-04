//
//  SHETabbar.m
//  SHETabbarDemo
//
//  Created by 天津一侨科技有限公司 on 2018/4/4.
//  Copyright © 2018年 xxx. All rights reserved.
//

#import "SHETabbar.h"
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
@implementation SHETabbar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    self.backgroundColor=[UIColor whiteColor];
    [self addSubview:self.centerBtn];
}
//重写 getter 方法
- (UIButton *)centerBtn
{
    if (_centerBtn == nil) {
        _centerBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
        [_centerBtn setImage:[UIImage imageNamed:@"tabbar_compose_camera"] forState:UIControlStateNormal];
        [_centerBtn addTarget:self action:@selector(clickCenterBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _centerBtn;
}
//重写 layoutSubviews
- (void)layoutSubviews
{
    [super layoutSubviews];
    // 把 tabBarButton 取出来（把 tabBar 的 subViews 打印出来就明白了）
    NSMutableArray *tabBarButtonArray = [NSMutableArray array];
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButtonArray addObject:view];
        }
    }
    
    CGFloat barWidth = self.bounds.size.width;
    CGFloat barHeight = self.bounds.size.height;
    CGFloat centerBtnWidth = CGRectGetWidth(self.centerBtn.frame);
    CGFloat centerBtnHeight = CGRectGetHeight(self.centerBtn.frame);
    // 设置中间按钮的位置，居中，凸起一丢丢
    self.centerBtn.center = CGPointMake(barWidth / 2, barHeight - centerBtnHeight/2-(iPhoneX?41:5));
    // 重新布局其他 tabBarItem
    // 平均分配其他 tabBarItem 的宽度
    CGFloat barItemWidth = (barWidth - centerBtnWidth) / tabBarButtonArray.count;
    // 逐个布局 tabBarItem，修改 UITabBarButton 的 frame
    [tabBarButtonArray enumerateObjectsUsingBlock:^(UIView *  _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CGRect frame = view.frame;
        if (idx >= tabBarButtonArray.count / 2) {
            // 重新设置 x 坐标，如果排在中间按钮的右边需要加上中间按钮的宽度
            frame.origin.x = idx * barItemWidth + centerBtnWidth;
        } else {
            frame.origin.x = idx * barItemWidth;
        }
        // 重新设置宽度
        frame.size.width = barItemWidth;
        view.frame = frame;
    }];
    // 把中间按钮带到视图最前面
    [self bringSubviewToFront:self.centerBtn];
}
-(void)clickCenterBtn:(UIButton *)sender
{
    if (self.composeButtonClick) {
        self.composeButtonClick();
    }
}

@end
