//
//  AppDelegate.m
//  YTabbarViewController
//
//  Created by 杨世昌 on 15/1/13.
//  Copyright (c) 2015年 杨世昌. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "YJTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    NSMutableArray *controllers = [NSMutableArray array];
    NSArray *titles = @[@"首页",@"地图",@"照片",@"我的"];
    
    NSMutableArray *normalImages = [NSMutableArray array];
    NSMutableArray *hightlightImages = [NSMutableArray array];
    for (int i = 0; i < titles.count; i++) {
        ViewController *vc = [[ViewController alloc] init];
//        vc.title = @"tab bar";
//        vc.view.backgroundColor = [UIColor colorWithWhite:i/titles.count alpha:1.0];
        [controllers addObject:vc];
        
        NSString *normalImage = [NSString stringWithFormat:@"O2OMenu_%d",i+1];
        NSString *highlightImage = [NSString stringWithFormat:@"O2OMenu_%d_highlight",i+1];
        [normalImages addObject:normalImage];
        [hightlightImages addObject:highlightImage];
    }
    UIImage* image = [[UIImage imageNamed:@"tab_bg"] stretchableImageWithLeftCapWidth:0 topCapHeight:25];
    
    YJTabBarController *tabBarController = [[YJTabBarController alloc] init];
    tabBarController.customTabBar.backgroundImageView.image = image;
    tabBarController.customTabBar.titles = titles;
    tabBarController.customTabBar.normalImages = normalImages;
    tabBarController.customTabBar.highlightImages = hightlightImages;
    tabBarController.customTabBar.barItemTopEdgeInset = 4;
    [tabBarController setViewControllers:controllers animated:NO];
    
    tabBarController.title = @"My tabBarController";
    self.naviController = [[UINavigationController alloc] initWithRootViewController:tabBarController];
    
    self.window.rootViewController = self.naviController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
