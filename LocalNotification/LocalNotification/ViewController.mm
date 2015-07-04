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
}

@end
