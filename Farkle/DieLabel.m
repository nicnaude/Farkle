//
//  DieLabel.m
//  Farkle
//
//  Created by Nicholas Naudé on 21/01/2016.
//  Copyright © 2016 Nicholas Naudé. All rights reserved.
//

#import "DieLabel.h"

@interface DieLabel () <UIGestureRecognizerDelegate>

@end

@implementation DieLabel

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    UITapGestureRecognizer *didTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTouch:)];
    didTouch.delegate = self;
    
    self.gestureRecognizers = @[didTouch];
    
    // Wouldn't it be nice if we could drag and drop the die you want to keep into a "bank cup"?
    return self;
}

-(void) handleTouch :(UITapGestureRecognizer *)gestureRecognizer {
    NSLog(@"Hello");
}

@end
