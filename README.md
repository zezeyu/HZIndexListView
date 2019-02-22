# HZIndexListView

### 公司项目页面目录功能

### 使用方法一

####
``` bash

self.base_scrollView = self.scrollView;
[self traverse_subviews:_views titleArray:@[@"一 场地选择",@"二 演练流程",@"01/ 会前准备",@"02/ 会议流程",@"03/ 注意事项",@"三 顾客分析",@"四 现场大感动流程",@"01/ 进场",@"02/ 老总致辞",@"03/ 女人花文化讲解",@"04/ 心灵解码体验",@"05/ 店面活动方案",@"06/ 结束语",@"五 返店继续成交"]];

```
### 警告⚠️   使用Masonry布局时要在方法调用前加上  [self.view layoutIfNeeded];  例如：
``` bash
UILabel * label = [[UILabel alloc]init];
label.text = @"演练流程";
label.backgroundColor = [UIColor yellowColor];
[self.view addSubview:label];
[label mas_makeConstraints:^(MASConstraintMaker *make) {
make.top.mas_equalTo(500);
make.centerX.mas_equalTo(self.view);
make.width.height.mas_equalTo(100);
}];
[self.view layoutIfNeeded];
self.base_scrollView = self.scrollView;
[self traverse_subviews:_views titleArray:@[@"一 场地选择",@"二 演练流程",@"01/ 会前准备",@"02/ 会议流程",@"03/ 注意事项",@"三 顾客分析",@"四 现场大感动流程",@"01/ 进场",@"02/ 老总致辞",@"03/ 女人花文化讲解",@"04/ 心灵解码体验",@"05/ 店面活动方案",@"06/ 结束语",@"五 返店继续成交"]];

``` 

