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

@synthesize numScore;


@synthesize num_moves;
@synthesize FinalScore;


@synthesize done;





// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    NSLog(@"Redraw Alien");
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    if(done > 0){
        done = 0;
        num_moves = 0;
        [numScore setText: [NSString stringWithFormat:@"%i", num_moves * 3]];
        [FinalScore setText: [NSString stringWithFormat:@"Score"]];
        //[numScore setTextColor:[UIColor whiteColor]];
        [[UIColor redColor] setFill];

    }else{
        [[UIColor redColor] setFill];
    }
    
    if(num_moves > 0){
        [numScore setText: [NSString stringWithFormat:@"%i", num_moves * 3]];
    }
    CGContextFillRect(context, bounds);
    
    [[UIColor whiteColor] setFill];
    CGContextFillEllipseInRect(context, CGRectMake(alien_x, alien_y, 20, 20));
    
    [[UIColor blueColor] setFill];
    CGContextFillEllipseInRect(context, CGRectMake(bad_alien_x, bad_alien_y, num_moves * 3, num_moves * 3));
    
    int real_bx = bad_alien_x + (num_moves * 3)/2;
    int real_by = bad_alien_y + (num_moves * 3)/2;
    
    int real_x = alien_x + 10;
    int real_y = alien_y + 10;
    
    
    
    if(num_moves > 0 && (( (num_moves * 3) > abs(real_bx - real_x) || (num_moves * 3) > abs(real_x - real_bx)) && ( (num_moves * 3)  > abs(real_by - real_y) || (num_moves * 3) > abs(real_y - real_by)))){
        NSLog(@"HELLO");
        [[UIColor blackColor] setFill];
        CGContextFillRect(context, bounds);
        
        [[UIColor whiteColor] setFill];
        CGContextFillEllipseInRect(context, CGRectMake(alien_x, alien_y, 20, 20));
        
        [[UIColor blueColor] setFill];
        CGContextFillEllipseInRect(context, CGRectMake(bad_alien_x, bad_alien_y, num_moves * 3, num_moves * 3));
        
        //FINAL SCORE AND RESET
        
        [FinalScore setText: [NSString stringWithFormat:@"Final Score"]];
        ++done;

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
        int upperBound2 = 800;
        int rndValue2 = lowerBound2 + arc4random() % (upperBound2 - lowerBound2);
        
        bad_alien_x = rndValue1;
        bad_alien_y = rndValue2;
        
        
        [self setNeedsDisplay];
        
        ++num_moves;
    }
}

@end
