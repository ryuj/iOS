#import "JNViewController.h"
<<<<<<< HEAD
#import "JNMickeyView.h"


@interface JNViewController ()
{
    JNMickeyView *view;
    
    BOOL expand;
}

@end

@implementation JNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    
    UIImage *img = [UIImage imageNamed:@"mickey.jpg"];
    UIImageView *iv = [[UIImageView alloc] initWithImage:img];
    CGFloat y = nearbyint((height - width) * .5f);
    iv.frame = CGRectMake(0, y, width, width);
    [self.view addSubview:iv];
    
    CGFloat d = height * 10;
    view = [[JNMickeyView alloc] initWithFrame:CGRectMake(0, 0, d, d)];
    view.center = self.view.center;
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// MARK: -

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    [view startAnimation:expand];
    expand = !expand;
}

@end
