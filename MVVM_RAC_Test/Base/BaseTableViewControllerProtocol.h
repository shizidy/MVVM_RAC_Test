//
//  BaseTableViewControllerProtocol.h
//  MVVM_RAC_Test
//
//  Created by wdyzmx on 2020/4/9.
//  Copyright © 2020 wdyzmx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReactiveCocoa.h"
NS_ASSUME_NONNULL_BEGIN

@protocol BaseTableViewControllerProtocol <NSObject>

@optional
// tableView添加上拉加载，下拉刷新
- (void)pro_refreshData;
// 
- (void)configTableViewCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
