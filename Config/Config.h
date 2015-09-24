//
//  Config.h
//  YouYu
//
//  Created by bin.deng on 14-12-27.
//  Copyright (c) 2014年 DBCompany. All rights reserved.
//

#import "RequestConfig.h"

// 测试版本和发布版本宏定义
#ifdef Release_Version
// 发布版本宏
#else
// 测试版本宏
#endif

#import "AppDelegate.h"

#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] \n" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#   define DLogRect(rect)  DLog(@"%s x=%f, y=%f, w=%f, h=%f", #rect, rect.origin.x, rect.origin.y,rect.size.width, rect.size.height)
#   define DLogPoint(pt) DLog(@"%s x=%f, y=%f", #pt, pt.x, pt.y)
#   define DLogSize(size) DLog(@"%s w=%f, h=%f", #size, size.width, size.height)
#   define ALog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#   else
#   define DLog(...)
#   define DLogRect(rect)
#   define DLogPoint(pt)
#   define DLogSize(size)
#   define ALog(...)
#   endif

#pragma mark - 颜色相关

#define UIColorFromRGB(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define UIColorFromRGBValue(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define KAppDelegate ((AppDelegate *)([UIApplication sharedApplication].delegate))

#pragma mark - 硬件尺寸

// 判断各个尺寸屏幕
#define IS_SCREEN_5_5_INCH	([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_SCREEN_4_7_INCH	([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_SCREEN_4_INCH	([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_SCREEN_35_INCH	([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)


// 屏幕高度
#define ScreenHeight ([[UIScreen mainScreen] bounds].size.height)
// 屏幕宽度
#define ScreenWidth ([[UIScreen mainScreen] bounds].size.width)
// 可用区域的高度（IOS7以下StateBar可用）
#define ViewHeihgt (iOS7Later?ScreenHeight:(ScreenHeight-20.0))
// 可用区域的宽度
#define ViewWidth  ScreenWidth
// iPhone5比4高出的高度
#define iPhone5MoreHeight 88.0
// 是否IOS7以后的版本
#define IOSVersion                        [[[UIDevice currentDevice] systemVersion] floatValue]
#define iOS7Later                         (IOSVersion >= 7.0)
#define iOS8Later                         (IOSVersion >= 8.0)
// 获取版本号
#define CurVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
// 判断是不是Pad YES NO
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
// weakSelf
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#pragma mark - 本地plist文件信息
//沙盒路径
#define DocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0]
#define UserDefaults [NSUserDefaults standardUserDefaults]
#define kSessionId            @"SessionId"
#define kName                 @"Name"
#define kGrade                @"Grade"
#define kTel                  @"Tel"
#define kAddress              @"Address"
#define kHeadpic              @"headpic"
#define kProvinceId           @"provinceId"
#define kCityId               @"cityId"
#define kAreaId               @"areaId"
#define kAllowNotification    @"allowNotification"


#pragma mark - TabBar 相关

#define TabbarHeight 46.0
#define TabbarWidth ScreenWidth


#pragma mark - 各个AlertView的Tag记录

static NSString *ServiceTelShowStr = @"400-665-1266";

typedef enum SFFCAlertViewTag {
    SFFCAlertViewTagDebugVersion             =  1001    ,   // 提示测试版本
    SFFCAlertViewTagMainCallPhone            =  1002    ,   // 首页打电话提示
    SFFCAlertViewTagOrderListCallPhone       =  1003    ,   // 订单列表打电话提示
    SFFCAlertViewTagOrderDetailsCallPhone    =  1004    ,   // 订单详情打电话提示
    SFFCAlertViewTagUserInfoCallPhone        =  1005    ,   // 用户信息打电话提示
    SFFCAlertViewTagCalendarCallPhone        =  1006    ,   // 日程列表打电话提示
    SFFCAlertViewTagUserInfoUpdate           =  1007    ,   // 版本升级提示
    SFFCAlertViewTagCallCustomerPhone        =  1008    ,   // 拨打客户电话
    SFFCAlertViewTagHTTPResultMessage        =  1009        // 带请求Message的提示

}SFFCAlertViewTag;


#define APPIDENTIFIERSTRING @"DW43A4J8Z3.com.yekmob.chef"
#define OTHERAPPIDENTIFIERSTRING @"LKNCQPXA44.com.xiaoma.fanfan"

#pragma mark iphone6判断
#ifndef DEVICE_IS_IPHONE6
#define DEVICE_IS_IPHONE6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size): NO)
#endif

#pragma mark iphone6 Plus判断
#ifndef DEVICE_IS_IPHONE6PLUS
#define DEVICE_IS_IPHONE6PLUS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size): NO)
#endif


#define GET_UDID [[NSUserDefaults standardUserDefaults] objectForKey:@"UDID"]


//统计上传
#define UM_EVENT_ID_orderDetailSubmitButtonClick        @"orderDetailSubmitButtonClick"       // 上传按钮点击事件次数
#define UM_EVENT_ID_orderDetailSubmitImagesSuccess      @"orderDetailSubmitImagesSuccess"     // 上传成功次数
#define UM_EVENT_ID_orderDetailSubmitImagesFailure      @"orderDetailSubmitImagesFailure"     //上传失败次数





