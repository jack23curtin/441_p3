//
//  AlienDraw.h
//  drawing_p3
//
//  Created by Jack Curtin on 3/1/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AlienDraw : UIView
@property (nonatomic) float alien_x, alien_y;
@property (nonatomic) float bad_alien_x, bad_alien_y;

@property (nonatomic) int num_moves;

@end

NS_ASSUME_NONNULL_END
