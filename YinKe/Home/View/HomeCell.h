//
//  HomeCell.h
//  YinKe
//
//  Created by tqh on 16/6/15.
//  Copyright © 2016年 tqh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface HomeCell : UITableViewCell

@property (nonatomic,strong)UIImageView *iconImage; //用户头像

@property (nonatomic,strong)UILabel *nameLabel;//用户名

@property (nonatomic,strong)UIButton *address;//用户地址

@property (nonatomic,strong)UILabel *peopleNumber;//观看人数

@property (nonatomic,strong)UIImageView *coverImage;//封面

@property (nonatomic,strong)HomeModel *model;

@end
