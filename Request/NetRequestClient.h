//
//  NetRequestClient.h
//  MVVMDemo
//
//  Created by yek on 15/9/16.
//  Copyright (c) 2015年 Jenny. All rights reserved.
//
#import "AFHTTPSessionManager.h"

@interface NetRequestClient : AFHTTPSessionManager

+ (instancetype)sharedInstance;

@end
