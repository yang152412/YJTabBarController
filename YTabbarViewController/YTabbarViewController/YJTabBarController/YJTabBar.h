//
//  YJTabBar.h
//  YTabbarViewController
//
//  Created by 杨世昌 on 15/1/13.
//  Copyright (c) 2015年 杨世昌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YJTabBarItem.h"

@interface YJTabBar : UIView

@property (nonatomic,assign) NSInteger selectedIndex;

@property (nonatomic,readonly) NSArray *customTabBarItems;

@property (nonatomic,readonly) YJTabBarItem *selectedTabBarItem;

// 背景
@property (nonatomic, strong) UIImageView *backgroundImageView;
// 文字
@property (nonatomic, strong) NSArray *titles;
// item 图片
@property (nonatomic, strong) NSArray *normalImages;
@property (nonatomic, strong) NSArray *highlightImages;

// 文字颜色
@property (nonatomic, strong) UIColor *barItemNormalColor;
@property (nonatomic, strong) UIColor *barItemHightlightColor;

// 上边距
@property (nonatomic,assign) CGFloat barItemTopEdgeInset;

//- (void)createItemsWithTitles:(NSArray *)titles normalImages:(NSArray *)normalImages highlightImages:(NSArray *)highlightImages;

- (void)setupSubviews;

@end
