//
//  UIButton+EdgeInsets.m
//  MyTabBarCustom
//
//  Created by shen on 2017/5/11.
//  Copyright © 2017年 shen. All rights reserved.
//

#import "UIButton+EdgeInsets.h"

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
#define _SINGLELINE_TEXTSIZE(text, font) [text length] > 0 ? [text \
sizeWithAttributes:@{NSFontAttributeName:font}] : CGSizeZero;
#else
#define _SINGLELINE_TEXTSIZE(text, font) [text length] > 0 ? [text sizeWithFont:font] : CGSizeZero;
#endif

@implementation UIButton (EdgeInsets)
- (void)setImagePositionWithType:(ImagePositionType)type spacing:(CGFloat)spacing {
    CGSize imageSize = [self imageForState:UIControlStateNormal].size;
    CGSize titleSize = _SINGLELINE_TEXTSIZE([self titleForState:UIControlStateNormal], self.titleLabel.font);
    
    switch (type) {
        case ImagePositionTypeLeft: {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
            break;
        }
        case ImagePositionTypeRight: {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, 0, imageSize.width + spacing);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width + spacing, 0, - titleSize.width);
            break;
        }
        case ImagePositionTypeTop: {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (imageSize.height + spacing), 0);
            self.imageEdgeInsets = UIEdgeInsetsMake(- (titleSize.height + spacing), 0, 0, - titleSize.width);
            break;
        }
        case ImagePositionTypeBottom: {
            self.titleEdgeInsets = UIEdgeInsetsMake(- (imageSize.height + spacing), - imageSize.width, 0, 0);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, - (titleSize.height + spacing), - titleSize.width);
            break;
        }
    }
}

- (void)setImageUpTitleDownWithSpacing:(CGFloat)spacing {
    [self setImagePositionWithType:ImagePositionTypeTop spacing:spacing];
}

- (void)setImageRightTitleLeftWithSpacing:(CGFloat)spacing {
    [self setImagePositionWithType:ImagePositionTypeRight spacing:spacing];
}

- (void)setEdgeInsetsWithType:(EdgeInsetsType)edgeInsetsType marginType:(MarginType)marginType margin:(CGFloat)margin {
    CGSize itemSize = CGSizeZero;
    if (edgeInsetsType == EdgeInsetsTypeTitle) {
        itemSize = _SINGLELINE_TEXTSIZE([self titleForState:UIControlStateNormal], self.titleLabel.font);
    } else {
        itemSize = [self imageForState:UIControlStateNormal].size;
    }
    
    CGFloat horizontalDelta = (CGRectGetWidth(self.frame) - itemSize.width) / 2.f - margin;
    CGFloat vertivalDelta = (CGRectGetHeight(self.frame) - itemSize.height) / 2.f - margin;
    
    NSInteger horizontalSignFlag = 1;
    NSInteger verticalSignFlag = 1;
    
    switch (marginType) {
        case MarginTypeTop: {
            horizontalSignFlag = 0;
            verticalSignFlag = - 1;
            break;
        }
        case MarginTypeBottom: {
            horizontalSignFlag = 0;
            verticalSignFlag = 1;
            break;
        }
        case MarginTypeLeft: {
            horizontalSignFlag = - 1;
            verticalSignFlag = 0;
            break;
        }
        case MarginTypeRight: {
            horizontalSignFlag = 1;
            verticalSignFlag = 0;
            break;
        }
        case MarginTypeTopLeft: {
            horizontalSignFlag = - 1;
            verticalSignFlag = - 1;
            break;
        }
        case MarginTypeTopRight: {
            horizontalSignFlag = 1;
            verticalSignFlag = - 1;
            break;
        }
        case MarginTypeBottomLeft: {
            horizontalSignFlag = - 1;
            verticalSignFlag = 1;
            break;
        }
        case MarginTypeBottomRight: {
            horizontalSignFlag = 1;
            verticalSignFlag = 1;
            break;
        }
    }
    
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(vertivalDelta * verticalSignFlag, horizontalDelta * horizontalSignFlag, - vertivalDelta * verticalSignFlag, - horizontalDelta * horizontalSignFlag);
    if (edgeInsetsType == EdgeInsetsTypeTitle) {
        self.titleEdgeInsets = edgeInsets;
    } else {
        self.imageEdgeInsets = edgeInsets;
    }
}


@end
