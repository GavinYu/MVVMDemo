//
//  YKStatic.m
//  CookMeal
//
//  Created by yek on 15/4/21.
//  Copyright (c) 2015年 上海耶客网络科技有限公司. All rights reserved.
//

#import "YKStatic.h"

@implementation YKStatic

NSString* g_apiurlBase=nil;

+(NSString *)apiurlBase{
    if(g_apiurlBase==nil){
        g_apiurlBase=BaseUrl;
    }
    return g_apiurlBase;
}

+(void)setApiurlBase:(NSString *)str{
    g_apiurlBase=str;
}

#pragma mark 判断沙盒中文件是否存在
+ (BOOL) isFileExist:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSString *filePath = [path stringByAppendingPathComponent:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL result = [fileManager fileExistsAtPath:filePath];
    return result;
}

#pragma mark  邮箱合法验证
+(BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
#pragma mark  手机合法验证
+(BOOL) isValidateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

#pragma mark 将颜色值“#ffffff” 转换成 RGB
+ (UIColor *)colorConvertToRGB:(NSString *)colorString
{
    colorString = [colorString stringByReplacingCharactersInRange:[colorString rangeOfString:@"#"] withString:@"0x"];
    long colorLong = strtoul([colorString cStringUsingEncoding:NSUTF8StringEncoding], 0, 16);
    
    return [UIColor colorWithRed:((float)((colorLong & 0xFF0000) >> 16))/255.0 green:((float)((colorLong & 0xFF00) >> 8))/255.0 blue:((float)(colorLong & 0xFF))/255.0 alpha:1.0];
}

#pragma mark 获取融云客服ID
#pragma mark -
#pragma mark 字符串转换为时间
+ (NSDate *)dateFromString:(NSString *)dateString withFormat:(NSString *)formatString{
    
    //@"yyyy-MM-dd HH:mm:ss zzz"，zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    
    return destDate;
}

#pragma mark 时间转换为字符串
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)formatString{
    //@"yyyy-MM-dd HH:mm:ss zzz"，zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    return destDateString;
}

#pragma mark -
#pragma mark 获取资源图片
// 加载JPG图片
+(UIImage *)imagJPGPathName:(NSString *)name
{
    if (DEVICE_IS_IPHONE6PLUS) {
        [name stringByAppendingString:@"@3x"];
    } else {
        [name stringByAppendingString:@"@2x"];
    }
    
    //    name = [name stringByAppendingString:@"@2x"];
    return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:@"jpg"]];
}
// 加载PNG图片
+(UIImage *)imagPNGPathName:(NSString *)name
{
    if (DEVICE_IS_IPHONE6PLUS) {
        name = [name stringByAppendingString:@"@3x"];
    } else {
        name = [name stringByAppendingString:@"@2x"];
    }
    //    name = [name stringByAppendingString:@"@2x"];
    return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:@"png"]];
}

#pragma mark -
#pragma mark 设置“星星级别”方法
+ (void)setStarImageView:(UIView *)fatherView withStarScore:(CGFloat)grade{
    for (int i = 0; i < 5; i++) {
        UIImageView *imgv = [[UIImageView alloc] initWithFrame:CGRectMake(13*i, 0, 11.0, 11.0)];
        [fatherView addSubview:imgv];
        
        if (grade == 0) {
            imgv.image = [UIImage imageNamed:@"无色星星"];
        } else {
            if ((i+1)<=grade) {
                imgv.image = [UIImage imageNamed:@"有色星星"];
            }else{
                if (i+1-grade == 0.5){
                    imgv.image = [UIImage imageNamed:@"半个星星"];
                } else {
                    imgv.image = [UIImage imageNamed:@"无色星星"];
                }
            }
        }
    }
}

#pragma mark -
#pragma mark 设置文字的富文本（字体，颜色）
+ (NSAttributedString *)setTextAttributed:(NSString *)wordString withAttributedDictionary:(NSDictionary *)attributedDic withChangeTextRange:(NSRange)textRange{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:wordString];
    [attributedString setAttributes:attributedDic range:textRange];
    
    return attributedString;
}

