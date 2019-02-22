//
//  HZIndexTableViewCell.h
//  IndexListView
//
//  Created by 智享城市iOS开发 on 2019/2/22.
//  Copyright © 2019年 智享城市iOS开发. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZIndexTableViewCell : UITableViewCell
/**
 左边的按钮
 */
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
/**
 距离左边的间距
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftSpace;

@end

NS_ASSUME_NONNULL_END
