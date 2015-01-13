//
//  YJTabBarItem.m
//  YTabbarViewController
//
//  Created by 杨世昌 on 15/1/13.
//  Copyright (c) 2015年 杨世昌. All rights reserved.
//

#import "YJTabBarItem.h"

@implementation YJTabBarItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.titleHighlightColor = [UIColor whiteColor];
        self.titleNormalColor = [UIColor grayColor];
        
        _itemImageView = [[UIImageView alloc] initWithFrame:frame];
        _itemImageView.backgroundColor = [UIColor clearColor];
        _itemImageView.userInteractionEnabled = YES;
        [self addSubview:_itemImageView];
        
        UIImage *img = [UIImage imageNamed:@"has_unread"];        // 暂时使用小图
        _badgeBg = [[UIImageView alloc] initWithImage:img];
        _badgeBg.frame = CGRectMake(frame.size.width/2 + 10, 5, img.size.width, img.size.height);
        _badgeBg.userInteractionEnabled = YES;
        [self addSubview:_badgeBg];
        
        _badgeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, img.size.width, img.size.height)];
        _badgeLabel.backgroundColor = [UIColor clearColor];
        _badgeLabel.textAlignment = NSTextAlignmentCenter;
        _badgeLabel.textColor = [UIColor whiteColor];
        _badgeLabel.font = [UIFont systemFontOfSize:10];
        [_badgeBg addSubview:_badgeLabel];
        
        _badgeBg.hidden = YES;
        
        CGRect rect = _badgeBg.frame;
        rect.origin.y += rect.size.height;
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 35, frame.size.width, 10)];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:10];
        [self addSubview:_titleLabel];
        _titleLabel.hidden = YES;
        
        self.selected = NO;
    }
    return self;
}

-(void)setNormalImage:(UIImage *)normalImage {
    if (_normalImage != normalImage) {
        _normalImage = nil;
        _normalImage = normalImage;
    }
    CGRect frame = CGRectMake((self.frame.size.width-_normalImage.size.width)/2, 0, _normalImage.size.width, _normalImage.size.height);
    _itemImageView.frame = frame;
}

-(void)setHighlightImage:(UIImage *)highlightImage {
    if (_highlightImage != highlightImage) {
        _highlightImage = nil;
        _highlightImage = highlightImage;
    }
    
    if (!_highlightImage) {
        CGRect frame = CGRectMake((self.frame.size.width-_highlightImage.size.width)/2, 0, _highlightImage.size.width, _highlightImage.size.height);
        _itemImageView.frame = frame;
    }
}

-(void)setSelected:(BOOL)selected {
    if (_selected != selected) {
        _selected = selected;
    }
    
    _itemImageView.image = _selected ? (self.highlightImage) : (self.normalImage);
    _titleLabel.textColor = _selected ? (self.titleHighlightColor) : (self.titleNormalColor);
}

- (void)setBadgeValue:(NSString *)badgeValue {
    if (_badgeValue != badgeValue) {
        _badgeValue = nil;
        _badgeValue = [badgeValue copy];
    }
    if (_badgeValue) {
        _badgeLabel.text = _badgeValue;
        _badgeBg.hidden = NO;
    } else {
        _badgeBg.hidden = YES;
    }
}

-(void)setTitle:(NSString *)title {
    if (_title != title) {
        _title = nil;
        _title = [title copy];
    }
    
    if (_title) {
        _titleLabel.text = _title;
        _titleLabel.hidden = NO;
    } else {
        _titleLabel.hidden = YES;
    }
}

@end
