//
//  SHETabbarViewController.m
//  SHETabbarDemo
//
//  Created by 天津一侨科技有限公司 on 2018/4/4.
//  Copyright © 2018年 xxx. All rights reserved.
//

#import "SHETabbarViewController.h"
#import "SHETabbar.h"
#import "FiveViewController.h"

@interface SHETabbarViewController ()

@end

@implementation SHETabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 自定义TabBar
    SHETabbar *tabBar = [[SHETabbar alloc] init];
    tabBar.composeButtonClick = ^{
        NSLog(@"点击按钮,弹出菜单");
        
       
    };
     [self setValue:tabBar forKey:@"tabBar"];
    
    [self addChildViewController];
    
    self.tabBar.tintColor=[UIColor orangeColor];
    [self.tabBar setBackgroundImage:[self createImageWithColor:[UIColor whiteColor]]];
    
    
}
- (void)addChildViewController {
    [self addChildViewControllerWithClassName:@"OneViewController" title:@"首页" imageName:@"tabbar_profile"];
    [self addChildViewControllerWithClassName:@"TwoViewController" title:@"消息" imageName:@"tabbar_profile"];
    [self addChildViewControllerWithClassName:@"ThreeViewController" title:@"发现" imageName:@"tabbar_profile"];
    [self addChildViewControllerWithClassName:@"FourViewController" title:@"我" imageName:@"tabbar_profile"];
}
- (void)addChildViewControllerWithClassName:(NSString *)className title:(NSString *)title imageName:(NSString *)imageName {
    Class Clz = NSClassFromString(className);
    UIViewController *vController = [[Clz alloc] init];
    vController.title = title;
    vController.tabBarItem.image = [UIImage imageNamed:imageName];
    vController.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected", imageName]];


    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:vController];
    
    [self addChildViewController:navController];
}
-(UIImage*) createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
