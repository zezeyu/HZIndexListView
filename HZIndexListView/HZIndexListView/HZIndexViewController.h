//
//  HZIndexViewController.h
//  IndexListView
//
//  Created by 何泽的mac on 2019/2/21.
//  Copyright © 2019年 智享城市iOS开发. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HZIndexView.h"
NS_ASSUME_NONNULL_BEGIN



@interface HZIndexViewController : UIViewController

@property(nonatomic, strong)UIScrollView * base_scrollView;
/**
 不分组的模式的Y抽数据源
 */
@property(nonatomic, strong)NSArray<NSNumber *> *scroll_y_array;
@property(nonatomic, strong)NSArray<NSString *>*dataSource;
/**
 不分组的模式
 */
-(void)traverse_subviews:(UIView *)view titleArray:(NSArray<NSString *> *)titleArray;
/**
 分组样式
 */
-(void)group_style_subviews:(UIView *)view dataSource:(NSArray *)dataArray;

@end

@interface HZIndexViewController (UIBinding)

// 子类继承，可以不调super
- (void)initDataSource;
-(void)initScroll_y_array;

@end



NS_ASSUME_NONNULL_END
