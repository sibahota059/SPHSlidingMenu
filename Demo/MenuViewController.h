//
//  MenuViewController.h
//  SlidingDemo
//
//  Created by Siba Prasad Hota  on 1/14/15.
//  Copyright (c) 2015 Wemakeappz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuViewController;

@protocol SPHSimpleSideMenuDelegate <NSObject>

@optional
-(void)SPHSimpleSideMenu:(MenuViewController *)menu didSelectItemAtIndex:(NSInteger)index;
-(void)SPHSimpleSideMenu:(MenuViewController *)menu selectedItemTitle:(NSString *)title;

@end

@interface UIView (bt_screenshot)
- (UIImage *)screenshot;

@end

@interface UIImage (bt_blurrEffect)
- (UIImage *)blurredImageWithRadius:(CGFloat)radius iterations:(NSUInteger)iterations tintColor:(UIColor *)tintColor;
@end


@interface MenuViewController : UIViewController

@property(nonatomic, weak) id <SPHSimpleSideMenuDelegate> delegate;
-(instancetype) initWithItemTitles:(NSArray *)itemsTitle andItemImages:(NSArray *)itemsImage addToViewController:(UIViewController *)sender;
-(void)show;
-(void)hide;
-(void)toggleMenu;

@end
