//
//  HZIndexView.m
//  IndexListView
//
//  Created by 何泽的mac on 2019/2/21.
//  Copyright © 2019年 智享城市iOS开发. All rights reserved.
//

#import "HZIndexView.h"
#import "HZIndexTableViewCell.h"
@interface HZIndexView ()

@end

@implementation HZIndexView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.alpha = 0;
        self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
        [self addSubview:self.tableView];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
	[self hideAnimation];
}

-(void)showAnimation{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 1;
        self.tableView.frame = CGRectMake(0, 0,kScreenWidth * 0.82 , kScreenHeight);
    } completion:^(BOOL finished) {
        
    }];
}

-(void)hideAnimation{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
        self.tableView.frame = CGRectMake(-(kScreenWidth * 0.82), 0,kScreenWidth * 0.82 , kScreenHeight);
    } completion:^(BOOL finished) {
        
    }];
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(-(kScreenWidth * 0.82), 0, kScreenWidth * 0.82 , kScreenHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.tableFooterView = [UIView new];
        _tableView.rowHeight = 60;
        return _tableView;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HZIndexTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"HZIndexTableViewCell"];
    if (cell == nil) {
		cell = [[[NSBundle mainBundle]loadNibNamed:@"HZIndexTableViewCell" owner:nil options:nil]lastObject];
    }
	if (self.dataSource.count > 0) {
		NSString * string = self.dataSource[indexPath.row];
		NSArray * array = [string componentsSeparatedByString:@" "];
		cell.leftLabel.text = string;
		[cell.leftLabel setRich:array[0] fontSize:18 color:RGB(204, 204, 204)];
		if (string.isStringNotNum) {
			cell.leftSpace.constant = 41;
		}else{
			cell.leftSpace.constant = 14;
		}
	}
	
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self hideAnimation];
	if (self.block) {
		self.block(indexPath.row);
	}
}

@end

@implementation UIView (UIViewUtil)
-(void)addTarget:(id)Target  action:(SEL)selector {
    // 单击的 Recognizer
    UITapGestureRecognizer* singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:Target action:selector];
    //点击的次数
    self.userInteractionEnabled = YES;
    //    singleRecognizer.numberOfTapsRequired = 1; // 单击
    [self addGestureRecognizer:singleRecognizer];
}
@end

@implementation NSString (StringUtil)

-(NSString *)getStringToNum{
	NSCharacterSet* nonDigits =[[NSCharacterSet decimalDigitCharacterSet] invertedSet];
//	NSInteger remainSecond =[[self stringByTrimmingCharactersInSet:nonDigits] integerValue];
	return [self stringByTrimmingCharactersInSet:nonDigits];
}

-(BOOL)isStringNotNum{
	NSCharacterSet* nonDigits =[[NSCharacterSet decimalDigitCharacterSet] invertedSet];
		//	NSInteger remainSecond =[[self stringByTrimmingCharactersInSet:nonDigits] integerValue];
	if ([self stringByTrimmingCharactersInSet:nonDigits].length > 0) {
		return YES;
	}
	return NO;
}

@end

@implementation UILabel (UILabelUtil)

-(void)setStrsColor:(NSArray<NSString *> *)strs color:(UIColor *)color{
	NSString * oldStr = self.text;
	NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc]initWithString:oldStr];
	for (NSString * str in strs) {
		[attriStr addAttributes:@{NSForegroundColorAttributeName : color} range:[oldStr rangeOfString:str]];
	}
	self.attributedText = attriStr;
}

-(void)setRich:(NSString *)str fontSize:(CGFloat)fontSize color:(UIColor *)color{
	NSString * oldStr = self.text;
	NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc]initWithString:oldStr];
	[attriStr addAttributes:@{NSForegroundColorAttributeName : color,NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} range:[oldStr rangeOfString:str]];
	self.attributedText = attriStr;
}

@end
