//
//  AlienDraw.m
//  drawing_p3
//
//  Created by Jack Curtin on 3/1/21.
//

#import "AlienDraw.h"

@implementation AlienDraw

@synthesize alien_x, alien_y;
@synthesize bad_alien_x, bad_alien_y;

@synthesize num_moves;


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    NSLog(@"Redraw Alien");
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    if(num_moves > 5)
        [[UIColor purpleColor] setFill];

    else
        [[UIColor redColor] setFill];
    CGContextFillRect(context, bounds);
    
    [[UIColor whiteColor] setFill];
    CGContextFillEllipseInRect(context, CGRectMake(alien_x, alien_y, 20, 20));
    
    [[UIColor blueColor] setFill];
    CGContextFillEllipseInRect(context, CGRectMake(bad_alien_x, bad_alien_y, 20, 20));
    
    if(num_moves > 0 && ((50 > fabsf(bad_alien_x - alien_x) || 50 > fabsf(alien_x - bad_alien_x)) && (50 > fabsf(bad_alien_y - alien_y) || 50 > fabsf(alien_y - bad_alien_y)))){
        NSLog(@"HELLO");
        [[UIColor blackColor] setFill];
        CGContextFillRect(context, bounds);
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for (UITouch *t in touches){
        CGPoint p = [t locationInView:self];
        NSLog(@"Touch at %f %f", p.x, p.y);
        
        alien_x = p.x;
        alien_y = p.y;
        
        int lowerBound1 = 10;
        int upperBound1 = 360;
        int rndValue1 = lowerBound1 + arc4random() % (upperBound1 - lowerBound1);
        
        int lowerBound2 = 10;
        int upperBound2 = 380;
        int rndValue2 = lowerBound2 + arc4random() % (upperBound2 - lowerBound2);
        
        bad_alien_x = rndValue1;
        bad_alien_y = rndValue2;
        
        
        [self setNeedsDisplay];
        
        ++num_moves;
    }
}

@end
