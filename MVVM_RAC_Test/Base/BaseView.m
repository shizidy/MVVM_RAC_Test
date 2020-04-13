//
//  BaseView.m
//  MVVM_RAC_Test
//
//  Created by wdyzmx on 2020/4/10.
//  Copyright © 2020 wdyzmx. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //
    }
    return self;
}

- (instancetype)initWithViewModel:(BaseViewModel *)viewModel {
    if (self = [super init]) {
        //
    }
    return self;
}

- (void)pro_configSubViews {
    
}

- (void)pro_bindViewModel {
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
