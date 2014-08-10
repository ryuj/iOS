#import "JNViewController.h"
#import "JNBalloonView.h"
#import "JNMickeyView.h"


@interface JNViewController ()

@end

@implementation JNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    CGFloat width = self.view.bounds.size.width;
//    
//    JNBalloonView *v = [[JNBalloonView alloc] initWithFrame:CGRectMake(0, 20, width, 100)];
//    v.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:v];
    
    CGFloat d = 6000;
    mickeyView = [[JNMickeyView alloc] initWithFrame:CGRectMake(0, 0, d, d)];
    mickeyView.center = self.view.center;
    [self.view addSubview:mickeyView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// MARK: -

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    [mickeyView startAnimation:YES];
}

@end
