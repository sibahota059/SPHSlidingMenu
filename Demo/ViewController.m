//
//  ViewController.m
//  SlidingDemo
//
//  Created by Siba Prasad Hota  on 1/14/15.
//  Copyright (c) 2015 Wemakeappz. All rights reserved.
//

#import "ViewController.h"
#import "MenuViewController.h"

@interface ViewController ()<SPHSimpleSideMenuDelegate>

@property(nonatomic,retain)IBOutlet UIImageView *bgView;

@property(nonatomic)MenuViewController *sideMenu;

- (IBAction)opentogglemenu:(id)sender;

@end

@implementation ViewController

@synthesize sideMenu,bgView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.title = @"Simple Side Menu";
    self.navigationController.navigationBarHidden = YES;
   
    UIImageView *author = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ProfilePic.png"]];
    author.frame = CGRectMake(120, 30, 95, 95);
    author.alpha = 1.0;
    [self.view addSubview:author];
    author.layer.borderColor = [UIColor whiteColor].CGColor;
    author.layer.borderWidth = 3;
    author.clipsToBounds = YES;
    author.layer.cornerRadius =  author.frame.size.width/2;
    
    
    sideMenu = [[MenuViewController alloc]initWithItemTitles:@[@"One", @"Two", @"Three", @"Four",@"Five", @"Six", @"Seven"]
                                                 andItemImages:@[@"icon1.png", @"icon2.png", @"icon3.png", @"icon4.png",@"icon5.png", @"icon6.png", @"icon7.png"]
                                           addToViewController:self];
    sideMenu.delegate = self;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)opentogglemenu:(id)sender {
    
     [sideMenu toggleMenu];
}


#pragma -mark BTSimpleSideMenuDelegate

-(void)SPHSimpleSideMenu:(MenuViewController *)menu didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"Item Cliecked : %ld", (long)index);
}

-(void)SPHSimpleSideMenu:(MenuViewController *)menu selectedItemTitle:(NSString *)title {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Menu Clicked"
                                                   message:[NSString stringWithFormat:@"Item Title : %@", title]
                                                  delegate:self
                                         cancelButtonTitle:@"Dismiss"
                                         otherButtonTitles:nil, nil];
    [alert show];
}


@end
