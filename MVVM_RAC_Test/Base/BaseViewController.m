//
//  BaseViewController.m
//  MVVM_RAC_Test
//
//  Created by wdyzmx on 2020/4/9.
//  Copyright © 2020 wdyzmx. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, strong) NSDictionary *params;
@property (nonatomic, strong) BaseViewModel *viewModel;

@end

@implementation BaseViewController

#pragma mark - allocWithZone
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    BaseViewController *viewController = [super allocWithZone:zone];
    @weakify(viewController);
    [[viewController rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
        @strongify(viewController);
        [viewController pro_bindViewModel];
        [viewController pro_loadData];
        [viewController pro_configSubViews];
        [viewController setTitleView];
        [viewController registViewModelProtocol];
    }];
    return viewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

#pragma mark - BaseViewControllerProtocol
- (instancetype)initWithViewModel:(BaseViewModel *)viewModel {
    if (self = [super init]) {
        self.viewModel = viewModel;
    }
    return self;
}

- (instancetype)initWithParams:(NSDictionary *)params {
    if (self = [super init]) {
        self.params = params;
        self.viewModel = [self mapViewModelWithParams:params];
    }
    return self;
}


- (void)pro_loadData {
    
}

- (void)pro_bindViewModel {
    
}

- (void)pro_configSubViews {
    
}

#pragma mark - setTitleView
- (void)setTitleView {
    RAC(self, title) = RACObserve(self.viewModel, title);
}

#pragma mark - 实现订阅
- (void)registViewModelProtocol {
    @weakify(self);
    [[self.viewModel rac_signalForSelector:@selector(pushViewModel:animated:)] subscribeNext:^(RACTuple *tuple) {
        @strongify(self);
        UIViewController *viewController = (UIViewController *)[self mapViewControllerForViewModel:tuple.first];
        [self.navigationController pushViewController:viewController animated:tuple.second];
    }];
    
    [[self.viewModel rac_signalForSelector:@selector(popViewModelAnimated:)] subscribeNext:^(RACTuple *tuple) {
        @strongify(self);
        [self.navigationController popViewControllerAnimated:[tuple.first boolValue]];
    }];
    
    [[self.viewModel rac_signalForSelector:@selector(popToRootViewModelAnimated:)] subscribeNext:^(RACTuple *tuple) {
        @strongify(self);
        [self.navigationController popToRootViewControllerAnimated:[tuple.first boolValue]];
    }];
    
    [[self.viewModel rac_signalForSelector:@selector(presentViewModel:animated:completion:)] subscribeNext:^(RACTuple *tuple) {
        @strongify(self);
        UIViewController *viewController = (UIViewController *)[self mapViewControllerForViewModel:tuple.first];
        
        if (![viewController isKindOfClass:UINavigationController.class]) {
            viewController = [[UINavigationController alloc] initWithRootViewController:viewController];
        }
        
        [self presentViewController:viewController animated:[tuple.second boolValue] completion:tuple.third];
    }];
    
    [[self.viewModel rac_signalForSelector:@selector(dismissViewModelAnimated:completion:)] subscribeNext:^(RACTuple *tuple) {
        @strongify(self);
        [self dismissViewControllerAnimated:[tuple.first boolValue] completion:tuple.second];
    }];
    
//    [[self.viewModel rac_signalForSelector:@selector(showHudMessage:)] subscribeNext:^(RACTuple *tuple) {
//        @strongify(self);
//        ShowMessageInView(self.view, tuple.first);
//    }];
//    [[self.viewModel rac_signalForSelector:@selector(showHudSuccess:)] subscribeNext:^(RACTuple *tuple) {
//        @strongify(self);
//        ShowSuccessInView(self.view, tuple.first);
//    }];
//    [[self.viewModel rac_signalForSelector:@selector(showHudError:)] subscribeNext:^(RACTuple *tuple) {
//        @strongify(self);
//        ShowErrorInView(self.view, tuple.first);
//    }];
//    [[self.viewModel rac_signalForSelector:@selector(showHint:)] subscribeNext:^(RACTuple *tuple) {
//        @strongify(self);
//        ShowHudInView(self.view, tuple.first);
//    }];
//    [[self.viewModel rac_signalForSelector:@selector(hideHud)] subscribeNext:^(id x) {
//        @strongify(self);
//        HideHudInView(self.view);
//    }];
}

- (BaseViewModel *)mapViewModelWithParams:(NSDictionary *)params {
    // 由viewController映射viewModel
    NSString *classString = NSStringFromClass([self class]);
    NSString *viewModelString = [classString stringByReplacingOccurrencesOfString:@"Controller" withString:@"Model"];
    BaseViewModel *viewModel = [[NSClassFromString(viewModelString) alloc] initWithParams:self.params];
    if (![viewModel isKindOfClass:[BaseViewModel class]]) {
        NSLog(@"未匹配到对应viewModel======>%@", [viewModel class]);
        return nil;
    }
    return viewModel;
}

- (UIViewController *)mapViewControllerForViewModel:(BaseViewModel *)viewModel {
    NSString *classString = NSStringFromClass([viewModel class]);
    NSString *viewControllerString = [classString stringByReplacingOccurrencesOfString:@"Model" withString:@"Controller"];
    UIViewController *viewController = [[NSClassFromString(viewControllerString) alloc] initWithViewModel:viewModel];
    if (![viewController isKindOfClass:[BaseViewController class]]) {
        NSLog(@"未匹配到对应viewController======>%@", [viewController class]);
        return nil;
    }
    return viewController;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
