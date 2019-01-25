//
//  ViewController.m
//  NativeForIos
//
//  Created by 张恒 on 2019/1/24.
//  Copyright © 2019年 张恒. All rights reserved.
//

#import "ViewController.h"
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSURL *jsCodeLocation;

    //网络加载(低版本)。手动拼接sCodeLocation，用于开发环境
//    jsCodeLocation = [NSURL URLWithString:@"http://192.168.1.104:8081/index.bundle?platform=ios"];
    
    //网络加载(高版本)。通过RCTBundleURLProvider生成，用于开发环境。jsBundleURLForBundleRoot为加载的js文件名
    jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
    
    //本地加载离线包。release之后从包中读取名为index的静态jsbundle
//    jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
    
    
    
    /*
     1、initWithBundleURL：用于设置jsCodeLocation，有上述三种设置方式，在开发阶段推荐使用RCTBundleURLProvider的形式生成jsCodeLocation，release只会使用静态js bundle。
     2、moduleName：用于指定要加载的JS 模块名，也就是在上文中所讲的在index.js中注册的模块名。
     3、launchOptions：主要是在AppDelegate中加载js bundle时使用，这里传nil就行。
     4、initialProperties：接收一个NSDictionary类型的参数作为RN初始化时传递给JS的初始化数据。
     */
    
    RCTRootView *rootView =
    [[RCTRootView alloc] initWithBundleURL: jsCodeLocation
                                moduleName: @"RNHighScores"
                         initialProperties:
     @{
       @"scores" : @[
               @{
                   @"name" : @"Alex",
                   @"value": @"42"
                   },
               @{
                   @"name" : @"Joel",
                   @"value": @"10"
                   }
               ]
       }
                             launchOptions: nil];
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view = rootView;
    [self presentViewController:vc animated:YES completion:nil];
}


@end
