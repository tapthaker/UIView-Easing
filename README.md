UIView+Easing
=============

Inspired from [UIView-EasingFunctions](https://github.com/zrxq/UIView-EasingFunctions)  with some difference in implementation, this doesn't used AHEasing, instead it uses CAMediaTimingFunction. Created mainly because the previously mentioned repo doesn't support ios8 and results in spazzy animations and also has problems with 64bit architecture.

Easings Supported
=================

Please refer to [easings.net](http://easings.net) for all the different possibilities of easings.

* easeInSine
* easeOutSine
* easeInOutSine 
* easeInQuad
* easeOutQuad
* easeInOutQuad 
* easeInCubic
* easeOutCubic
* easeInOutCubic
* easeInQuart
* easeOutQuart
* easeInOutQuart
* easeInQuint
* easeOutQuint
* easeInOutQuint
* easeInExpo
* easeOutExpo
* easeInOutExpo 
* easeInCirc
* easeOutCirc
* easeInOutCirc 
* easeInBack
* easeOutBack
* easeInOutBack 



Usage
=====

Just import the UIView+Easing.h & UIView+Easing.m files into your project directory and use in the following way

 	 	[self.dialogView setEasingFunction:easeOutBack forKeyPath:@"center"];
    	[UIView animateWithDuration:.6 animations:^{
    		self.dialogView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
     	} completion:^(BOOL finished) {
        
        [self.dialogView removeEasingFunctionForKeyPath:@"center"];
        [self.dialogView removeEasingFunctionForKeyPath:@"transform"];
        
    	}];
    	
**Using your custom easing functions**

 	 	[self.button setEasingFunction:CreateCAMediaTimingFunction(0.47, 0, 0.745, 0.715) forKeyPath:@"center"];
    	[UIView animateWithDuration:.6 animations:^{
    		self.button.center = CGPointMake(160,80);
     	} completion:^(BOOL finished) {
        
        [self.button removeEasingFunctionForKeyPath:@"center"];
        
    	}];
    	
Demo
====

[![Click here to redirect to youtube (Too bad github doesn't provide video embedding)](http://img.youtube.com/vi/VBGnVLRq49s/0.jpg)](http://youtu.be/VBGnVLRq49s)


Contact
=======

Follow me on Twitter ([@tapthaker](https://twitter.com/tapthaker))