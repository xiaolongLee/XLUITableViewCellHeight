//
//  ListViewController.m
//  XLUITableViewCellHeightDemo
//
//  Created by Mac-Qke on 2019/3/4.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import "ListViewController.h"
#import "ListTableViewCell.h"

static NSString *const ReuseIdentifier  = @"cell";
@interface ListViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"标题";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"reloadData" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemDidClick:)];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ListTableViewCell class]) bundle:nil] forCellReuseIdentifier:ReuseIdentifier];
}

#pragma mark --UITableViewDelegate/UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ReuseIdentifier forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark -- Methods

- (void)rightBarButtonItemDidClick:(UIBarButtonItem *)item {
    [self.tableView reloadData];
}


#pragma mark - Getters

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        
        NSString *string = @"Siri 让你能够利用语音来完成发送信息、安排会议、查看最新比分等更多事务。只要说出你想做的事，Siri 就能帮你办到。Siri 可以听懂你说的话、知晓你的心意，甚至还能有所回应。iOS 7 中的 Siri 拥有新外观、新声音和新功能。它的界面经过重新设计，以淡入视图浮现于任意屏幕画面的最上层。Siri 回答问题的速度更快，还能查询更多信息源，如维基百科。它可以承担更多任务，如回电话、播放语音邮件、调节屏幕亮度，以及更多。";
        
        //生成假数据
        for (int i =0 ; i< 100; i++) {
            
            ListModel *model = [[ListModel alloc] init];
            NSInteger index = (arc4random()%(string.length / 20)) * 20;
            model.desc = [string substringToIndex:MAX(20, index)];
            
            [_dataArray addObject:model];
        }
    }
    
    return _dataArray;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
