//
//  RootViewController.m
//  girlfriendOfLangWang
//
//  Created by 王浩 on 16/3/2.
//  Copyright © 2016年 wh-king.github.io. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()<UIScrollViewDelegate, EAIntroDelegate>

@property (strong, nonatomic) UINavigationController *musicNaVC;
@property (strong, nonatomic) UINavigationController *movieNaVC;
@property (strong, nonatomic) UINavigationController *cookNaVC;
@property (strong, nonatomic) UINavigationController *nearNaVC;
@property (strong, nonatomic) UINavigationController *playNaVC;

@end

@implementation RootViewController

- (void)setupIntroView {
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"introView_first_launch"] ) {
        
        EAIntroPage *page1 = [EAIntroPage page];
        page1.title = @"音乐像风，像雾，更像药...";
        page1.titleFont = [UIFont fontWithName:@"Georgia-BoldItalic" size:22];
        page1.titlePositionY = HEIGHT / 2;
        page1.desc = @"音乐是比一切智慧、一切哲学更高的启示，谁能渗透我音乐的意义，便能超脱寻常人无以自拔的苦难。\n——贝多芬";
        page1.descFont = [UIFont systemFontOfSize:17];
        page1.bgImage = [UIImage imageNamed:@"music_bg"];
        
        UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH / 3, WIDTH / 3)];
        imageView1.layer.cornerRadius = WIDTH / 6
        ;
        imageView1.clipsToBounds = YES;
        imageView1.image = [UIImage imageNamed:@"music_fg"];
        page1.titleIconView = imageView1;
        
        
        EAIntroPage *page2 = [EAIntroPage page];
        page2.title = @"电影像海，像天，更像家...";
        page2.titleFont = [UIFont fontWithName:@"Georgia-BoldItalic" size:22];
        page2.titlePositionY = HEIGHT / 2;
        
        page2.desc = @"我现在已经老了，人越老想得越深，水面上的事情我已经抓不住了，我在水底思想。\n——让-吕克·戈达尔";
        page2.descFont = [UIFont systemFontOfSize:17];
        page2.bgImage = [UIImage imageNamed:@"movie_bg"];
        
        UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH / 3, WIDTH / 3)];
        imageView2.layer.cornerRadius = WIDTH / 6
        ;
        imageView2.clipsToBounds = YES;
        imageView2.image = [UIImage imageNamed:@"movie_fg"];
        page2.titleIconView = imageView2;
        
        EAIntroPage *page3 = [EAIntroPage page];
        page3.title = @"妹纸就像风一样自由...";
        page3.titleFont = [UIFont fontWithName:@"Georgia-BoldItalic" size:22];
        page3.titlePositionY = HEIGHT / 2;
        page3.desc = @"对于撸代码的屌丝来说，女朋友是一种奢侈品。\n——会敲代码的资深屌丝";
        page3.descFont = [UIFont systemFontOfSize:17];
        page3.bgImage = [UIImage imageNamed:@"chat_bg"];
        
        UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH / 3, WIDTH / 3)];
        imageView3.layer.cornerRadius = WIDTH / 6
        ;
        imageView3.clipsToBounds = YES;
        imageView3.image = [UIImage imageNamed:@"chat_fg"];
        page3.titleIconView = imageView3;
        
        
        
        EAIntroView *introView = [[EAIntroView alloc] initWithFrame:BOUNDS andPages:@[page1, page2,page3]];
        
        
        
        introView.delegate = self;
        [introView showInView:self.view animateDuration:0];
    }
}

- (UINavigationController *)musicNaVC {
    if (!_musicNaVC) {
        MusicViewController *musicVC = [[MusicViewController alloc] init];
        _musicNaVC = [[UINavigationController alloc] initWithRootViewController:musicVC];
        _musicNaVC.tabBarItem.image = [[UIImage imageNamed:@"music_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _musicNaVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"music_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    }
    return _musicNaVC;
}

- (UINavigationController *)movieNaVC {
    if (!_movieNaVC) {
        MovieViewController *movieVC = [[MovieViewController alloc] init];
        _movieNaVC = [[UINavigationController alloc] initWithRootViewController:movieVC];
        [_movieNaVC.tabBarItem setImage:[[UIImage imageNamed:@"movie_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        _movieNaVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"movie_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _movieNaVC;
}

- (UINavigationController *)cookNaVC {
    if (!_cookNaVC) {
        CookViewController *cookVC = [[CookViewController alloc] init];
        _cookNaVC = [[UINavigationController alloc] initWithRootViewController:cookVC];
        _cookNaVC.tabBarItem.image = [[UIImage imageNamed:@"cook_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _cookNaVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"cook_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _cookNaVC;
}

- (UINavigationController *)nearNaVC {
    if (!_nearNaVC) {
        NearViewController *nearVC = [[NearViewController alloc] init];
        _nearNaVC = [[UINavigationController alloc] initWithRootViewController:nearVC];
        _nearNaVC.tabBarItem.image = [[UIImage imageNamed:@"near_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _nearNaVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"near_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _nearNaVC;
}

- (UINavigationController *)playNaVC {
    if (!_playNaVC) {
        PlayViewController *playVC = [[PlayViewController alloc] init];
        _playNaVC = [[UINavigationController alloc] initWithRootViewController:playVC];
        _playNaVC.tabBarItem.image = [[UIImage imageNamed:@"play_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _playNaVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"play_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _playNaVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewController:self.musicNaVC];
    [self addChildViewController:self.movieNaVC];
    [self addChildViewController:self.cookNaVC];
    [self addChildViewController:self.nearNaVC];
    [self addChildViewController:self.playNaVC];
    [[UITabBar appearance] setTintColor:[UIColor orangeColor]];
    [self setupIntroView];
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
