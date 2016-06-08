//
//  ViewController.m
//  UIProgressView
//
//  Created by 思久科技 on 16/6/7.
//  Copyright © 2016年 Seejoys. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIProgressView *progressView;

@property (strong, nonatomic) UIProgressView *progressView1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"UIProgressView";
    
    //创建颜色进度条
    self.progressView = [self createProgressView];
    //高度默认为2
    self.progressView.frame = CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 2);
    [self.view addSubview:self.progressView];
    
    //创建图片进度条
    self.progressView1 = [self createProgressView];
    self.progressView1.frame = CGRectMake(0, 150, CGRectGetWidth(self.view.frame), 2);
    [self.view addSubview:self.progressView1];
    
    //设置痕迹图片    （setProgressTintColor将失效）
    UIImage *progressImage = [UIImage imageNamed:@"tint"];
    self.progressView1.progressImage = progressImage;
    
    //设置进度图片    （setTrackTintColor将失效）
    UIImage *trackImage = [UIImage imageNamed:@"track"];
    self.progressView1.trackImage = trackImage;
    
    //放大进度条高度 代表x和y方向缩放倍数
    self.progressView1.transform = CGAffineTransformMakeScale(1.0f, 15.0f);
    
    //设置定时器 0.05秒调用一次
    [NSTimer scheduledTimerWithTimeInterval:0.05
                                     target:self
                                   selector:@selector(progressChanged:)
                                   userInfo:nil
                                    repeats:YES];
    
}

#pragma mark - 设置定时器
- (void)progressChanged:(NSTimer *)timer
{
    _progressView.progress += 0.005;
    //让对象的progress值每次都加0.02，以此达到让进度动起来的效果
    if (_progressView.progress >= 1.0) {
        _progressView.progress = 0.0;
    }
    _progressView1.progress += 0.005;
    //让对象的progress值每次都加0.02，以此达到让进度动起来的效果
    if (_progressView1.progress >= 1.0) {
        _progressView1.progress = 0.0;
    }
}

#pragma mark - 创建、初始化UI控件
- (UIProgressView *)createProgressView
{
    //初始化
    UIProgressView *progressView = [[UIProgressView alloc] init];
    //设置风格
    progressView.progressViewStyle = UIProgressViewStyleDefault;
    //进度，属性progress是一个0.0到1.0之间的浮点数：
    progressView.progress = 0.0;
    //设置进度痕迹颜色
    progressView.progressTintColor = [UIColor redColor];
    //设置轨道痕迹颜色
    progressView.trackTintColor = [UIColor cyanColor];
    //设置进度 显示动画与否
    [progressView setProgress:0.5 animated:YES];
    
    return progressView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
