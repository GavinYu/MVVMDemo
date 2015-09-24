//
//  NetRequestClient.m
//  MVVMDemo
//
//  Created by yek on 15/9/16.
//  Copyright (c) 2015年 Jenny. All rights reserved.
//

#import "NetRequestClient.h"

#import "YKStatic.h"

#define TimeoutInterval 15  //设置请求超时时间

@implementation NetRequestClient

static NetRequestClient *sharedClient = nil;

+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    if (sharedClient == nil) {
        dispatch_once(&onceToken, ^{
            sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:[YKStatic apiurlBase]]];
            sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        });
        
    }
    
    return sharedClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    if (self = [super initWithBaseURL:url]) {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer.timeoutInterval = TimeoutInterval;
        self.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
//        [self setHTTPHeader];
    }
    return self;
}

/**
 *  设置请求头
 */
//- (void)setHTTPHeader {
//    NSString *screenSize = [NSString stringWithFormat:@"%.0f*%.0f",ScreenWidth,ScreenHeight];
//    NSString *platform = @"iPhone";
//    //    NSString *uuid = [DBUDID UUID];
//    NSString *uuid = GET_UDID;
//    
//    NSString *clientVersion = CurVersion;
//    NSString *protocolVersion = @"1.0.0";
//    NSString *model = [self modelNameString];
//    NSString *carrier = [self carrierName];
//    NSString *resisterId = [APService registrationID];
//    NSString *latitude = [NSString stringWithFormat:@"%f",[[DBLocationManager sharedInstance] latitude]];
//    NSString *longitude = [NSString stringWithFormat:@"%f",[[DBLocationManager sharedInstance] longitude]];
//    
//    [self.requestSerializer setValue:screenSize      forHTTPHeaderField:@"screenSize"];
//    [self.requestSerializer setValue:platform        forHTTPHeaderField:@"platform"];
//    [self.requestSerializer setValue:uuid            forHTTPHeaderField:@"udid"];
//    [self.requestSerializer setValue:clientVersion   forHTTPHeaderField:@"clientVersion"];
//    [self.requestSerializer setValue:protocolVersion forHTTPHeaderField:@"protocolVersion"];
//    [self.requestSerializer setValue:model           forHTTPHeaderField:@"model"];
//    [self.requestSerializer setValue:carrier         forHTTPHeaderField:@"carrier"];
//    [self.requestSerializer setValue:resisterId      forHTTPHeaderField:@"resisterId"];
//    
//    [self.requestSerializer setValue:latitude forHTTPHeaderField:@"latitude"];
//    [self.requestSerializer setValue:longitude forHTTPHeaderField:@"longitude"];
//}


@end
