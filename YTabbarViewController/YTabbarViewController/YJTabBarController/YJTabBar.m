//
//  YJTabBar.m
//  YTabbarViewController
//
//  Created by 杨世昌 on 15/1/13.
//  Copyright (c) 2015年 杨世昌. All rights reserved.
//

#import "YJTabBar.h"

@implementation YJTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        imageView.backgroundColor = [UIColor clearColor];
        imageView.layer.shadowOffset = CGSizeMake(0, 2);
        imageView.layer.shadowOpacity = 0.3;
        imageView.userInteractionEnabled = YES;
        [self addSubview:imageView];
        self.backgroundImageView = imageView;
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)createItemsWithTitles:(NSArray *)titles normalImages:(NSArray *)normalImages highlightImages:(NSArray *)highlightImages
{
    float y = self.barItemTopEdgeInset,height = self.frame.size.height;
    int width = self.frame.size.width/(normalImages.count);
    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < titles.count; ++i) {
        UIImage *normalImg = [UIImage imageNamed:normalImages[i]];
        UIImage *highlightImg = [UIImage imageNamed:highlightImages[i]];
        
        CGRect frame = CGRectMake(width*i, y, width, height);
        YJTabBarItem *item = [[YJTabBarItem alloc] initWithFrame:frame];
        item.tag = i;
        item.normalImage = normalImg;
        item.highlightImage = highlightImg;
        item.title = titles[i];
        item.titleNormalColor = self.barItemNormalColor;
        item.titleHighlightColor = self.barItemHightlightColor;
        
        if (i == 0) {
            item.selected = YES;
        }else {
            item.selected = NO;
        }
        [self addSubview:item];
        [arr addObject:item];
    }
    _customTabBarItems = arr;
}

- (void)setupSubviews
{
    [self createItemsWithTitles:self.titles normalImages:self.normalImages highlightImages:self.highlightImages];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

-(void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[YJTabBarItem class]]) {
            YJTabBarItem *item = (YJTabBarItem *)view;
            if (item.tag == _selectedIndex) {
                //                CustomTabBarItem *item = (CustomTabBarItem *)[self viewWithTag:selectedIndex];
                item.selected = YES;
            }else {
                item.selected = NO;
            }
        }
    }
}

- (YJTabBarItem *)getSelectedTabBarItem {
    return _customTabBarItems[_selectedIndex];
}


@end