+ (NSString*)UDID
{
    NSString *udid;
        NSString *sysVersion = [UIDevice currentDevice].systemVersion;
        CGFloat version = [sysVersion floatValue];
        
        if (version >= 7.0) {
            udid = [self UDID_iOS7];
        }
        else if (version >= 2.0) {
            udid = [self UDID_iOS6];
        }
    return udid;
}

/*
 * iOS 6.0
 * use wifi's mac address
 */
+ (NSString*)UDID_iOS6
{
    return [self getMacAddress];
}

/*
 * iOS 7.0
 * Starting from iOS 7, the system always returns the value 02:00:00:00:00:00
 * when you ask for the MAC address on any device.
 * use identifierForVendor + keyChain
 * make sure UDID consistency atfer app delete and reinstall
 */
+ (NSString*)UDID_iOS7
{
    return [[UIDevice currentDevice].identifierForVendor UUIDString];
}


#pragma mark -
#pragma mark Helper Method for Get Mac Address

// from http://stackoverflow.com/questions/677530/how-can-i-programmatically-get-the-mac-address-of-an-iphone
+ (NSString *)getMacAddress
{
    int                 mgmtInfoBase[6];
    char                *msgBuffer = NULL;
    size_t              length;
    unsigned char       macAddress[6];
    struct if_msghdr    *interfaceMsgStruct;
    struct sockaddr_dl  *socketStruct;
    NSString            *errorFlag = nil;
    
    // Setup the management Information Base (mib)
    mgmtInfoBase[0] = CTL_NET;        // Request network subsystem
    mgmtInfoBase[1] = AF_ROUTE;       // Routing table info
    mgmtInfoBase[2] = 0;
    mgmtInfoBase[3] = AF_LINK;        // Request link layer information
    mgmtInfoBase[4] = NET_RT_IFLIST;  // Request all configured interfaces
    
    // With all configured interfaces requested, get handle index
    if ((mgmtInfoBase[5] = if_nametoindex("en0")) == 0)
        errorFlag = @"if_nametoindex failure";
    else
    {
        // Get the size of the data available (store in len)
        if (sysctl(mgmtInfoBase, 6, NULL, &length, NULL, 0) < 0)
            errorFlag = @"sysctl mgmtInfoBase failure";
        else
        {
            // Alloc memory based on above call
            if ((msgBuffer = malloc(length)) == NULL)
                errorFlag = @"buffer allocation failure";
            else
            {
                // Get system information, store in buffer
                if (sysctl(mgmtInfoBase, 6, msgBuffer, &length, NULL, 0) < 0)
                    errorFlag = @"sysctl msgBuffer failure";
            }
        }
    }
    
    // Befor going any further...
    if (errorFlag != NULL)
    {
        NSLog(@"Error: %@", errorFlag);
        if (msgBuffer) {
            free(msgBuffer);
        }
        
        return errorFlag;
    }
    
    // Map msgbuffer to interface message structure
    interfaceMsgStruct = (struct if_msghdr *) msgBuffer;
    
    // Map to link-level socket structure
    socketStruct = (struct sockaddr_dl *) (interfaceMsgStruct + 1);
    
    // Copy link layer address data in socket structure to an array
    memcpy(&macAddress, socketStruct->sdl_data + socketStruct->sdl_nlen, 6);
    
    // Read from char array into a string object, into traditional Mac address format
    NSString *macAddressString = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
                                  macAddress[0], macAddress[1], macAddress[2],
                                  macAddress[3], macAddress[4], macAddress[5]];
    NSLog(@"Mac Address: %@", macAddressString);
    
    // Release the buffer memory
    free(msgBuffer);
    
    return macAddressString;
}

#pragma mark 根据自定义的大小等比例压缩图片
+ (UIImage *)imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size
{
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = size.width;
    CGFloat targetHeight = size.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    if(CGSizeEqualToSize(imageSize, size) == NO){
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if(widthFactor > heightFactor){
            scaleFactor = widthFactor;
        }
        else{
            scaleFactor = heightFactor;
        }
        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        if(widthFactor > heightFactor){
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }else if(widthFactor < heightFactor){
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    UIGraphicsBeginImageContext(size);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    [sourceImage drawInRect:thumbnailRect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    if(newImage == nil){
        NSLog(@"scale image fail");
    }
    
    UIGraphicsEndImageContext();
    
    return newImage;
    
}


@end
