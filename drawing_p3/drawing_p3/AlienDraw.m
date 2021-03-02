//
//  AlienDraw.m
//  drawing_p3
//
//  Created by Jack Curtin on 3/1/21.
//

#import "AlienDraw.h"

@implementation AlienDraw

@synthesize alien_x, alien_y;
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
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for (UITouch *t in touches){
        CGPoint p = [t locationInView:self];
        NSLog(@"Touch at %f %f", p.x, p.y);
        
        alien_x = p.x;
        alien_y = p.y;
        
        [self setNeedsDisplay];
        
        ++num_moves;
    }
}

@end
