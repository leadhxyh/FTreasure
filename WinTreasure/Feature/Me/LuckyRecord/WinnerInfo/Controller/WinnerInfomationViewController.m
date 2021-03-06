//
//  WinnerInfomationViewController.m
//  WinTreasure
//
//  Created by Apple on 16/6/27.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import "WinnerInfomationViewController.h"
#import "CreateAddressViewController.h"
#import "WinnerInfoCell.h"


@interface WinnerInfomationViewController () <UITableViewDataSource, UITableViewDelegate, WinnerInfoCellDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *datasource;

@end

@implementation WinnerInfomationViewController

- (NSMutableArray *)datasource {
    if (!_datasource) {
        _datasource = [NSMutableArray array];
    }
    return _datasource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"选择/设置领奖信息";

    [self initSubviews];
    [self getWinnerInfo];
}

- (void)initSubviews {
    _tableView.estimatedRowHeight = 150;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    [_tableView setCustomSeparatorInset:UIEdgeInsetsZero];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.origin = CGPointMake(0, kScreenHeight-44);
    button.size = CGSizeMake(kScreenWidth, 44);
    button.titleLabel.font = SYSTEM_FONT(15);
    button.backgroundColor = kDefaultColor;
    [button setTitle:@"新建领奖地址" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(createNewAddress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)getWinnerInfo {
    for (int i=0; i<3; i++) {
        AddressModel *model = [[AddressModel alloc]init];
        [self.datasource addObject:model];
    }
    [_tableView reloadData];
}

- (void)createNewAddress {
    [self setBackItem];
    CreateAddressViewController *vc = [[CreateAddressViewController alloc]init];
    vc.isSigned = YES;
    [self hideBottomBarPush:vc];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.datasource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WinnerInfoCell *cell = [WinnerInfoCell cellWithTableView:tableView];
    AddressModel *model = _datasource[indexPath.section];
    cell.model = model;
    cell.delegate = self;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return .1;
}

#pragma mark - WinnerInfoCellDelegate
- (void)winnerInfoCell:(WinnerInfoCell *)cell editButtonClickedAtIndexPath:(NSIndexPath *)indexPath {
    CreateAddressViewController *vc = [[CreateAddressViewController alloc]init];
    AddressModel *model = _datasource[indexPath.section];
    vc.isSigned = YES;
    vc.model = model;
    [self hideBottomBarPush:vc];
}

- (void)winnerInfoCell:(WinnerInfoCell *)cell deleteButtonClickedAtIndexPath:(NSIndexPath *)indexPath {
    [_datasource removeObjectAtIndex:indexPath.section];
    [_tableView reloadData];
}

- (void)winnerInfoCell:(WinnerInfoCell *)cell prizeButtonClickedAtIndexPath:(NSIndexPath *)indexPath {
    AddressModel *model = _datasource[indexPath.section];
    NSString *message = [NSString stringWithFormat:@"%@\n%@\n%@",model.name,model.phone,model.address];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"请确认您的领奖信息" message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex==1) {
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
