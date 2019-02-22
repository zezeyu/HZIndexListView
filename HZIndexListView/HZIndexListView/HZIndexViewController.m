//
//  HZIndexViewController.m
//  IndexListView
//
//  Created by 何泽的mac on 2019/2/21.
//  Copyright © 2019年 智享城市iOS开发. All rights reserved.
//

#import "HZIndexViewController.h"
#import "HZIndexModel.h"
#import <objc/runtime.h>

@interface HZIndexViewController ()
//目录按钮
@property(nonatomic,strong)UIButton * catalogueButton;

@property(nonatomic,strong)HZIndexView * indexView;

@end

@implementation HZIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
    [self bindingUI];
}

-(void)initUI {
    [self.view addSubview:self.catalogueButton];
//	[self.view bringSubviewToFront:self.catalogueButton];
}

-(void)bindingUI {
    [self.catalogueButton addTarget:self action:@selector(clickCatalogueAction:) forControlEvents:UIControlEventTouchUpInside];
}
- (UIButton *)catalogueButton{
    if (!_catalogueButton) {
        _catalogueButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_catalogueButton setTitle:@"目录" forState:UIControlStateNormal];
        _catalogueButton.frame = CGRectMake(0, 200, 100, 100);
        _catalogueButton.backgroundColor = [UIColor blackColor];
    }
    return _catalogueButton;
}

- (HZIndexView *)indexView{
    if (!_indexView) {
        _indexView = [[HZIndexView alloc]init];
        return _indexView;
    }
    return _indexView;
}

-(void)clickCatalogueAction:(UIButton *)sender{
    [kWindows addSubview:self.indexView];
    self.indexView.dataSource = self.dataSource;
    [self.indexView showAnimation];
	__weak typeof(self)weakself = self;
	self.indexView.block = ^(NSInteger index) {
		NSLog(@"%ld",index);
		if (weakself.scroll_y_array.count <= index) {//数组越界了
			return ;
		}
		[weakself.base_scrollView setContentOffset:CGPointMake(0, [weakself.scroll_y_array[index] doubleValue] - 50) animated:YES];
	};
}
/**
 不分组的样式
 */
-(void)traverse_subviews:(UIView *)view titleArray:(NSArray<NSString *> *)titleArray{
	NSArray * array = [view subviews];
	NSMutableArray * scroll_y_arrayM = [NSMutableArray array];
	for (UIView * vw in array) {
		if ([vw isKindOfClass:[UILabel class]]) {
		    UILabel * label = (UILabel *)vw;
			for (NSString * text in titleArray) {
				NSArray * arr = [text componentsSeparatedByString:@" "];
				if ([label.text isEqualToString:arr[1]]) {//是我要找的label
					CGFloat f = CGRectGetMinY(label.frame);
					NSNumber * number = [[NSNumber alloc] initWithFloat:f];
					NSLog(@"top的距离是多少 %f",f);
					[scroll_y_arrayM addObject:number];
				}
			}
		}
	}
	self.scroll_y_array = [scroll_y_arrayM copy];
	self.dataSource = titleArray;
}
/**
 分组的样式
 */
-(void)group_style_subviews:(UIView *)view dataSource:(NSArray *)dataArray{
	NSArray * array = [view subviews];
	for (UIView *vw in array) {
		if ([vw isKindOfClass:[UILabel class]]) {
//            UILabel * label = (UILabel *)vw;
//			for (NSDictionary * dic in dataArray) {
//				HZIndexModel * model = [[HZIndexModel alloc]init];
//				[model setValuesForKeysWithDictionary:dic];
//			}
		}
	}
	
}

@end
@implementation HZIndexViewController (UIBinding)

- (void)initDataSource {
}
-(void)initScroll_y_array{
}

@end
