//
//  AllMusicViewController.m
//  girlfriendOfLangWang
//
//  Created by 王浩 on 16/3/3.
//  Copyright © 2016年 wh-king.github.io. All rights reserved.
//

#import "AllMusicViewController.h"


@interface AllMusicViewController ()<ASValueTrackingSliderDataSource>

@property (strong, nonatomic) ASValueTrackingSlider *progressSlider;
@property (assign, nonatomic) NSUInteger *currentIndex;
@property (strong, nonatomic) NSArray *netMusicArr;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation AllMusicViewController

- (NSString *)slider:(ASValueTrackingSlider *)slider stringForValue:(float)value {
    NSString *lrc = [NSString stringWithFormat:@"🎵%@🎵", @"此处应该是歌词XXXX"];
    return lrc;
}

- (ASValueTrackingSlider *)progressSlider {
    if (!_progressSlider) {
        _progressSlider = [[ASValueTrackingSlider alloc] initWithFrame:CGRectMake(20, HEIGHT * 0.7, WIDTH - 40, 15)];
        _progressSlider.maximumValue = 1.0;
        _progressSlider.popUpViewCornerRadius = 10.0;
        _progressSlider.popUpViewColor = [UIColor colorWithHue:0.55 saturation:0.5 brightness:0.9 alpha:0.6];
        _progressSlider.popUpViewAnimatedColors = @[[UIColor purpleColor], [UIColor cyanColor], [UIColor orangeColor]];
        [_progressSlider addTarget:self action:@selector(progressValueChanged:) forControlEvents:UIControlEventValueChanged];
        _progressSlider.dataSource = self;
        
    }
    return _progressSlider;
}

- (void)progressValueChanged:(ASValueTrackingSlider *)sender {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    label.text = @"全部音乐";
    [self.view addSubview:label];
    [self.view addSubview:self.progressSlider];
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
