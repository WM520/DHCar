//
//  MainTabBarController.m
//  DHCar
//
//  Created by David on 16/5/30.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "MainTabBarController.h"
#import "WMTarButton.h"
#import "WMCustomTabBar.h"
#import "MainNavController.h"
#import "WMMeViewController.h"
#import "WMHomeViewController.h"
#import "WMFindViewController.h"

@interface MainTabBarController ()<WMCustomTabBarDelegate>
@property (nonatomic, strong) WMCustomTabBar *customBar;
@end

@implementation MainTabBarController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    for (UIView *childsView in self.tabBar.subviews) {
        if ([childsView isKindOfClass:[UIControl class]]) {
            [childsView removeFromSuperview];
        }
    }

}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTabBar];
    [self setupAllClildViews];
}

- (void)setupTabBar
{
    WMCustomTabBar *tabBar = [[WMCustomTabBar alloc] init];
    tabBar.delegate = self;
    tabBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:tabBar];
    self.customBar = tabBar;
}

- (void)setupAllClildViews
{
    // 1.首页
    WMHomeViewController *home = [[WMHomeViewController alloc]init];
    [self setupChildViewController:home title:@"首页" imageName:@"首页" selectedImageName:@"首页bar"];
    // 2.搭配
    WMFindViewController *only = [[WMFindViewController alloc] init];
    [self setupChildViewController:only title:@"发现" imageName:@"发现" selectedImageName:@"发现bar"];
    // 3.发现
    WMMeViewController *cls = [[WMMeViewController alloc] init];
    [self setupChildViewController:cls title:@"我的" imageName:@"我的" selectedImageName:@"我的bar"];
}


- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 1.设置控制器的属性
    childVc.title = title;
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    childVc.tabBarItem.selectedImage = selectedImage;
    // 2.包装一个导航控制器
    MainNavController *nav = [[MainNavController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    // 3.添加tabbar内部的按钮
    [self.customBar addTabBarItem:childVc.tabBarItem];
}


#pragma mark -WMCustomTabBarDelegate
- (void)tabBar:(WMCustomTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
