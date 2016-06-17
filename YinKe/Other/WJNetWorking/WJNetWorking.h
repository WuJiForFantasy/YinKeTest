//
//  WJNetWorking.h
//  AFNetworking网络请求
//
//  Created by 谭启宏 on 16/3/2.
//  Copyright © 2016年 tqh. All rights reserved.
//

#import <UIKit/UIKit.h>

//请求成功回调
typedef void (^SuccessBlock)(NSDictionary *dataDic);
//请求失败
typedef void (^FailBlock)(NSError *failObj);
//下载成功回调
typedef void (^downloadBlock)(NSURL *pathUrl);

typedef void (^progressBlock)(CGFloat progress);

@interface WJNetWorking : NSObject

/**普通get网络请求*/
+ (void)netWorkingIsGetWithURL:(NSString *)urlpath param:(NSDictionary *)dic success:(SuccessBlock)succsess fail:(FailBlock)fail progress:(progressBlock)progress ;
/**普通post网络请求*/
+ (void)netWorkingIsPostWithURL:(NSString *)urlpath param:(NSDictionary *)dict success:(SuccessBlock)succsess fail:(FailBlock)fail progress:(progressBlock)progress;
//上传图片
+ (void)uploadImageRequest:(NSString *)url params:(NSDictionary *)params Data:(NSData *)Data name:(NSString *)name fileName:(NSString *)fileName success:(SuccessBlock)successHandler failure:(FailBlock)failureHandler;
//下载文件
+ (void)downloadRequest:(NSString *)url download:(downloadBlock)download failure:(FailBlock)failureHandler;

@end
