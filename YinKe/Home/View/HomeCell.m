//
//  HomeCell.m
//  YinKe
//
//  Created by tqh on 16/6/15.
//  Copyright © 2016年 tqh. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.iconImage];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.address];
        [self.contentView addSubview:self.peopleNumber];
        [self.contentView addSubview:self.coverImage];
        
        
        
    }
    return self;
}

#pragma mark - 懒加载

- (UIImageView *)iconImage
{
    if (!_iconImage) {
        self.iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 45, 45)];
        _iconImage.layer.cornerRadius = _iconImage.frame.size.width/2;
        _iconImage.layer.masksToBounds = YES;
        CALayer *layer = [_iconImage layer];
        layer.borderColor = [[UIColor purpleColor] CGColor];
        layer.borderWidth = 1.5f;
    }
    return _iconImage;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_iconImage.frame.origin.x+_iconImage.frame.size.width+10, _iconImage.frame.origin.y, SCREEN_WIDTH, _iconImage.frame.size.height/2)];
        _nameLabel.text = @"映客";
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.font = [UIFont systemFontOfSize:14];
    }
    return _nameLabel;
}

- (UIButton *)address
{
    if (!_address) {
        _address = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _address.frame = CGRectMake(_nameLabel.frame.origin.x, _nameLabel.frame.origin.y+_nameLabel.frame.size.height, SCREEN_WIDTH/2, _nameLabel.frame.size.height);
        [_address setImage:[UIImage imageNamed:@"address"] forState:(UIControlStateNormal)];
        [_address setTitle:@"中国" forState:(UIControlStateNormal)];
        [_address setTitleColor:[UIColor lightGrayColor] forState:(UIControlStateNormal)];
        _address.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _address.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
        _address.titleLabel.font = [UIFont systemFontOfSize:12];
        
    }
    return _address;
}

- (UILabel *)peopleNumber
{
    if (!_peopleNumber) {
        self.peopleNumber = [[UILabel alloc] initWithFrame:CGRectMake(_address.frame.origin.x+_address.frame.size.width, _address.frame.origin.y, SCREEN_WIDTH/3-40, _address.frame.size.height)];
        _peopleNumber.text = @"9999";
        _peopleNumber.textColor = [UIColor purpleColor];
        _peopleNumber.font = [UIFont systemFontOfSize:15];
        _peopleNumber.textAlignment = NSTextAlignmentRight;
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(_peopleNumber.frame.origin.x+_peopleNumber.frame.size.width, _peopleNumber.frame.origin.y+1.5, 30, _peopleNumber.frame.size.height)];
        label.text = @" 在看";
        label.textColor = [UIColor lightGrayColor];
        label.font = [UIFont systemFontOfSize:11];
        label.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label];
        
        
    }
    return _peopleNumber;
}

- (UIImageView *)coverImage
{
    if (!_coverImage) {
        _coverImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, _iconImage.frame.origin.y+_iconImage.frame.size.height+10, SCREEN_WIDTH, ([UIScreen mainScreen].bounds.size.width * 618/480)+1
                                                                        
                                                                        -_iconImage.frame.size.height-20)];
    }
    return _coverImage;
}

#pragma mark - setter

- (void)setModel:(HomeModel *)model {
    _model = model;
    self.nameLabel.text = model.creator.nick;
    self.peopleNumber.text = [NSString stringWithFormat:@"%ld",model.online_users];
    // 用户所在城市
    if ([model.city isEqualToString:@""]) {
        [self.address setTitle:@"难道在火星?" forState:(UIControlStateNormal)];
    }else{
        [self.address setTitle:model.city forState:(UIControlStateNormal)];
    }
    // 用户Image
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.meelive.cn/%@",model.creator.portrait]]];
    [self.coverImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.meelive.cn/%@",model.creator.portrait]]];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
