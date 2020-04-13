//
//  BaseViewProtocol.h
//  MVVM_RAC_Test
//
//  Created by wdyzmx on 2020/4/10.
//  Copyright © 2020 wdyzmx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol BaseViewProtocol <NSObject>

@optional
- (instancetype)initWithViewModel:(BaseViewModel *)viewModel;

- (void)pro_bindViewModel;

- (void)pro_configSubViews;

@end

NS_ASSUME_NONNULL_END
