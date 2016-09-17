//
//  BeautyDailyModel.h
//  Timeline
//
//  Created by Yanglixia on 16/9/17.
//  Copyright © 2016年 Ezreal. All rights reserved.
//  美肤日记

#import <UIKit/UIKit.h>

@interface BeautyDailyModel : NSObject

/** 日期 */
@property (nonatomic, strong) NSString *time;
/** 内容 */
@property (nonatomic, strong) NSString *content;
/** 图片地址 */
@property (nonatomic, strong) NSString *imgUrl;
/** 是滞是最后一个cell */
@property (nonatomic, assign) BOOL isLast;
/** cell高度 */
@property (nonatomic, assign, readonly) CGFloat cellHeight;

@end
