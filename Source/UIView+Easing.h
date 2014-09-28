//
//  UIView+EasingFunctions.h
//  Easing
//
//  Created by Zoreslav Khimich on 30/04/2013.
//  Copyright (c) 2013 Zoreslav Khimich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


#define easeInSine CreateCAMediaTimingFunction(0.47, 0, 0.745, 0.715)
#define easeOutSine CreateCAMediaTimingFunction(0.39, 0.575, 0.565, 1)
#define easeInOutSine CreateCAMediaTimingFunction(0.445, 0.05, 0.55, 0.95)
#define easeInQuad CreateCAMediaTimingFunction(0.55, 0.085, 0.68, 0.53)
#define easeOutQuad CreateCAMediaTimingFunction(0.25, 0.46, 0.45, 0.94)
#define easeInOutQuad CreateCAMediaTimingFunction(0.455, 0.03, 0.515, 0.955)
#define easeInCubic CreateCAMediaTimingFunction(0.55, 0.055, 0.675, 0.19)
#define easeOutCubic CreateCAMediaTimingFunction(0.215, 0.61, 0.355, 1)
#define easeInOutCubic CreateCAMediaTimingFunction(0.645, 0.045, 0.355, 1)
#define easeInQuart CreateCAMediaTimingFunction(0.895, 0.03, 0.685, 0.22)
#define easeOutQuart CreateCAMediaTimingFunction(0.165, 0.84, 0.44, 1)
#define easeInOutQuart CreateCAMediaTimingFunction(0.77, 0, 0.175, 1)
#define easeInQuint CreateCAMediaTimingFunction(0.755, 0.05, 0.855, 0.06)
#define easeOutQuint CreateCAMediaTimingFunction(0.23, 1, 0.32, 1)
#define easeInOutQuint CreateCAMediaTimingFunction(0.86, 0, 0.07, 1)
#define easeInExpo CreateCAMediaTimingFunction(0.95, 0.05, 0.795, 0.035)
#define easeOutExpo CreateCAMediaTimingFunction(0.19, 1, 0.22, 1)
#define easeInOutExpo CreateCAMediaTimingFunction(1, 0, 0, 1)
#define easeInCirc CreateCAMediaTimingFunction(0.6, 0.04, 0.98, 0.335)
#define easeOutCirc CreateCAMediaTimingFunction(0.075, 0.82, 0.165, 1)
#define easeInOutCirc CreateCAMediaTimingFunction(0.785, 0.135, 0.15, 0.86)
#define easeInBack CreateCAMediaTimingFunction(0.6, -0.28, 0.735, 0.045)
#define easeOutBack CreateCAMediaTimingFunction(0.175, 0.885, 0.32, 1.275)
#define easeInOutBack CreateCAMediaTimingFunction(0.68, -0.55, 0.265, 1.55)
#define CreateCAMediaTimingFunction(c1,c2,c3,c4) [CAMediaTimingFunction functionWithControlPoints:c1 :c2 :c3 :c4]


/**
 Allows to assign custom [easing functions](http://easings.net/) to the animatable `UIView` properties.
 */
@interface UIView (Easing)

- (void)setEasingFunction:(CAMediaTimingFunction*)function forKeyPath:(NSString *)keyPath;

- (void)removeEasingFunctionForKeyPath:(NSString *)keyPath;

@end
