//
//  WMCustomTabBar.h
//  DHCar
//
//  Created by David on 16/5/30.
//  Copyright © 2016年 WM. All rights reserved.
//

#import <UIKit/UIKit.h>


@class WMCustomTabBar;

@protocol WMCustomTabBarDelegate <NSObject>

- (void)tabBar:(WMCustomTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface WMCustomTabBar : UIView

- (void)addTabBarItem:(UITabBarItem *)item;

@property (nonatomic, weak) id<WMCustomTabBarDelegate> delegate;

@end
