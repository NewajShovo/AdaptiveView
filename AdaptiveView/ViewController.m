//
//  ViewController.m
//  AdaptiveView
//
//  Created by leo on 22/5/19.
//  Copyright © 2019 Shafiq Shovo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIView *relativeView;

@end
@implementation NSLayoutConstraint (Multiplier)
-(instancetype)updateMultiplier:(CGFloat)multiplier {
    
    [NSLayoutConstraint deactivateConstraints:[NSArray arrayWithObjects:self, nil]];
    
    NSLog(@"---%@",self.firstItem);
    NSLog(@"---%@",self.secondItem);
    NSLog(@"---%ld",(long)self.relation);
    NSLayoutConstraint *newConstraint = [NSLayoutConstraint constraintWithItem:self.firstItem attribute:self.firstAttribute relatedBy:self.relation toItem:self.secondItem attribute:self.secondAttribute multiplier:multiplier constant:self.constant];
//    NSLog(@"---%@",newConstraint);
    [newConstraint setPriority:self.priority];

    newConstraint.shouldBeArchived = self.shouldBeArchived;
    newConstraint.identifier = self.identifier;
    newConstraint.active = true;
    
    [NSLayoutConstraint activateConstraints:[NSArray arrayWithObjects:newConstraint, nil]];
    //NSLayoutConstraint.activateConstraints([newConstraint])
    return newConstraint;
}
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    _AspectRatio.constant*=.8;
//   self.AspectRatio = [self.AspectRatio updateMultiplier:9.f/16.f];
}

- (IBAction)leftButtonClicke:(id)sender {

    float change= _relativeView.frame.size.width*(16.f/9.f);
    float change1 = _relativeView.frame.size.height*(16.f/9.f);
   
    _Canvas.frame = CGRectMake(_relativeView.frame.origin.x, _relativeView.frame.origin.y, change, change1);
}

- (IBAction)midButtonClicked:(id)sender {
//    self.Width.constant = 50;
    float change= _relativeView.frame.size.width*(9.f/16.f);
    float width =change;
    float change1 = _relativeView.frame.size.height*(9.f/16.f);
    float height = change1;
    change=_relativeView.frame.size.width-change;
    change =change/2;
    change1 = change1/2;
    _Canvas.frame = CGRectMake(_relativeView.frame.origin.x+change, _relativeView.frame.origin.y, width, height);
//     self.AspectRatio = [self.AspectRatio updateMultiplier:1.0/1.0];
    
}
- (IBAction)rightButtonClicked:(id)sender {

    float change= _relativeView.frame.size.width*(4.f/5.f);
    float width =change;
    float change1 = _relativeView.frame.size.height*(4.f/5.f);
    float height = change1;
    change=_relativeView.frame.size.width-change;
    change =change/2;
    change1 =_relativeView.frame.size.height-change1;
    change1 =change1/2;
    _Canvas.frame = CGRectMake(_relativeView.frame.origin.x+change, _relativeView.frame.origin.y-change1, width, height);
}


@end
