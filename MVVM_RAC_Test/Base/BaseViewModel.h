//
//  BaseViewModel.h
//  MVVM_RAC_Test
//
//  Created by wdyzmx on 2020/4/9.
//  Copyright © 2020 wdyzmx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewModel : NSObject <BaseViewModelProtocol>
/**
initial parameters
*/
@property (nonatomic, copy, readonly) NSDictionary *params;
/**
title of viewController
*/
@property (nonatomic, copy) NSString *title;
/**
subTitle of viewController
*/
@property (nonatomic, copy) NSString *subTitle;
// readonly
@property (nonatomic, strong, readonly) RACCommand *loadDataCommand;
@property (nonatomic, strong, readonly) RACCommand *universalCommand;
@property (nonatomic, strong, readonly) RACSubject *callBackSubject;

@end

NS_ASSUME_NONNULL_END
