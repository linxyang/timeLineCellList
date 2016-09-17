//
//  NSString+Extensions.m
//  SP2P
//
//  Created by xuym on 13-8-5.
//  Copyright (c) 2013年 sls001. All rights reserved.
//

#import "NSString+Extensions.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (MyExtensions)


- (CGSize)getUISize:(UIFont*)font limitWidth:(CGFloat)width
{
    //设置字体
    CGSize size = CGSizeMake(width, 20000.0f);//注：这个宽：300 是你要显示的宽度既固定的宽度，高度可以依照自己的需求而定
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    size =[self boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    return size;
}

- (NSString *) md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result ); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (CGFloat)contentHeightWithFontSize:(float)fontSize maxWidth:(CGFloat)maxWidth
{
    UIFont *font = [UIFont systemFontOfSize:fontSize];// 一定要跟label的显示字体大小一致
    //设置字体
    CGSize size = CGSizeMake(maxWidth, NSIntegerMax);//注：这个宽：300 是你要显示的宽度既固定的宽度，高度可以依照自己的需求而定
    
    //        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    //        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    //        , NSParagraphStyleAttributeName:paragraphStyle.copy
    NSDictionary *attributes = @{NSFontAttributeName:font};
    size = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    size.height = ceilf(size.height);
    size.width = ceilf(size.width);
    
    return size.height;
}

- (CGFloat)contentHeightWithFontSize:(float)fontSize maxWidth:(CGFloat)maxWidth lineSpacing:(CGFloat)lineSpacing
{
    UIFont *font = [UIFont systemFontOfSize:fontSize];// 一定要跟label的显示字体大小一致
    //设置字体
    CGSize size = CGSizeMake(maxWidth, NSIntegerMax);//注：这个宽：300 是你要显示的宽度既固定的宽度，高度可以依照自己的需求而定
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:lineSpacing];//调整行间距
    NSDictionary *attributes = @{NSFontAttributeName:font,NSParagraphStyleAttributeName:paragraphStyle};
    size = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    size.height = ceilf(size.height);
    size.width = ceilf(size.width);
    return size.height;
}

- (CGFloat)contentHeightWithBoldFontSize:(float)fontSize maxWidth:(CGFloat)maxWidth
{
    UIFont *font = [UIFont systemFontOfSize:fontSize];// 一定要跟label的显示字体大小一致
    //设置字体
    CGSize size = CGSizeMake(maxWidth, NSIntegerMax);//注：这个宽：300 是你要显示的宽度既固定的宽度，高度可以依照自己的需求而定
    
    //        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    //        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    //        , NSParagraphStyleAttributeName:paragraphStyle.copy
    NSDictionary *attributes = @{NSFontAttributeName:font};
    size = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    size.height = ceilf(size.height);
    size.width = ceilf(size.width);
    
    return size.height;
}

- (CGFloat)contentWidthWithFontSize:(float)fontSize maxHeight:(CGFloat) maxHeight

{
    UIFont *font = [UIFont systemFontOfSize:fontSize];// 一定要跟label的显示字体大小一致
    //设置字体
    CGSize size = CGSizeMake(NSIntegerMax, maxHeight);//注：这个maxHeight： 是你要显示的高度既固定的高度，高度可以依照自己的需求而定
    
    //        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    //        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    //        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    NSDictionary *attributes = @{NSFontAttributeName:font};
    size = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    size.height = ceilf(size.height);
    size.width = ceilf(size.width);
    
    return size.width;
}

- (NSDictionary *)dictionary
{
    if (self == nil) {
        return nil;
    }
    
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        return nil;
    }
    return dic;
}

- (NSData *) strToHexData
{
    NSUInteger len = [self length] / 2;    // Target length
    unsigned char *buf = malloc(len);
    unsigned char *whole_byte = buf;
    char byte_chars[3] = {'\0','\0','\0'};
    
    int i;
    for (i=0; i < [self length] / 2; i++) {
        byte_chars[0] = [self characterAtIndex:i*2];
        byte_chars[1] = [self characterAtIndex:i*2+1];
        *whole_byte = strtol(byte_chars, NULL, 16);
        whole_byte++;
    }
    
    NSData *data = [NSData dataWithBytes:buf length:len];
    free( buf );
    return data;
}

@end
