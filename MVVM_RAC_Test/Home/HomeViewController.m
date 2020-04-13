//
//  HomeViewController.m
//  MVVM_RAC_Test
//
//  Created by wdyzmx on 2020/4/9.
//  Copyright © 2020 wdyzmx. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeViewModel.h"
#import "InfoViewModel.h"

@interface HomeViewController ()

@property (nonatomic, strong) HomeViewModel *viewModel;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"===========%@", self.viewModel);
    // Do any additional setup after loading the view.
}

- (void)pro_configSubViews {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 60)];
    button.center = self.view.center;
    [self.view addSubview:button];
    [button setTitle:@"跳转" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    
    
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"点击了button");
        InfoViewModel *viewModel = [[InfoViewModel alloc] initWithParams:@{@"title":@"详情"}];
        [self.viewModel pushViewModel:viewModel animated:YES];
    }];
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
