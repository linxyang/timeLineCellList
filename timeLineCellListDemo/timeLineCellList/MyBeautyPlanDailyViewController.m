//
//  MyBeautyPlanDailyViewController.m
//  MyBeautyPlanDailyViewController
//
//  Created by yanglinxia on 16/9/17.
//  Copyright © 2016年 yanglinxia. All rights reserved.
//

#import "MyBeautyPlanDailyViewController.h"
#import "BeautyDailyTableViewCell.h"
#import "BeautyDailyModel.h"

@interface MyBeautyPlanDailyViewController () <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) UITableView *tableView;
/** 数据 */
@property (nonatomic, strong) NSMutableArray<BeautyDailyModel *> *dataArray;
@end

@implementation MyBeautyPlanDailyViewController

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        
        BeautyDailyModel *model1 = [[BeautyDailyModel alloc] init];
        model1.time = @"2016年9月13日";
        model1.imgUrl = @"http://atth.eduu.com/album/201203/12/1475134_1331559643qMzc.jpg";
        model1.content = @"这个计划是真的非常好阿，大家都来偿试吧。走过路过，不要错过，进来看一看，样样两块，不好用不花钱，假一罚十，千万不要错过哦";
        [_dataArray addObject:model1];
        
        BeautyDailyModel *model2 = [[BeautyDailyModel alloc] init];
        model2.time = @"2016年9月14日";
        model2.imgUrl = @"http://pic51.nipic.com/file/20141027/11284670_094822707000_2.jpg";
        model2.content = @"为什么我用这个计划这么好，原来是高科技的美肤仪呀，大家都来偿试吧。走过路过，不要错过，进来看一看，样样两块，不好用不花钱，假一罚十，千万不要错过哦";
        [_dataArray addObject:model2];

        
        BeautyDailyModel *model3 = [[BeautyDailyModel alloc] init];
        model3.time = @"2016年9月17日";
        model3.imgUrl = @"http://pic7.nipic.com/20100609/5136651_124423001651_2.jpg";
        model3.content = @"这个计划是真的非常好阿，大家都来偿试吧。";
        [_dataArray addObject:model3];
        
        BeautyDailyModel *model5 = [[BeautyDailyModel alloc] init];
        model5.time = @"2016年9月19日";
        model5.content = @"这个计划是真的非常好阿，大家都来偿试吧。";
        [_dataArray addObject:model5];
        
        BeautyDailyModel *model6 = [[BeautyDailyModel alloc] init];
        model6.time = @"2016年9月21日";
        model6.imgUrl = @"http://pic51.nipic.com/file/20141027/11284670_094822707000_2.jpg";
        model6.content = @"为什么我用这个计划这么好，原来是高科技的美肤仪呀，大家都来偿试吧。走过路过，不要错过，进来看一看，样样两块，不好用不花钱，假一罚十，千万不要错过哦";
        [_dataArray addObject:model6];
        
        
        BeautyDailyModel *model7 = [[BeautyDailyModel alloc] init];
        model7.time = @"2016年9月17日";
        model7.imgUrl = @"http://pic7.nipic.com/20100609/5136651_124423001651_2.jpg";
        model7.content = @"这个计划是真的非常好阿，大家都来偿试吧。";
        [_dataArray addObject:model7];
        
        
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"时间轴式cell展示";
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BeautyDailyModel *model = self.dataArray[indexPath.row];
    
    return model.cellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"BeautyDailyTableViewCell";
    BeautyDailyTableViewCell *dailyCell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!dailyCell) {
        dailyCell = [[BeautyDailyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        dailyCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    BeautyDailyModel *model = self.dataArray[indexPath.row];
    if (indexPath.row == self.dataArray.count -1) {
        model.isLast = YES;//最后一个隐藏竖线
    }
    dailyCell.model = model;
    
    return dailyCell;
}



@end
