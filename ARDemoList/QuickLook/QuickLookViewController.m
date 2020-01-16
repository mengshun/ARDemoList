
//
//  QuickLookViewController.m
//  ARDemoList
//
//  Created by 孟顺 on 2020/1/16.
//  Copyright © 2020 mengshun. All rights reserved.
//

#import "QuickLookViewController.h"
#import <QuickLook/QuickLook.h>

@interface QuickLookViewController ()<QLPreviewControllerDataSource, QLPreviewControllerDelegate>

@end

@implementation QuickLookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"请点击屏幕";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    QLPreviewController *preVC = [[QLPreviewController alloc] init];
    preVC.delegate = self;
    preVC.dataSource = self;
    preVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:preVC animated:YES completion:nil];
}

- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller
{
    return 1;
}

- (id<QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index
{
    return [[NSBundle mainBundle] URLForResource:@"plantpot.usdz" withExtension:nil];
}

- (UIImage *)previewController:(QLPreviewController *)controller transitionImageForPreviewItem:(id<QLPreviewItem>)item contentRect:(CGRect *)contentRect {
    
    CGRect rect = CGRectMake(100, 200, 300, 300);
    contentRect = &rect;
    return [UIImage imageNamed:@"wy.jpeg"];
}


@end
