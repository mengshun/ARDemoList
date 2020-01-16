//
//  ViewController.m
//  ARDemoList
//
//  Created by 孟顺 on 2020/1/16.
//  Copyright © 2020 mengshun. All rights reserved.
//

#import "ViewController.h"
#import "ListCell.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray <NSDictionary *>*dataList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataList = @[
        @{@"文字AR":@"WordViewController"},
        @{@"飞机模型AR":@"AirplaneViewController"},
        @{@"人脸贴图":@"FaceVC"},
        @{@"查看3D模型":@"QuickLookViewController"},

    ];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(ListCell.class)];
    cell.indexLabel.text = @(indexPath.row+1).stringValue;
    cell.valueLabel.text = self.dataList[indexPath.row].allKeys.firstObject;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *vcString = self.dataList[indexPath.row].allValues.firstObject;
    if (NSClassFromString(vcString)) {
        UIViewController *vc = [NSClassFromString(vcString) new];
        vc.title = self.dataList[indexPath.row].allKeys.firstObject;
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end
