//
//  HZIndexModel.h
//  IndexListView
//
//  Created by 智享城市iOS开发 on 2019/2/22.
//  Copyright © 2019年 智享城市iOS开发. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZIndexModel : NSObject

@property (strong, nonatomic) NSString *sectionTitle;
@property (strong, nonatomic) NSArray *rowArray;
@property (assign, nonatomic) double scroll_y;

@end

NS_ASSUME_NONNULL_END
