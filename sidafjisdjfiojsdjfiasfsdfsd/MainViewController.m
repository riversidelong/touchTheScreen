//
//  MainViewController.m
//  sidafjisdjfiojsdjfiasfsdfsd
//
//  Created by 川端伸彦 on 2014/07/05.
//  Copyright (c) 2014年 kawabata. All rights reserved.
//

#import "ViewControllers.h"

#import "MainViewController.h"
#import <AudioToolbox/AudioServices.h>
@interface MainViewController ()

@end

@implementation MainViewController
{
    UIButton *startButton;
    UIButton *clearButton;
    UIProgressView *progressView1;

    
    UILabel *touchNumber;
    UILabel *timeLabel;
    int cou;
    NSDate *startDate;
    NSTimer *timer;
    

    
}
@synthesize soundID;
@synthesize soundURL;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//ボタンの初期化
        startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                  clearButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        touchNumber = [[UILabel alloc] init];
        timeLabel = [[UILabel alloc] init];
        startDate = [[NSDate alloc] init];
        timer = [[NSTimer alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //ボタンのキャプションを設定
    [startButton setTitle:@"タッチ" forState:UIControlStateNormal];
    
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
    [self.view addSubview:timeLabel];
    
    
    
    
    
    progressView1 = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    progressView1.frame = CGRectMake(70, 250, progressView1.frame.size.width, progressView1.frame.size.height);
    [self.view addSubview:progressView1];
    
    
}

- (void)buttonDidPush
                  {
               
                      
                      NSLog(@"押された");
                      touchNumber.text = [NSString stringWithFormat:@"%d", cou];
                      cou = [[touchNumber text] intValue];
                      cou++;
                      NSLog(@"%d = counter" , cou);
                      
                      
                      [touchNumber sizeToFit];
                      //ボタンを画面中心に移動
                      touchNumber.center = CGPointMake(200, 100);
                      //位置を自動調整
                      touchNumber.autoresizingMask = UIViewAutoresizingFlexibleWidth |
                      UIViewAutoresizingFlexibleHeight |
                      UIViewAutoresizingFlexibleTopMargin|
                      UIViewAutoresizingFlexibleBottomMargin |
                      UIViewAutoresizingFlexibleRightMargin |
                      UIViewAutoresizingFlexibleLeftMargin ;
                      if(cou >= 2) {
                          startButton.alpha = 0.0f;
                      }
                      
                      
                      
                      
                      //サイズの自動調整
                      [timeLabel sizeToFit];
                      //ボタン、位置
                      timeLabel.center = CGPointMake(100, 100);
                      //位置を自動調整
                      timeLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth |
                      UIViewAutoresizingFlexibleHeight |
                      UIViewAutoresizingFlexibleTopMargin|
                      UIViewAutoresizingFlexibleBottomMargin |
                      UIViewAutoresizingFlexibleRightMargin |
                      UIViewAutoresizingFlexibleLeftMargin ;
                 
                      
                      
                      
                      startDate = [NSDate date];
                      [timer invalidate];
                      timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                                    target:self
                                                                  selector:@selector(timerUpdate:)
                                                                  userInfo:nil
                                                                   repeats:YES];
        
                       [self.view addSubview:touchNumber];
                      
                     

                  }



- (void)timerUpdate:(NSTimer *)timer
{
    
    NSUInteger time = (NSUInteger)[[NSDate date] timeIntervalSinceDate:
                                   startDate];
  
    
    NSUInteger hour = time / (60 * 60);
    NSUInteger minute = (time % (60 * 60)) / 60;
    NSUInteger second = (time % (60 * 60)) % 60;
  
    timeLabel.text = [NSString stringWithFormat:@"%02d:%02d:%02d",
                           hour, minute, second];
   
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
#pragma marl sound/////////////
//    CFBundleRef mainBundle;
//    mainBundle = CFBundleGetMainBundle();
//    soundURL = CFBundleCopyResourceURL(mainBundle, CFSTR("wii") , CFSTR("aif"), NULL);
//    AudioServicesCreateSystemSoundID(soundURL, &soundID);
//   CFRelease(soundURL);
//    AudioServicesPlaySystemSound(soundID);
//    NSLog(@"%@", soundURL);
    
    
     AudioServicesPlaySystemSound(1001);
    //--------------------
  touchNumber.text = [NSString stringWithFormat:@"%d", cou];
    cou = [[touchNumber text] intValue];
  
    NSLog(@"%d = counter" , cou);
    
    
    [touchNumber sizeToFit];
    //ボタンを画面中心に移動
    touchNumber.center = CGPointMake(200, 100);
    //位置を自動調整
    touchNumber.autoresizingMask = UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleHeight |
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleBottomMargin |
    UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleLeftMargin ;
    
    if(cou >= 3) {
        startButton.alpha = 0.0f;
    }
    
    if ( cou == 11)
    {
        [timer invalidate];
        timer = nil;
        
        [UIView animateWithDuration:0.5f animations:^{
            
        } completion:^(BOOL finished) {
            NSString *title = @"ゲームクリア！";
            NSString *message = [NSString stringWithFormat:
                                 @"タイムは %@ です", timeLabel.text];
            [[[UIAlertView alloc] initWithTitle:title
                                        message:message
                                       delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil] show];
        }];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle:@"クリア!" forState:UIControlStateNormal]; //後で色々試す
        [button sizeToFit];
        CGPoint newPoint = self.view.center;
        
        button.center = newPoint;
        button.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
        [button addTarget:self action:@selector(buttonDidModal) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        startButton.alpha = 0.0f;
        touchNumber.alpha = 0.0f;
        
    }
    while (cou > 11)
    {
        continue;
    }
     cou++;
     [self.view addSubview:touchNumber];
}

- (void)buttonDidModal
{
    UIViewController *next = [[SubViewController alloc] init];
    next.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:next animated:YES completion:^ {
        // 完了時の処理をここに書きます
    }];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self updateProgress:progressView1];
    
}
- (void)updateProgress:(UIProgressView*)progressView
{
    //     [progressView setProgress:progressView.progress+0.05 animated:YES];
    progressView1.progress = cou*0.1;
    [self performSelector:@selector(updateProgress:)
               withObject:progressView
               afterDelay:1.0];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
