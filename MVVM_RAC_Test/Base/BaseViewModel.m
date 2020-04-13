//
//  BaseViewModel.m
//  MVVM_RAC_Test
//
//  Created by wdyzmx on 2020/4/9.
//  Copyright © 2020 wdyzmx. All rights reserved.
//

#import "BaseViewModel.h"

@interface BaseViewModel ()
// readwrite
@property (nonatomic, copy, readwrite) NSDictionary *params;
@property (nonatomic, strong, readwrite) RACCommand *loadDataCommand;
@property (nonatomic, strong, readwrite) RACCommand *universalCommand;
@property (nonatomic, strong, readwrite) RACSubject *callbackSubject;

@end

@implementation BaseViewModel 

#pragma mark - allocWithZone
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    BaseViewModel *viewModel = [super allocWithZone:zone];
    @weakify(viewModel);
    [[viewModel rac_signalForSelector:@selector(initWithParams:)] subscribeNext:^(id x) {
        @strongify(viewModel);
        [viewModel pro_initialize];
    }];
    return viewModel;
}

#pragma mark - BaseViewModelProtocol
- (instancetype)initWithParams:(NSDictionary *)params {
    if (self = [super init]) {
        self.params = params;
        self.title = params[@"title"] ?: @"";
    }
    return self;
}

- (void)pro_initialize {
    
}

- (void)pushViewModel:(BaseViewModel *)viewModel animated:(BOOL)animated {
    
}

- (void)popViewModelAnimated:(BOOL)animated {
    
}

- (void)popToRootViewModelAnimated:(BOOL)animated {
    
}

- (void)presentViewModel:(BaseViewModel *)viewModel animated:(BOOL)animated completion:(dispatch_block_t)completion {
    
}

- (void)dismissViewModelAnimated:(BOOL)animated completion:(dispatch_block_t)completion {
    
}

- (void)showHudMessage:(NSString *)message {
    
}

- (void)showHudSuccess:(NSString *)message {
    
}

- (void)showHudError:(NSString *)message {
    
}

- (void)showHint:(NSString *)hintText {
    
}

- (void)hideHud {
    
}

#pragma mark - 懒加载
- (RACCommand *)loadDataCommand {
    if (!_loadDataCommand) {
        @weakify(self);
        _loadDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            @strongify(self);
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                @strongify(self);
                if ([self respondsToSelector:@selector(loadData:subscriber:)]) {
                    [self loadData:input subscriber:subscriber];
                }
                return nil;
            }];
        }];
    }
    return _loadDataCommand;
}

- (RACCommand *)universalCommand {
    if (!_universalCommand) {
        @weakify(self);
        _universalCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
            @strongify(self);
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                @strongify(self);
                if ([self respondsToSelector:@selector(universalRACCommand:subscriber:)]) {
                    [self universalRACCommand:input subscriber:subscriber];
                }
                return nil;
            }];
        }];
    }
    return _universalCommand;
}

- (RACSubject *)callbackSubject {
    if (!_callbackSubject) {
        _callbackSubject = [RACSubject subject];
    }
    return _callbackSubject;
}

@end
