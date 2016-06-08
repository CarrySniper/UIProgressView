# UIProgressView
进度条显示器


##效果图
![](https://github.com/cjq002/UIProgressView/raw/master/Media/video.gif)

##创建、初始化UI控件
```
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
```
##设置图片 改变高度
```
    //设置痕迹图片    （setProgressTintColor将失效）
    UIImage *progressImage = [UIImage imageNamed:@"tint"];
    self.progressView.progressImage = progressImage;
    
    //设置进度图片    （setTrackTintColor将失效）
    UIImage *trackImage = [UIImage imageNamed:@"track"];
    self.progressView.trackImage = trackImage;
    
    //放大进度条高度 代表x和y方向缩放倍数
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 15.0f);
```
