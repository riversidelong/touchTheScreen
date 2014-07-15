    //
//  SubViewController.m
//  sidafjisdjfiojsdjfiasfsdfsd
//
//  Created by 川端伸彦 on 2014/07/05.
//  Copyright (c) 2014年 kawabata. All rights reserved.
//

#import "SubViewController.h"

@interface SubViewController ()

@end

@implementation SubViewController
{
    //ボタン作成
    UIButton *button;
    UILabel *label_;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //ボタン初期か
        button = [[UIButton alloc] init];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
#pragma mark UIImageView
    //UIImageViewを作成して画面に貼付け
    UIImage *imag2 = [UIImage imageNamed:@"star.png"];
    star_ = [[UIImageView alloc] initWithImage:imag2]; //star_はクラス変数
    star_.center = CGPointMake(0, 0);
    
    [self.view addSubview:star_];
    
    
#pragma mark button
//ボタンのキャプションを設定
    [button setTitle:@"Congraturation!" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    //サイズ
    [button sizeToFit];
    //文字フォント
    button.titleLabel.font = [UIFont fontWithName:@"Georgia" size:(30)];
    button.frame = self.view.bounds;
    //位置
    button.autoresizingMask = UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleHeight |
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleBottomMargin |
    UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleLeftMargin ;
//ボタンを中心に
    button.center = self.view.center;
    
    //ボタン押した時のイベント
    [button addTarget:self action:@selector(buttonDidPush) forControlEvents:UIControlEventTouchUpInside];
    
    //ボタンを画面に追加
    [self.view addSubview:button];
    
#pragma mark Label
    //ラベルの作成、初期化
    label_ = [[UILabel alloc] init];
    label_.frame = CGRectMake(0, self.view.bounds.size.height - 20, 320, 20);
    label_.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |
    UIViewAutoresizingFlexibleBottomMargin;
    label_.textAlignment = NSTextAlignmentCenter;
    label_.text = @"UIViewAnimationCurveEaseInOut";
    [self.view addSubview:label_];
 
    
    
    
    
    
    
    
}
- (void)buttonDidPush
{
    NSLog(@"ボタンが押されたぞおおおおおおおお");
    static UIViewAnimationCurve animationCurve = UIViewAnimationCurveEaseInOut;
    
    
    star_.center = CGPointMake(0, 0); //絵が始まる位置
    [UIView beginAnimations:nil context:NULL]; //アニメーションブロックの開始
    [UIView setAnimationDuration:2.0];
    [UIView setAnimationCurve:animationCurve];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationRepeatCount:10];
    star_.center = CGPointMake(420, 420); //絵が移動し終わる位置
    [UIView commitAnimations]; //アニメーションブロックの完了
    
    //ラベルに現在のアニメーションカーブを表示
    switch (animationCurve) {
        case UIViewAnimationCurveEaseInOut :
            label_.text = @"UIViewAnimationCurveEaseInOut";
            break;
        case UIViewAnimationCurveEaseIn:
            label_.text = @"UIViewAnimationCurveEaseIn";
            break;
        case UIViewAnimationCurveEaseOut:
            label_.text = @"UIViewAnimationCurveEaseOut";
            break;
        case UIViewAnimationCurveLinear:
            label_.text = @"UIViewAnimationCurveLinear";
            break;
            
        default:
            label_.text = @"-";
            break;
    }
    
    //アニメーションカーブの変更
    if(UIViewAnimationCurveLinear < ++animationCurve)
    {
        animationCurve = UIViewAnimationCurveEaseInOut;
    }

//    [self dismissViewControllerAnimated:YES completion:^{
//        // 完了時の処理をここに書きます
//        
//    }];
}

//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"おさおいお");
//    star_.center = CGPointMake(0, 0); //絵が始まる位置
//    [UIView beginAnimations:nil context:NULL]; //アニメーションブロックの開始
//    [UIView setAnimationDuration:2.0];
//    star_.center = CGPointMake(420, 420); //絵が移動し終わる位置
//    [UIView commitAnimations]; //アニメーションブロックの完了
//    
//    
//}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    NSLog(@"おさおいお");
    static UIViewAnimationCurve animationCurve = UIViewAnimationCurveEaseInOut;
    
    
    star_.center = CGPointMake(0, 0); //絵が始まる位置
    [UIView beginAnimations:nil context:NULL]; //アニメーションブロックの開始
    [UIView setAnimationDuration:2.0];
    [UIView setAnimationCurve:animationCurve];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationRepeatCount:10];
    star_.center = CGPointMake(420, 420); //絵が移動し終わる位置
    [UIView commitAnimations]; //アニメーションブロックの完了
    
    //ラベルに現在のアニメーションカーブを表示
    switch (animationCurve) {
        case UIViewAnimationCurveEaseInOut :
            label_.text = @"UIViewAnimationCurveEaseInOut";
            break;
            case UIViewAnimationCurveEaseIn:
            label_.text = @"UIViewAnimationCurveEaseIn";
            break;
            case UIViewAnimationCurveEaseOut:
            label_.text = @"UIViewAnimationCurveEaseOut";
            break;
            case UIViewAnimationCurveLinear:
            label_.text = @"UIViewAnimationCurveLinear";
            break;
            
        default:
            label_.text = @"-";
            break;
    }
    
 //アニメーションカーブの変更
if(UIViewAnimationCurveLinear < ++animationCurve)
{
    animationCurve = UIViewAnimationCurveEaseInOut;
}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
