//
//  WMCustomTabBar.m
//  DHCar
//
//  Created by David on 16/5/30.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "WMCustomTabBar.h"
#import "WMTarButton.h"

@interface WMCustomTabBar()

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) WMTarButton *selectedButton;

@end


@implementation WMCustomTabBar

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)addTabBarItem:(UITabBarItem *)item
{
    WMTarButton *button = [[WMTarButton alloc] init];
    [self addSubview:button];
    [self.dataArray addObject:button];
    
    button.item = item;
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    if (self.dataArray.count == 1) {
        [self onClick:button];
    }
}

- (void)onClick:(WMTarButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:self.selectedButton.tag to:btn.tag];
    }
    self.selectedButton.selected = NO;
    btn.selected = YES;
    self.selectedButton = btn;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width;
    CGFloat h =  self.bounds.size.height;
    
    CGFloat btnY = 0;
    CGFloat btnW = w/self.subviews.count;
    CGFloat btnH =  h;
    
    for (NSInteger i = 0; i < _dataArray.count; i++) {
        WMTarButton *btn = _dataArray[i];
        // 2.设置按钮的frame
        CGFloat btnX = i * btnW;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        btn.tag = i;
    }
}


@end
