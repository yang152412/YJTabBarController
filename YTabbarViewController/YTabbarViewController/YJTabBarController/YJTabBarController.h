//
//  YJTabBarController.h
//  YTabbarViewController
//
//  Created by 杨世昌 on 15/1/13.
//  Copyright (c) 2015年 杨世昌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YJTabBar.h"

@interface YJTabBarController : UITabBarController<UITabBarControllerDelegate>

@property (nonatomic, strong) YJTabBar *customTabBar;

- (void)setBadgeValue:(NSString *)badgeValue forItemAtIndex:(NSInteger )index;

// 选择到第几个controller，直接设置 tabbarViewController.selectedIndex 可以选择controller，但是下面的图片更新不到，所以用下面的方法
- (void)selectViewControllerAtIndex:(NSInteger )index;

@end
