//
//  MusicViewController.h
//  girlfriendOfLangWang
//
//  Created by 王浩 on 16/3/2.
//  Copyright © 2016年 wh-king.github.io. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^pushBlock)(NSString *className);

@interface MusicViewController : BaseViewController

@property (copy, nonatomic) pushBlock block;

@end
