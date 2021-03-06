#UIView+Easing

Inspired from [UIView-EasingFunctions](https://github.com/zrxq/UIView-EasingFunctions)  with some difference in implementation, this doesn't use AHEasing, instead it uses CAMediaTimingFunction. Created mainly because the previously mentioned repo doesn't support ios8 and results in spazzy animations and also has problems with 64bit architecture.

## Easings Supported 

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

## Installation  ¯\_(ツ)_/¯

### Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like AFNetworking in your projects. See the ["Getting Started" guide for more information](https://github.com/AFNetworking/AFNetworking/wiki/Getting-Started-with-AFNetworking).

#### Podfile

```ruby
platform :ios, '7.0'
pod "UIView-Easing", "~> 0.0.1"
```

### Installation from Source

Simply add the UIView+Easing.h and UIView+Easing.m files inside your project. 

## Usage (•ิ_•ิ)?

Just import the UIView+Easing.h file where ever needed and write in something like the following.

```objective-c
[self.dialogView setEasingFunction:easeOutBack forKeyPath:@"center"];
[UIView animateWithDuration:.6 animations:^{
self.dialogView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
} completion:^(BOOL finished) {
        
[self.dialogView removeEasingFunctionForKeyPath:@"center"];
[self.dialogView removeEasingFunctionForKeyPath:@"transform"];
        
}];
```
    	
### Using your custom easing functions

```objective-c
[self.button setEasingFunction:CreateCAMediaTimingFunction(0.47, 0, 0.745, 0.715) forKeyPath:@"center"];
[UIView animateWithDuration:.6 animations:^{
	self.button.center = CGPointMake(160,80);
} completion:^(BOOL finished) {

[self.button removeEasingFunctionForKeyPath:@"center"];

}];
```
    	
## Demo


[![Click here to redirect to youtube (Too bad github doesn't provide video embedding)](http://img.youtube.com/vi/VBGnVLRq49s/0.jpg)](http://youtu.be/VBGnVLRq49s)


## Contact


Follow me on Twitter ([@tapthaker](https://twitter.com/tapthaker))


## Problems ? (✖╭╮✖)

* Add a new issue on github.
* Add a question on stackoverflow and mention me in a tweet with the link.

## To improve

* Add elastic and bounce easings