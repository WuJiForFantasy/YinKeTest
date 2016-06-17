//
//  HomeStore.m
//  YinKe
//
//  Created by tqh on 16/6/15.
//  Copyright © 2016年 tqh. All rights reserved.
//

#import "HomeStore.h"

// 映客接口
#define HomeData [NSString stringWithFormat:@"http://service.ingkee.com/api/live/gettop?imsi=&uid=17800399&proto=5&idfa=A1205EB8-0C9A-4131-A2A2-27B9A1E06622&lc=0000000000000026&cc=TG0001&imei=&sid=20i0a3GAvc8ykfClKMAen8WNeIBKrUwgdG9whVJ0ljXi1Af8hQci3&cv=IK3.1.00_Iphone&devi=bcb94097c7a3f3314be284c8a5be2aaeae66d6ab&conn=Wifi&ua=iPhone&idfv=DEBAD23B-7C6A-4251-B8AF-A95910B778B7&osversion=ios_9.300000&count=5&multiaddr=1"]

@implementation HomeStore

- (void)request:(successBlock)block fail:(failBlock)fail {
     NSDictionary *dic = @{@"format":@"json"};
    NSString * str = [[NSString stringWithFormat:@"%@",HomeData]stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [WJNetWorking netWorkingIsPostWithURL:str param:dic success:^(NSDictionary *dataDic) {
        self.dataArray = [HomeModel mj_objectArrayWithKeyValuesArray:dataDic[@"lives"]];
        block(self.dataArray);
    } fail:^(NSError *failObj) {
        fail();
    } progress:^(CGFloat progress) {
        
    }];
}

@end
