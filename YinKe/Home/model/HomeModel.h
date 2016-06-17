//
//  HomeModel.h
//  YinKe
//
//  Created by tqh on 16/6/15.
//  Copyright © 2016年 tqh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
@interface HomeModel : NSObject

@property (nonatomic,copy)NSString *ID;//id

@property (nonatomic,copy)NSString *city; //城市
@property (nonatomic,strong)UserModel *creator; //用户信息
@property (nonatomic,assign)NSInteger online_users;//在线用户

@property (nonatomic,copy)NSString * stream_addr; //直播地址

@end
