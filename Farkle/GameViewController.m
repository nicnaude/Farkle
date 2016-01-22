//
//  GameViewController.m
//  Farkle
//
//  Created by Nicholas Naudé on 21/01/2016.
//  Copyright © 2016 Nicholas Naudé. All rights reserved.
//

#import "GameViewController.h"
#import "DieLabel.h"

@interface GameViewController ()
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labelsArray;

@property NSMutableArray *dieNumberArray;
@property NSMutableArray *dieLocationArray;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    [self.dieLocationArray addObject:@[@[@20,@20], @[@20, @100], @[@20, @180], @[@100, @20], @[@100, @100], @[@100, @180]]];
    
    [NSNumber numberWithFloat:20];
}

//- (DieLabel *) diceRoll:(int) i{
////    NSArray *tempArray = [self.dieLocationArray objectAtIndex:i];
////    CGFloat x = [[tempArray objectAtIndex:0] floatValue];
////    NSLog(@"%f",x);
////    CGFloat y = [[tempArray objectAtIndex:1] floatValue];
////    CGRect dieFrame = CGRectMake(x, y, 75, 75);
////    
//    
//    
//        return newDie;
//}

- (float) dieXframe:(float )x {
    UIScreen *screen = [UIScreen mainScreen];
    CGFloat width = screen.bounds.size.width;
    CGFloat withoutBorderWidth = width - (20*2);
    CGFloat dieLocation = withoutBorderWidth / 3;
    float newX = x + dieLocation;
    return newX;
}

- (float) dieYframe:(float )y {
    UIScreen *screen = [UIScreen mainScreen];
    CGFloat height = screen.bounds.size.height;
    CGFloat withoutBorderheight = height - (20*2);
    CGFloat dieLocation = withoutBorderheight / 2;
    float newY = y + dieLocation;
    return newY;
}

-(NSNumber *) randomDieNumber {
    UInt32 randNum = arc4random_uniform(7);
    return [NSNumber numberWithInteger:randNum];
}


- (IBAction)rollDice:(UIButton *)sender {
    sender.enabled = NO;
    sender.alpha = 0;
    int counter = 0;
    for (int i = 0; i < 6; i++){
//        [self diceRoll:i];
        counter++;
        float tempX = [self dieXframe:i * 10];
        float tempY;
        if (counter > 3) {
        float tempY = [self dieYframe:i + 80];
        }
        else{
        float tempY = [self dieYframe:i];
        }
        CGRect dieframe = CGRectMake(tempX, tempY, 75, 75);
        DieLabel *newDie = [[DieLabel alloc] initWithFrame:dieframe];
        newDie.backgroundColor = [UIColor grayColor];
        NSNumber *rand = [self randomDieNumber];
        [self.dieNumberArray addObject:rand];
        newDie.text = [NSString stringWithFormat:@"%@", rand];
        
        newDie.userInteractionEnabled = YES;
        [self.view addSubview:newDie];
    }
}





- (void)gameDrawBoard{
    //create button array
//    self.buttonsArray = [NSMutableArray new];
    
    CGFloat totalWidth = self.view.frame.size.width;
    [[self.gridView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSInteger intLeftMargin = 10;
    NSInteger intTopMargin  = 30;
    NSInteger intSpacing = 6;
    NSInteger intXTile;
    NSInteger intYTile;
    
    NSInteger width;
    
    width = ((totalWidth - (2 * intLeftMargin))/self.cellsPerRow) - intSpacing;
    
    for (int row = 0; row < self.cellsPerRow; row++) {
        for (int col = 0; col < self.cellsPerRow; col++) {
            intXTile = (row * (width + intSpacing)) + intLeftMargin;
            intYTile = (col * (width + intSpacing)) + intTopMargin;
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(intXTile, intYTile, width, width)];
            button.backgroundColor = [UIColor whiteColor];
            button.tag = 100 + row * self.cellsPerRow + col;
            [button addTarget:self action:@selector(onPlayButtonTapped:) forControlEvents:UIControlEventTouchDown];
            [self.gridView addSubview:button];
            [self.buttonsArray addObject:button];
        }
    }
}













@end
