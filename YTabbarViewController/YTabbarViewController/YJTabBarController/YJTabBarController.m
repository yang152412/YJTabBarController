//
//  YJTabBarController.m
//  YTabbarViewController
//
//  Created by 杨世昌 on 15/1/13.
//  Copyright (c) 2015年 杨世昌. All rights reserved.
//

#import "YJTabBarController.h"

@interface YJTabBarController ()

@property (nonatomic, assign) BOOL isControllerFirstVisible;

@end

@implementation YJTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        if (!self.customTabBar) {
            YJTabBar *tabBar = [[YJTabBar alloc] initWithFrame:self.tabBar.bounds];
            tabBar.backgroundColor = [UIColor clearColor];
            self.customTabBar = tabBar;
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.isControllerFirstVisible = NO;
    // 去掉 ios5、6 上选中 的 镜面高亮
    [self.tabBar setSelectionIndicatorImage:[[UIImage alloc] init]];
    
    if (!self.customTabBar) {
        YJTabBar *tabBar = [[YJTabBar alloc] initWithFrame:self.tabBar.bounds];
        tabBar.backgroundColor = [UIColor clearColor];
        self.customTabBar = tabBar;
    }
    
    [self.tabBar addSubview:self.customTabBar];
    [self.tabBar bringSubviewToFront:self.customTabBar];
    self.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (!self.isControllerFirstVisible) {
        self.isControllerFirstVisible = YES;
        [self setupCustomTabBar];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)setupCustomTabBar
{
    [self.customTabBar setupSubviews];
}

- (void)setBadgeValue:(NSString *)badgeValue forItemAtIndex:(NSInteger)index
{
    if (index < self.customTabBar.customTabBarItems.count) {
        YJTabBarItem *item = self.customTabBar.customTabBarItems[index];
        item.badgeValue = badgeValue;
    }
}

- (void)selectViewControllerAtIndex:(NSInteger )index
{
    if (index < self.viewControllers.count) {
        self.selectedIndex =  index;
        self.customTabBar.selectedIndex = index;
    }
}

#pragma mark - UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    NSInteger index = [tabBarController.viewControllers indexOfObject:viewController];
    self.customTabBar.selectedIndex = index;
    return YES;
}


@end
