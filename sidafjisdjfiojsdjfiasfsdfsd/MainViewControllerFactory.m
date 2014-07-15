//
//  MainViewControllerFactory.m
//  sidafjisdjfiojsdjfiasfsdfsd
//
//  Created by 川端伸彦 on 2014/07/05.
//  Copyright (c) 2014年 kawabata. All rights reserved.
//

#import "MainViewControllerFactory.h"
#import "ViewControllers.h"
@implementation MainViewControllerFactory

+ (UIViewController *)createMainViewController
{
    //メインとなるviewcontrollerを生成して返す
    return [[ViewControllerStart alloc] init];
    
}
@end
