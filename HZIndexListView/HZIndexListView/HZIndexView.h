//
//  HZIndexView.h
//  IndexListView
//
//  Created by 何泽的mac on 2019/2/21.
//  Copyright © 2019年 智享城市iOS开发. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HZIndexModel.h"
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kWindows self.view.window
#define RGB(r,g,b) [UIColor colorWithRed:r/255. green:g/255. blue:b/255. alpha:1.]

NS_ASSUME_NONNULL_BEGIN
typedef void(^indexblock)(NSInteger index);
@interface HZIndexView : UIView<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,copy)indexblock block;

@property(nonatomic,strong)UITableView * tableView;
/**不分组数据源*/
@property(nonatomic, strong)NSArray<NSString *>*dataSource;
/**
 分组数据源
 */
@property (strong, nonatomic) HZIndexModel * model;

-(void)showAnimation;
-(void)hideAnimation;

@end

@interface UIView (UIViewUtil)
-(void)addTarget:(id)Target action:(SEL)selector ;
@end

@interface NSString (StringUtil)
//取出字符串中的数字 返回是数字字符串
-(NSString *)getStringToNum;
-(BOOL)isStringNotNum;

@end

@interface UILabel (UILabelUtil)

-(void)setStrsColor:(NSArray <NSString *>*)strs color:(UIColor *)color;

-(void)setRich:(NSString *)str fontSize:(CGFloat)fontSize color:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
