//
//  BeautyDailyModel.m
//  Timeline
//
//  Created by Yanglixia on 16/9/17.
//  Copyright © 2016年 Ezreal. All rights reserved.
//

#import "BeautyDailyModel.h"
#import "NSString+Extensions.h"
#define kMSScreenWith CGRectGetWidth([UIScreen mainScreen].applicationFrame)
@implementation BeautyDailyModel
@synthesize cellHeight = _cellHeight;
- (CGFloat)cellHeight
{
    if (!_cellHeight) {
        CGFloat height = 0;
        height += 0; // 离顶部距离
        height += 12; // 日期高度
        height += 8;  // 头像下面控件与头像距离
        if (self.content == nil||[self.content isEqualToString:@""]) {
            self.content = @"哇~~，新新好美，而且我也觉得PSA好用哦！么么哒";
        }
        // 判断图片张数
        if ([self.imgUrl isEqualToString:@""] ||self.imgUrl == nil) { // 没有图片
            CGFloat contentH = [self.content contentHeightWithFontSize:12 maxWidth:(kMSScreenWith - 33) lineSpacing:4];//
            height += contentH;// 文本内容高
            height += 14; // 与文本间隔
            _cellHeight = height;
            return _cellHeight;
            
        } else {
            CGFloat contentH = [self.content contentHeightWithFontSize:12 maxWidth:(kMSScreenWith - 28) lineSpacing:8];//14+26+4+内容宽+14=屏宽
            height += contentH;// 文本内容高
            height += 10;
            height += 100;
            height += 14; // 与文本间隔
            _cellHeight = height;
            return _cellHeight;
        }
    }
    return _cellHeight;
}

@end
