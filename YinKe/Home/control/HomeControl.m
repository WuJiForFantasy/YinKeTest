//
//  HomeControl.m
//  YinKe
//
//  Created by tqh on 16/6/15.
//  Copyright © 2016年 tqh. All rights reserved.
//

#import "HomeControl.h"
#import "HomeCell.h"
#import "HomeStore.h"
#import "LiveControl.h"

@interface HomeControl ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)HomeStore *store;
@property (nonatomic,strong)ODRefreshControl *refreshControl;

@end

@implementation HomeControl

#pragma mark - 懒加载

- (HomeStore *)store {
    if (!_store) {
        _store = [HomeStore new];
    }
    return _store;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[HomeCell class] forCellReuseIdentifier:@"cellID"];
        
        ODRefreshControl *refreshControl = [[ODRefreshControl alloc] initInScrollView:_tableView];
        [refreshControl addTarget:self action:@selector(dropViewDidBeginRefreshing:) forControlEvents:UIControlEventValueChanged];
    }
    return _tableView;
}

#pragma mark -生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor redColor];
    self.title = @"tqh映客直播Test";
    [self.view addSubview:self.tableView];
    [self.store request:^(NSArray<HomeModel *> *array) {
        [self.tableView reloadData];
    } fail:^{
    }];
}

#pragma mark - 事件监听


- (void)dropViewDidBeginRefreshing:(ODRefreshControl *)refreshControl {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.store request:^(NSArray<HomeModel *> *array) {
             [refreshControl endRefreshing];
            [self.tableView reloadData];
        } fail:^{
            [refreshControl endRefreshing];
        }];
        
    });
}


#pragma mark - <UITableViewDataSource,UITableViewDelegate>


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    cell.model = self.store.dataArray[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.store.dataArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LiveControl *live = [[LiveControl alloc]init];
    HomeModel *model = self.store.dataArray[indexPath.row];
    live.store.liveUrl = model.stream_addr;
    live.store.imageUrl = model.creator.portrait;
    [self.navigationController pushViewController:live animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UIScreen mainScreen].bounds.size.width * 618/480;
}


@end
