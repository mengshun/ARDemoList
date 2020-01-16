//
//  ListCell.h
//  ARDemoList
//
//  Created by 孟顺 on 2020/1/16.
//  Copyright © 2020 mengshun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *indexLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@end

NS_ASSUME_NONNULL_END
