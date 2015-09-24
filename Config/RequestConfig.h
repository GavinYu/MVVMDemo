//
//  RequestConfig.h
//  SaoFanFanCook
//
//  Created by DengBin on 15/1/22.
//  Copyright (c) 2015年 dengbin. All rights reserved.
//

#ifndef SaoFanFanCook_RequestConfig_h
#define SaoFanFanCook_RequestConfig_h


#endif

//测试环境
#define YK_URL_BASE_DEV @"http://test.shaofanfan.com/api/index.php/chefApp"
//生产环境
#define YK_URL_BASE_PROD @"http://api.shaofanfan.com/chefApp"
#ifdef DEBUG
#warning 测试环境接口
/** 接口地址前边部分 */
#define BaseUrl YK_URL_BASE_DEV
#else
/** 接口地址前边部分 */
#define BaseUrl YK_URL_BASE_PROD
#endif

//#define BaseUrl YK_URL_BASE_PROD

#define LoginRequest            @"user/login"
#define GetProfileRequest       @"user/getProfile"
#define LogoutRequest           @"user/logout"
#define DashboardRequest        @"user/dashboard"
#define GetScheduleRequest      @"user/getSchedule"
#define UpdateScheduleRequest   @"user/updateSchedule"
#define GetProvinceRequest      @"user/getProvince"
#define UpdateProfileRequest    @"user/updateProfile"
#define OrderQueryRequest       @"order/query"
#define OrderUpdateRequest      @"order/update"
#define CheckUpdateRequest      @"system/checkUpdate"

#define UserUpdateRequest       @"user/userUpdate"
#define GetValidateCodeRequest  @"user/getValidateCode"
#define WalletListRequest       @"user/walletList"
#define GiveUpListRequest       @"order/giveUpList"
#define GiveUpAddRequest        @"order/giveUpAdd"
#define DetailRequest           @"order/detail"
#define FileUploadRequest       @"order/fileUpload"
