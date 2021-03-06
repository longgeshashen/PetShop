//
//  PetDoorServiceTableViewCell.m
//  PetShop
//
//  Created by zx_06 on 15/7/1.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "PetDoorServiceTableViewCell.h"
#import "PetDoctorStarView.h"
@implementation PetDoorServiceTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark - 根据字典数据加载内容
- (void)loadDoorServiceTableViewcell:(NSDictionary*)cellDictionary{
    //头像
    _petDoorServicePortrial = [[UIImageView alloc] initWithFrame:CGRectMake(20, 15, 70, 70)];
    _petDoorServicePortrial.image = [UIImage imageNamed:@"pet_hospital_portrial"];
    [self addSubview:_petDoorServicePortrial];
    //名字
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 70, 30)];
    _nameLabel.text = @"李华生";
    _nameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
    [self addSubview:_nameLabel];
    //级别
    _levelLabel = [[UILabel alloc] initWithFrame:CGRectMake(155, 17, 70, 20)];
    _levelLabel.text = @"主治医生";
    _levelLabel.textColor = [UIColor lightGrayColor];
    _levelLabel.font = [UIFont systemFontOfSize:11];
    [self addSubview:_levelLabel];
    //诊断和鲜花
    _diagnosisNumber = @"221";
    _flowerNumber = @"542";
    NSInteger length1 = [_diagnosisNumber length];
    NSInteger length2 = [_diagnosisNumber length];
    NSString *labelString = [NSString stringWithFormat:@"诊断%@例／鲜花%@朵",_diagnosisNumber,_flowerNumber];
    NSMutableAttributedString *labelString2 = [[NSMutableAttributedString alloc] initWithString:labelString];
    if (length1>0) {
        [labelString2 addAttribute: NSForegroundColorAttributeName value: [UIColor colorWithRed:224/255.0 green:34/255.0 blue:152/255.0 alpha:1.0] range: NSMakeRange(2, length1)];
    }
    if (length2>0) {
        [labelString2 addAttribute: NSForegroundColorAttributeName value: [UIColor colorWithRed:224/255.0 green:34/255.0 blue:152/255.0 alpha:1.0] range: NSMakeRange([labelString2 length]-length2-1, length2)];
    }
    _diagnosisLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 40, 160, 15)];
    _diagnosisLabel.attributedText = labelString2;
    
    _diagnosisLabel.font = [UIFont systemFontOfSize:11];
    [self addSubview:_diagnosisLabel];
    
    
    //医院
    
    NSString *hosStrig = @"内科，北京第一宠物医院";
    NSDictionary *dicHos = @{NSBackgroundColorAttributeName:[UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0]};
    
    _hospitalLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 70, 160, 15)];
    _hospitalLabel.attributedText = [[NSAttributedString alloc] initWithString:hosStrig attributes:dicHos];
    _hospitalLabel.font = [UIFont systemFontOfSize:11];
    [self addSubview:_hospitalLabel];
    
    _phoneNumber = @"10086";
    
    //call
    _phoneButton = [[UIButton alloc] initWithFrame:CGRectMake(kWidth-60, 30, 40, 40)];
    [_phoneButton setBackgroundImage:[UIImage imageNamed:@"petBeauty_phone_order"] forState:UIControlStateNormal];
    [_phoneButton addTarget:self action:@selector(callBeautyCare:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_phoneButton];
    
    //星级
    _starNumber = 3;
    PetDoctorStarView *starView = [[PetDoctorStarView alloc]initWithFrame:CGRectMake(95, 57, 85, 12)];
    [starView loadHilightStars:_starNumber];
    starView.backgroundColor = [UIColor whiteColor];
    [self addSubview:starView];
    
    //分割线
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(30, 90, kWidth-60, 0.5)];
    lineView.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0];
    [self addSubview:lineView];
    
    //detial
    _doorServiceDetial = [[UITextView alloc] initWithFrame:CGRectMake(22, 110, kWidth-50, 80)];
    _doorServiceDetial.text = @"马云，男，1964年10月15日生于浙江省杭州市，祖籍浙江省， 阿里巴巴集团主要创始人，现担任阿里巴巴集团董事局主席、日本软银董事、TNC中国理事会主席兼全球董事会成员、华谊兄弟董事、生命科学突破奖基金会董事。";
    _doorServiceDetial.editable = NO;
    _doorServiceDetial.showsVerticalScrollIndicator = NO;
    [self addSubview:_doorServiceDetial];
    //简介
    _introductionLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 90, 100, 30)];
    _introductionLabel.text = @"个人简介：";
    [self addSubview:_introductionLabel];
    
}
- (void)callBeautyCare:(UIButton*)sender{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(CallTheDoorService:)]) {
        [self.delegate CallTheDoorService:_phoneNumber];
    }
    
}
@end
