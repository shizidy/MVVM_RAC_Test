//
//  BaseTableViewController.h
//  MVVM_RAC_Test
//
//  Created by wdyzmx on 2020/4/9.
//  Copyright © 2020 wdyzmx. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseTableViewControllerProtocol.h"
#import "PlaceholderView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewController : BaseViewController <BaseTableViewControllerProtocol, UITableViewDelegate, UITableViewDataSource>
/// 无数据时占位view
@property (nonatomic, strong) PlaceholderView *placeholderView;
/// tablView
@property (nonatomic, strong) UITableView *tableView;
/// tableViewStyle
@property (nonatomic, assign) UITableViewStyle tableViewStyle;
/// tableViewCellStyle
@property (nonatomic, assign) UITableViewCellStyle tableViewCellStyle;
/// numberOfSections
@property (nonatomic, assign) NSInteger numberOfSections;
/// numberOfRows
@property (nonatomic, assign) NSInteger numberOfRows;
/// tableViewRowHeight
@property (nonatomic, assign) CGFloat tableViewRowHeight;
/// sectionFooterHeight
@property (nonatomic, assign) CGFloat sectionFooterHeight;
/// sectionHeaderHeight
@property (nonatomic, assign) CGFloat sectionHeaderHeight;
/// tableViewRowSelectBlock回调block
@property (nonatomic, copy) void (^tableViewRowSelectBlock)(NSIndexPath *indexPath);

@end

NS_ASSUME_NONNULL_END
