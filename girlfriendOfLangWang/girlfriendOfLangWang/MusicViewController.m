//
//  MusicViewController.m
//  girlfriendOfLangWang
//
//  Created by 王浩 on 16/3/2.
//  Copyright © 2016年 wh-king.github.io. All rights reserved.
//

#import "MusicViewController.h"
#import "ContentViewController.h"
#import "MenuViewController.h"
#import <VBFPopFlatButton.h>
#import "AllMusicViewController.h"

@interface MusicViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic) ContentViewController *contentVC;
@property (strong, nonatomic) MenuViewController *menuVC;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) VBFPopFlatButton *popLeftButton;
@property (strong, nonatomic) UINavigationController *contentNaVC;

@end

@implementation MusicViewController

#pragma mark - left menu button
- (VBFPopFlatButton *)popLeftButton {
    if (!_popLeftButton) {
        _popLeftButton = [[VBFPopFlatButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30) buttonType:buttonMenuType buttonStyle:buttonPlainStyle animateToInitialState:YES];
        _popLeftButton.lineThickness = 1.5;
        _popLeftButton.tintColor = [UIColor blackColor];
        [_popLeftButton addTarget:self action:@selector(menuClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _popLeftButton;
}

- (void)menuClick:(VBFPopFlatButton *)sender {
    
    if (sender.currentButtonType == buttonMenuType) {
        [sender animateToType:buttonBackType];
        [UIView animateWithDuration:0.3 animations:^{
            self.scrollView.contentOffset = CGPointMake(- 75, 0);
        }];
    }else {
        [sender animateToType:buttonMenuType];
        [UIView animateWithDuration:0.3 animations:^{
            self.scrollView.contentOffset = CGPointMake(0, 0);
        }];
    }

}

#pragma mark - setup basis offset
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x == 0) {
        [self.popLeftButton animateToType:buttonMenuType];
    }else if (scrollView.contentOffset.x < 0) {
        [self.popLeftButton animateToType:buttonBackType];
    }
    scrollView.pagingEnabled = scrollView.contentOffset.x < - 74 ? NO : YES;
}

#pragma mark - menu view controller
- (MenuViewController *)menuVC {
    if (!_menuVC) {
        _menuVC = [[MenuViewController alloc] init];
        _menuVC.view.frame = CGRectMake(- 75, 0, 75, HEIGHT - 64 - 49);
    }
    return _menuVC;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT - 49 - 64)];
        _scrollView.contentSize = CGSizeMake(WIDTH, 0);
        _scrollView.contentInset = UIEdgeInsetsMake(0, 75, 0, 0);
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.bounces = NO;
        _scrollView.delegate = self;
        _scrollView.scrollEnabled = NO;
    }
    return _scrollView;
}

#pragma mark - content view controller
- (UINavigationController *)contentNaVC {
    if (!_contentNaVC) {
        _contentNaVC = [[UINavigationController alloc] initWithRootViewController:self.contentVC];
        _contentNaVC.navigationBarHidden = YES;
    }
    return _contentNaVC;
}

- (ContentViewController *)contentVC {
    if (!_contentVC) {
        _contentVC = [[ContentViewController alloc] init];
        _contentVC.view.frame = CGRectMake(0, 0, WIDTH, HEIGHT - 64 - 49);
    }
    return _contentVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.titleLabel.text = @"音乐";
    [self.titleLabel setTextWithoutMorphing:@"MUSIC"];
    [self.view addSubview:self.scrollView];
    
    [self addChildViewController:self.contentNaVC];
    [self.scrollView addSubview:self.contentNaVC.view];
    
    [self addChildViewController:self.menuVC];
    [self.scrollView addSubview:self.menuVC.view];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.popLeftButton];
    
    __unsafe_unretained __typeof(self) weakSelf = self;
    
    self.block = ^(NSString *className) {
        if (className) {
            Class vc = NSClassFromString(className);
            UIViewController *nextVC = [[vc alloc] init];
            [weakSelf.contentNaVC pushViewController:nextVC animated:NO];
        }
        [UIView animateWithDuration:0.3 animations:^{
            weakSelf.scrollView.contentOffset = CGPointMake(0, 0);
        }];
    };
  
    self.menuVC.block = self.block;
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
