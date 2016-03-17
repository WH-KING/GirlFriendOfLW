//
//  BaseViewController.m
//  girlfriendOfLangWang
//
//  Created by 王浩 on 16/3/2.
//  Copyright © 2016年 wh-king.github.io. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (TOMSMorphingLabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[TOMSMorphingLabel alloc] initWithFrame:CGRectMake(0, 0, 150, 40)];
        _titleLabel.text = @"";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.animationDuration = 1.0;
        _titleLabel.textColor = [UIColor orangeColor];
        [_titleLabel setTextWithoutMorphing:@""];
        _titleLabel.font = [UIFont boldSystemFontOfSize:20];
    }
    return _titleLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = self.titleLabel;
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
