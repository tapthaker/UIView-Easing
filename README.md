UIView+Easing
=============

Inspired from [link1]  with some difference in implementation, this doesn't used AHEasing, instead it uses CAMediaTimingFunction. Created mainly because the previously mentioned repo doesn't support ios8 and results in spazzy animations and also has problems with 64bit architecture.


Usage
=====

Just import the UIView+Easing.h & UIView+Easing.m files into your project directory and use in the following way

 ```[self.dialogView setEasingFunction:easeOutBack forKeyPath:@"center"];
    [UIView animateWithDuration:.6 animations:^{
    	self.dialogView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
     } completion:^(BOOL finished) {
        
        [self.dialogView removeEasingFunctionForKeyPath:@"center"];
        [self.dialogView removeEasingFunctionForKeyPath:@"transform"];
        
    }];```

![link1]: https://github.com/zrxq/UIView-EasingFunctions "UIView-EasingFunctions