//
//  ViewControllerStart.m
//  sidafjisdjfiojsdjfiasfsdfsd
//
//  Created by 川端伸彦 on 2014/07/06.
//  Copyright (c) 2014年 kawabata. All rights reserved.
//

#import "ViewControllerStart.h"
#import "ViewControllers.h"
@interface ViewControllerStart ()

@end

@implementation ViewControllerStart
{
    UIButton *startButton;
    UIProgressView *progressView1;
    

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        startButton.titleLabel.shadowColor = [UIColor redColor];
        startButton.titleLabel.shadowOffset = CGSizeMake(5, 5);
        //なぜ影が付かない
   
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    CGSize pSize = progressView.frame.size;
//    CGSize vSize = self.view.frame.size;
  //  progressView.frame = CGRectMake((vSize.width - pSize.width)/2, (vSize.height - pSize.height)/2, pSize.width, pSize.height);
        
    [self.view addSubview:progressView1];
    
    
    //ボタンのキャプションを設定
    [startButton setTitle:@"スタート" forState:UIControlStateNormal];
    
    //サイズの自動調整
    [startButton sizeToFit];
    //ボタンを画面中心に移動
    startButton.center = self.view.center;
    //位置を自動調整
    startButton.autoresizingMask = UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleHeight |
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleBottomMargin |
    UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleLeftMargin ;
    //ボタンを押したときのイベント
    [startButton addTarget:self action:@selector(buttonDidPush) forControlEvents:UIControlEventTouchUpInside];
    
    
    //ボタンを画面に追加
    
    
    [self.view addSubview:startButton];
    
    
}
- (void)buttonDidPush
{
    UIViewController *next = [[MainViewController alloc] init];
    next.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:next animated:YES completion:^ {
        // 完了時の処理をここに書きます
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self updateProgress:progressView1];

}

- (void)updateProgress:(UIProgressView*)progressView
{
//     [progressView setProgress:progressView.progress+0.05 animated:YES];
    progressView1.progress += 0.1;
    [self performSelector:@selector(updateProgress:)
               withObject:progressView
               afterDelay:1.0];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end



@implementation ViewControllerStart111

@end
