#import "JNMickeyView.h"


namespace {
    const CGFloat AnimationDuration = 1.5f;
}


@interface JNMickeyContentLayer : CALayer

@end

@implementation JNMickeyContentLayer

- (void)drawInContext:(CGContextRef)ctx
{
    CGContextSaveGState(ctx);
    
    CGContextSetFillColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextFillRect(ctx, self.bounds);
    
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

@end

// MARK: -

@implementation JNMickeyView
{
    JNMickeyContentLayer *contentLayer;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        contentLayer = [JNMickeyContentLayer layer];
        contentLayer.frame = self.bounds;
        [contentLayer setNeedsDisplay];
        [self.layer addSublayer:contentLayer];
        
        UIColor *bgColor = [UIColor clearColor];
        self.backgroundColor = bgColor;
        contentLayer.backgroundColor = bgColor.CGColor;
    }
    return self;
}

// MARK: -

- (void)startAnimation:(BOOL)expand
{
    self.backgroundColor = [UIColor clearColor];
    
    CAAnimation *anim;
    if (expand) {
        anim = [self expandAnimation];
    } else {
        anim = [self shrinkAnimation];
    }
    [contentLayer addAnimation:anim forKey:@"expand"];
    
    if (!expand) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(AnimationDuration*.9f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.backgroundColor = [UIColor blackColor];
        });
    }
}

- (CAAnimation *)expandAnimation
{
    CAAnimationGroup *anims = [CAAnimationGroup animation];
    anims.duration = AnimationDuration;
    NSMutableArray *animations = [NSMutableArray array];
    
    {
        CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        anim.duration = AnimationDuration;
        anim.fromValue = @(.1f);
        anim.toValue = @(1);
        [animations addObject:anim];
    }
    
    anims.animations = animations;
    return anims;
}

- (CAAnimation *)shrinkAnimation
{
    CAAnimationGroup *anims = [CAAnimationGroup animation];
    anims.duration = AnimationDuration;
    NSMutableArray *animations = [NSMutableArray array];
    
    {
        CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        anim.duration = AnimationDuration;
        anim.fromValue = @(1);
        anim.toValue = @(.1);
        [animations addObject:anim];
    }
    
    anims.animations = animations;
    return anims;
}

@end
