//
//  BaseViewController.h
//  MVVM_RAC_Test
//
//  Created by wdyzmx on 2020/4/9.
//  Copyright © 2020 wdyzmx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewControllerProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController <BaseViewControllerProtocol>

@property (nonatomic, strong) RACSubject *completionSubject;

@end

NS_ASSUME_NONNULL_END
