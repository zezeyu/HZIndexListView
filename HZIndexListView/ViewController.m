//
//  ViewController.m
//  HZIndexListView
//
//  Created by 何泽的mac on 2019/2/22.
//  Copyright © 2019年 何泽的mac. All rights reserved.
//

#import "ViewController.h"
#import "HZIndexModel.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UIView *views;

// 场地选择
@property (weak, nonatomic) IBOutlet UILabel *label1;
// 演练流程
@property (weak, nonatomic) IBOutlet UILabel *label2;
// 会前准备
@property (weak, nonatomic) IBOutlet UILabel *label2_1;
// 会议流程
@property (weak, nonatomic) IBOutlet UILabel *label2_2;
// 注意事项
@property (weak, nonatomic) IBOutlet UILabel *label2_3;
// 顾客分析
@property (weak, nonatomic) IBOutlet UILabel *label3;
// 现场大感动流程
@property (weak, nonatomic) IBOutlet UILabel *label4;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    self.dataSource = @[@"场地选择",@"演练流程",@"会前准备",@"会议流程",@"顾客分析",@"现场大感动流程",@"进场",@"老总致辞",@"女人花h文化讲解"];
    //    self.scroll_y_array = @[@(100),@(200),@(500),@(700),@(1000),@(1300),@(1500),@(1600),@(1800)];
    
    
    /*
     
     UILabel * view = [[UILabel alloc]init];
     view.text = @"演练流程";
     view.backgroundColor = [UIColor yellowColor];
     [self.view addSubview:view];
     [view mas_makeConstraints:^(MASConstraintMaker *make) {
     make.top.mas_equalTo(500);
     make.centerX.mas_equalTo(self.view);
     make.width.height.mas_equalTo(100);
     }];
     [self.view layoutIfNeeded];
     */
    /**
     分组样式数据源
     NSArray * array = @[
     @{@"sectionTitle":@"场地选择",@"rowArray":@[]},
     @{@"sectionTitle":@"演练流程",@"rowArray":@[@"会前准备",@"会议流程",@"注意事项"]},
     @{@"sectionTitle":@"顾客分析",@"rowArray":@[]},
     @{@"sectionTitle":@"现场大感动流程",@"rowArray":@[@"进场",@"老总致辞",@"女人花文化讲解",@"心灵解码体验",@"店面活动方案",@"结束语"]},
     @{@"sectionTitle":@"返点继续成交",@"rowArray":@[]},
     ];
     */
    
    self.base_scrollView = self.scrollView;
    [self traverse_subviews:_views titleArray:@[@"一 场地选择",@"二 演练流程",@"01/ 会前准备",@"02/ 会议流程",@"03/ 注意事项",@"三 顾客分析",@"四 现场大感动流程",@"01/ 进场",@"02/ 老总致辞",@"03/ 女人花文化讲解",@"04/ 心灵解码体验",@"05/ 店面活动方案",@"06/ 结束语",@"五 返店继续成交"]];
    
    
    //    [self group_style_subviews:_views dataSource:array];
    
}


@end
