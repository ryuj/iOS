#import "JNViewController.h"
#import "JNBalloonView.h"


@interface JNViewController ()

@end

@implementation JNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    CGFloat width = self.view.bounds.size.width;
    
    JNBalloonView *v = [[JNBalloonView alloc] initWithFrame:CGRectMake(0, 0, width, 100)];
    v.backgroundColor = [UIColor greenColor];
    [self.view addSubview:v];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
