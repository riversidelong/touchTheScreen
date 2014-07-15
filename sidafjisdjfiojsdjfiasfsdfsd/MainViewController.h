//
//  MainViewController.h
//  sidafjisdjfiojsdjfiasfsdfsd
//
//  Created by 川端伸彦 on 2014/07/05.
//  Copyright (c) 2014年 kawabata. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
@interface MainViewController : UIViewController
{
    CFURLRef soundURL;
    SystemSoundID soundID;
}
@property(readwrite)CFURLRef soundURL;
@property(readonly)SystemSoundID soundID;

@end
