#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"ボタン" forState:UIControlStateNormal];
    [btn sizeToFit];
    [btn setCenter:self.view.center];
    [btn addTarget:self action:@selector(didTapButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

// MARK: -

- (void)didTapButton
{
    NSLog(@"tapped!!");
    
    // 設定する前に、設定済みの通知をキャンセルする
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    // 設定し直す
    
    NSString *key = @"key_id";
    NSInteger val = 1;
    
    {
        UILocalNotification *localNotification = [[UILocalNotification alloc] init];
        localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
        localNotification.alertBody = @"Fire!";
        localNotification.timeZone = [NSTimeZone localTimeZone];
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        localNotification.alertAction = @"OPEN";
        localNotification.userInfo = @{ key: @(val) };
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
    {
        UILocalNotification *localNotification = [[UILocalNotification alloc] init];
        localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
        localNotification.alertBody = @"Fire!";
        localNotification.timeZone = [NSTimeZone localTimeZone];
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        localNotification.alertAction = @"OPEN";
        localNotification.userInfo = @{ key: @(val) };
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
    
    NSArray *ary = [[UIApplication sharedApplication] scheduledLocalNotifications];
    NSLog(@"ary count:%lu", (unsigned long)[ary count]);
}

@end
