//
//  MenuViewController.m
//  girlfriendOfLangWang
//
//  Created by 王浩 on 16/3/2.
//  Copyright © 2016年 wh-king.github.io. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuViewControllerCell.h"
#import "AllMusicViewController.h"

@interface MenuViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *iconArr;
@property (strong, nonatomic) NSArray *menuArr;
@property (strong, nonatomic) NSArray *vcArr;

@property (strong, nonatomic) UITableViewCell *lastCell;

@end

@implementation MenuViewController

- (NSArray *)vcArr {
    if (!_vcArr) {
        _vcArr = @[@"AllMusicViewController", @"ILikeViewController", @"LastMusicViewController", @"DownloadViewController", @"DownloadMVViewController", @"IdentifyViewController"];
    }
    return _vcArr;
}

- (NSArray *)iconArr {
    if (!_iconArr) {
        _iconArr = @[@"menu_all_music", @"menu_like_music", @"menu_last_music", @"menu_add_music", @"menu_mv_music", @"menu_identify_music"];
    }
    return _iconArr;
}

- (NSArray *)menuArr {
    if (!_menuArr) {
        _menuArr = @[@"全部歌曲", @"我喜欢", @"最近播放", @"下载歌曲", @"下载MV", @"听歌识曲"];
    }
    return _menuArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"MenuViewControllerCell" bundle:nil] forCellReuseIdentifier:@"MenuViewControllerCell"];
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.iconArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MenuViewControllerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuViewControllerCell"];
    
    cell.icon.image = [UIImage imageNamed:self.iconArr[indexPath.row]];
    cell.menu.text = self.menuArr[indexPath.row];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MenuViewControllerCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (![self.lastCell isEqual:cell]) {
        self.block(self.vcArr[indexPath.row]);
    }else {
        self.block(nil);
    }
    self.lastCell = cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
