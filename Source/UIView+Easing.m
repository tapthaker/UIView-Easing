//
//  UIView+EasingFunctions.m
//  Easing
//
//  Created by Zoreslav Khimich on 30/04/2013.
//  Copyright (c) 2013 Zoreslav Khimich. All rights reserved.
//

#import "UIView+Easing.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>


#pragma mark - CALayer

static NSString *const LayerEasingFunctionsKey = @"ui+ef_LayerEasingFunctionsKey";

@interface  CALayer (Easing)

- (void)easing_addAnimation:(CAAnimation *)anim forKey:(NSString *)key;

- (void)setEasingFunction:(CAMediaTimingFunction*)function forKeyPath:(NSString *)layerKeyPath;

- (void)removeEasingFunctionForKeyPath:(NSString *)layerKeyPath;

@end

@implementation CALayer (Easing)

static BOOL Swizzled = NO;

- (void)setEasingFunction:(CAMediaTimingFunction*)function forKeyPath:(NSString *)layerKeyPath {

    if (!Swizzled)
    {
        /* swizzle addAnimation:forKey: */

        Method original = class_getInstanceMethod(CALayer.class, @selector(addAnimation:forKey:));
        Method substitute = class_getInstanceMethod(CALayer.class, @selector(easing_addAnimation:forKey:));

        method_exchangeImplementations(original, substitute);

        Swizzled = YES;
    }

    NSMutableDictionary *easingFunctions = [self valueForKey:LayerEasingFunctionsKey];
    
    if (!easingFunctions) {
        
        easingFunctions = [NSMutableDictionary dictionary];
        [self setValue:easingFunctions forKey:LayerEasingFunctionsKey];
        
    }
    easingFunctions[layerKeyPath] =function;
}

- (void)removeEasingFunctionForKeyPath:(NSString *)layerKeyPath {
    
    NSMutableDictionary *easingFunctions = [self valueForKey:LayerEasingFunctionsKey];
    
    if (!easingFunctions)
        return;
    
    [easingFunctions removeObjectForKey:layerKeyPath];

}

- (void)easing_addAnimation:(CAAnimation *)anim forKey:(NSString *)keyPath {
    
    NSDictionary *easingFunctions = [self valueForKey:LayerEasingFunctionsKey];
    CAMediaTimingFunction *function = [easingFunctions valueForKey:keyPath];
    
    if (!function || ![anim isKindOfClass:[CABasicAnimation class]]) {
        
        /* nothing to do, use the original addAnimation:forKey: and return */
        [self easing_addAnimation:anim forKey:keyPath];
        
        return;
        
    }
    
    
    CABasicAnimation *basicAnimation = (CABasicAnimation *)anim;
    
    basicAnimation.timingFunction=function;
    
    [self easing_addAnimation:basicAnimation forKey:keyPath];
}

@end

#pragma mark - UIView

@implementation UIView (Easing)

- (void)setEasingFunction:(CAMediaTimingFunction*)function forKeyPath:(NSString *)keyPath {
    
    if ([keyPath isEqualToString:@"alpha"])
        [self.layer setEasingFunction:function forKeyPath:@"opacity"];
    
    else if ([keyPath isEqualToString:@"center"])
        [self.layer setEasingFunction:function forKeyPath:@"position"];
    
    else if ([keyPath isEqualToString:@"frame"]) {
        
        [self.layer setEasingFunction:function forKeyPath:@"position"];
        [self.layer setEasingFunction:function forKeyPath:@"bounds"];
        
    }
    
    else
        [self.layer setEasingFunction:function forKeyPath:keyPath];

}

- (void)removeEasingFunctionForKeyPath:(NSString *)keyPath {
    
    if ([keyPath isEqualToString:@"alpha"])
        [self.layer removeEasingFunctionForKeyPath:@"opacity"];
    
    else if ([keyPath isEqualToString:@"center"])
        [self.layer removeEasingFunctionForKeyPath:@"position"];
    
    else if ([keyPath isEqualToString:@"frame"]) {
        
        [self.layer removeEasingFunctionForKeyPath:@"position"];
        [self.layer removeEasingFunctionForKeyPath:@"bounds"];
        
    }
    
    else
        [self.layer removeEasingFunctionForKeyPath:keyPath];
    
}


@end
