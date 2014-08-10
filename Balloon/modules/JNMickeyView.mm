#import "JNMickeyView.h"


namespace {
    const CGFloat AnimationDuration = 2.f;
}


@interface JNMickeyContentView : UIView

@property (nonatomic, weak, readwrite) JNMickeyView *parentView;

@end

@implementation JNMickeyContentView

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    
    CGContextSetFillColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextFillRect(ctx, rect);
    
    CGFloat d = 100;
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CGFloat x = nearbyint((width - d) * .5f);
    CGFloat y = nearbyint((height - d) * .5f);
    CGRect r = CGRectMake(x, y, d, d);
    
    CGContextSetBlendMode(ctx, kCGBlendModeClear);
    CGContextFillEllipseInRect(ctx, r);
    
    CGContextRestoreGState(ctx);
}

// MARK: -

- (void)startAnimation:(BOOL)expand
{
    CAAnimation *anim;
    if (expand) {
        anim = [self expandAnimation];
    } else {
        anim = [self shrinkAnimation];
    }
    [self.layer addAnimation:anim forKey:@"expand"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(AnimationDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.parentView.backgroundColor = [UIColor blackColor];
    });
}

- (CAAnimation *)expandAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    animation.duration = AnimationDuration;
    
    animation.fromValue = @(.1f);
    animation.toValue = @(1);
    
    return animation;
}

- (CAAnimation *)shrinkAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    animation.duration = AnimationDuration;
    
    animation.fromValue = @(1);
    animation.toValue = @(.1f);
    
    return animation;
}

@end

// MARK: -

@implementation JNMickeyView
{
    JNMickeyContentView *contentView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIColor *bgColor = [UIColor clearColor];
        self.backgroundColor = bgColor;
        
        contentView = [[JNMickeyContentView alloc] initWithFrame:self.bounds];
        contentView.parentView = self;
        contentView.backgroundColor = bgColor;
        [self addSubview:contentView];
    }
    return self;
}

// MARK: -

- (void)startAnimation:(BOOL)expand
{
    [contentView startAnimation:expand];
}

@end
