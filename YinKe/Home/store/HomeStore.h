//
//  HomeStore.h
//  YinKe
//
//  Created by tqh on 16/6/15.
//  Copyright © 2016年 tqh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeModel.h"

typedef void (^successBlock)(NSArray <HomeModel *>*array);
typedef void (^failBlock)();

@interface HomeStore : NSObject

@property (nonatomic,copy)NSArray <HomeModel *>*dataArray;


- (void)request:(successBlock)block fail:(failBlock)fail;

@end
