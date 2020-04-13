//
//  BaseViewControllerProtocol.h
//  MVVM_RAC_Test
//
//  Created by wdyzmx on 2020/4/9.
//  Copyright © 2020 wdyzmx. All rights reserved.
//

#import <Foundation/Foundation.h>
// BaseViewController协议
#import "BaseViewModel.h"
#import "ReactiveCocoa.h"
NS_ASSUME_NONNULL_BEGIN

@protocol BaseViewControllerProtocol <NSObject>

@optional
- (instancetype)initWithViewModel:(BaseViewModel *)viewModel;

- (instancetype)initWithParams:(NSDictionary *)params;

- (void)pro_bindViewModel;

- (void)pro_loadData;

- (void)pro_configSubViews;

@end

NS_ASSUME_NONNULL_END
