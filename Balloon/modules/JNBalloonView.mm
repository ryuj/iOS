#import "JNBalloonView.h"

@implementation JNBalloonView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    
    CGContextSetStrokeColorWithColor(ctx,[UIColor blueColor].CGColor);
    CGContextSetLineWidth(ctx, 2);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddEllipseInRect(path, NULL, rect);
    CGPathCloseSubpath(path);
    CGContextAddPath(ctx, path);
    
    CGContextSetShadowWithColor(ctx, CGSizeMake(0, 1), 0, [UIColor redColor].CGColor);
    
    CGContextStrokePath(ctx);
    CGPathRelease(path);
    
    [[UIColor whiteColor] setFill];
    CGFloat d = 1;
    CGContextFillEllipseInRect(ctx, CGRectInset(rect, d, d));
    
    CGContextSetShadow(ctx, CGSizeZero, 0);
    [[UIColor blueColor] setStroke];
    [[UIColor blueColor] setFill];
//    [@"1" drawInRect:rect withFont:[UIFont boldSystemFontOfSize:32] lineBreakMode:NSLineBreakByCharWrapping alignment:NSTextAlignmentCenter];
    
    CGContextRestoreGState(ctx);
}

@end
