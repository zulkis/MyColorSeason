//
//  MCSColorViewerView.m
//  MyColorSeason
//
//  Created by Alexey Minaev on 01/06/14.
//  Copyright (c) 2014 Alexey MInaev. All rights reserved.
//

#import "MCSColorViewerView.h"

@import QuartzCore;

const CGFloat MCSColorViewerViewMinHeight = 150.f;
const CGFloat MCSColorViewerViewMaxHeight = 300.f;

@implementation MCSColorViewerView {
    CGRect _currentFrame;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    _currentFrame = self.frame;
    
    [self updateBezierMask];
    
    UIPanGestureRecognizer *gr = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizerDidPan:)];
    gr.maximumNumberOfTouches = 1;
    [self addGestureRecognizer:gr];
}

- (void)updateBezierMask {
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    CGFloat round = 15.f;//CGRectGetHeight(self.bounds)/10.f;
    CGSize viewSize = self.bounds.size;
    CGPoint startPoint = CGPointMake(0, round);
    
    [aPath moveToPoint:startPoint];
    
    [aPath addQuadCurveToPoint:CGPointMake(viewSize.width/2.f,round) controlPoint:CGPointMake(viewSize.width/4.f, -round)];
    [aPath addQuadCurveToPoint:CGPointMake(viewSize.width, round) controlPoint:CGPointMake(viewSize.width*3./4.f, round * 3.f)];
    [aPath addLineToPoint:CGPointMake(viewSize.width, viewSize.height)];
    [aPath addLineToPoint:CGPointMake(0.f, viewSize.height)];
    
    
    [aPath closePath];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = self.bounds;
    layer.path = aPath.CGPath;
    self.layer.mask = layer;
}

- (void)panGestureRecognizerDidPan:(UIPanGestureRecognizer *)gr {
    CGPoint translation = [gr translationInView:self];
    if (gr.state == UIGestureRecognizerStateChanged || gr.state == UIGestureRecognizerStateEnded) {
        
        CGRect frame = _currentFrame;
        CGFloat currentHeight = frame.size.height - translation.y;
        if (currentHeight > MCSColorViewerViewMaxHeight) {
            currentHeight = MCSColorViewerViewMaxHeight;
        } else if (currentHeight < MCSColorViewerViewMinHeight) {
            currentHeight = MCSColorViewerViewMinHeight;
        }
        frame.size.height = currentHeight;
        frame.origin.y = CGRectGetMaxY(_currentFrame) - currentHeight;
        
        self.frame = frame;
        if (gr.state == UIGestureRecognizerStateEnded) {
            _currentFrame = frame;
        }
        [self updateBezierMask];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
