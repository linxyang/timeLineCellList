//
//  NSString+Extensions.h
//  SP2P
//
//  Created by xuym on 13-8-5.
//  Copyright (c) 2013年 sls001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (MyExtensions)

- (CGSize)getUISize:(UIFont*)font limitWidth:(CGFloat)width;
/*
 * 将指定text转换成md5
 */
- (NSString *)md5;

/*
 * 计算指定text所需要的高度
 */
- (CGFloat)contentHeightWithFontSize:(float)fontSize maxWidth:(CGFloat)maxWidth;
- (CGFloat)contentHeightWithFontSize:(float)fontSize maxWidth:(CGFloat)maxWidth lineSpacing:(CGFloat)lineSpacing;

- (CGFloat)contentHeightWithBoldFontSize:(float)fontSize maxWidth:(CGFloat)maxWidth;

/*
 * 计算指定text所需要的宽度
 */
- (CGFloat)contentWidthWithFontSize:(float)fontSize maxHeight:(CGFloat) maxHeight;

- (NSDictionary *)dictionary;

- (NSData *) strToHexData;
@end
