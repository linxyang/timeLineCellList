//
//  BeautyDailyTableViewCell.m
//  BeautyDailyTableViewCell
//
//  Created by yanglinxia on 16/9/17.
//  Copyright © 2016年 Ezreal. All rights reserved.
//

#import "BeautyDailyTableViewCell.h"
#import <Masonry/Masonry.h>
#import <UIImageView+WebCache.h>

@interface BeautyDailyTableViewCell()

@property(nonatomic, strong) UIImageView *pointView;
@property(nonatomic, strong) UIImageView *lineView;

@property(nonatomic, strong) UILabel *timeLabel;
@property(nonatomic, strong) UILabel *contentLabel;
/** 图片 */
@property (nonatomic, strong) UIImageView *recordImageView;

@end

@implementation BeautyDailyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
    _pointView = [[UIImageView alloc] init];
    _pointView.image = [UIImage imageNamed:@"point"];
    [self.contentView addSubview:_pointView];
    
    _lineView = [[UIImageView alloc] init];
    _lineView.image = [UIImage imageNamed:@"line"];
    _lineView.frame = CGRectMake(20, 20, 13, 13);
    [self.contentView addSubview:_lineView];
    
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.text = @"2016-03-28 11:38:58";
    [self.contentView addSubview:_timeLabel];
    
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.text = @"您提交了订单，请等待第三方卖家系统确认";
    _contentLabel.font = [UIFont systemFontOfSize:12];
    _contentLabel.numberOfLines = 0;
    [self.contentView addSubview:_contentLabel];
    
    _recordImageView = [[UIImageView alloc] init];
    _recordImageView.image = [UIImage imageNamed:@"point"];
    [self.contentView addSubview:_recordImageView];
    
    
    [self layoutPageView];
    
    return self;
}

- (void)layoutPageView {
    [_pointView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(20);
        make.width.height.equalTo(@13);
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_pointView);
        make.width.equalTo(@1);
        make.top.equalTo(_pointView.mas_bottom);
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(_pointView.mas_right).offset(10);
    }];
    
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_timeLabel.mas_bottom).offset(8);
        make.left.equalTo(_timeLabel);
        make.right.equalTo(self.contentView).offset(-10);
    }];
    
    [_recordImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_contentLabel.mas_bottom).offset(10);
        make.centerX.equalTo(_contentLabel);
        make.height.width.equalTo(@100);
    }];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   
}

- (void)setModel:(BeautyDailyModel *)model
{
    _model = model;
    _timeLabel.text = model.time;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:4];//调整行间距
    NSDictionary *attributes = @{NSFontAttributeName:self.contentLabel.font,NSParagraphStyleAttributeName:paragraphStyle};
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:model.content attributes:attributes];
    _contentLabel.attributedText = attrString;
    
    if ([model.imgUrl isEqualToString:@""] || model.imgUrl == nil) {
        _recordImageView.hidden = YES;
        [_recordImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_contentLabel.mas_bottom).offset(10);
            make.centerX.equalTo(_contentLabel);
            make.height.width.equalTo(@0);
        }];
    } else {
        _recordImageView.hidden = NO;
        [_recordImageView setImageWithURL:[NSURL URLWithString:model.imgUrl] placeholderImage:[UIImage imageNamed:@"point"]];
        [_recordImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_contentLabel.mas_bottom).offset(10);
            make.centerX.equalTo(_contentLabel);
            make.height.width.equalTo(@100);
        }];
    }
    _lineView.hidden = model.isLast ? YES : NO;

}


@end
