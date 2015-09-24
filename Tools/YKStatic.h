//
//  YKStatic.h
//  CookMeal
//
//  Created by yek on 15/4/21.
//  Copyright (c) 2015年 上海耶客网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

#import "Config.h"
//存储UDID相关头文件
#import "KeychainItemWrapper.h"
#import <Security/Security.h>
#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>

@interface YKStatic : NSObject

/** 接口的基本 */
+(void) setApiurlBase:(NSString*) str;
+(NSString*) apiurlBase;

#pragma mark 判断沙盒中文件是否存在
+ (BOOL)isFileExist:(NSString *)fileName;
#pragma mark  邮箱合法验证
+ (BOOL)isValidateEmail:(NSString *)email;
#pragma mark  手机合法验证
+ (BOOL)isValidateMobile:(NSString *)mobile;

#pragma mark 将颜色值“#ffffff” 转换成 RGB
+ (UIColor *)colorConvertToRGB:(NSString *)colorString;

//#pragma mark 获取融云客服ID
//+(NSString*)getKeFuId;

#pragma mark -
#pragma mark 字符串转换为时间
+ (NSDate *)dateFromString:(NSString *)dateString withFormat:(NSString *)formatString;
#pragma mark 时间转换为字符串
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)formatString;

#pragma mark -
#pragma mark 获取资源图片
+(UIImage *)imagJPGPathName:(NSString *)name;
+(UIImage *)imagPNGPathName:(NSString *)name;

#pragma mark -
#pragma mark 设置“星星级别”方法
+ (void)setStarImageView:(UIView *)fatherView withStarScore:(CGFloat)grade;

#pragma mark -
#pragma mark 设置文字的富文本（字体，颜色）
+ (NSAttributedString *)setTextAttributed:(NSString *)wordString withAttributedDictionary:(NSDictionary *)attributedDic withChangeTextRange:(NSRange)textRange;

+ (NSString*)UDID;

#pragma mark 根据自定义的大小等比例压缩图片
+ (UIImage *)imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size;
@end
