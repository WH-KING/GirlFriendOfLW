//
//  CookViewController.m
//  girlfriendOfLangWang
//
//  Created by 王浩 on 16/3/2.
//  Copyright © 2016年 wh-king.github.io. All rights reserved.
//

#import "CookViewController.h"

@interface CookViewController ()

@end

@implementation CookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = @"做饭";
    [self.titleLabel setTextWithoutMorphing:@"COOK"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
