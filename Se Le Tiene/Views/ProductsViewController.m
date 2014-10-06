//
//  ProductsViewController.m
//  Se Le Tiene
//
//  Created by Jorge Raul Ovalle Zuleta on 10/1/14.
//  Copyright (c) 2014 Olinguito. All rights reserved.
//

#import "ProductsViewController.h"
#import "ProductTableViewController.h"
#import "Filter/FilterViewController.h"


@interface ProductsViewController ()

@end

@implementation ProductsViewController
@synthesize GridView,ListView,typeView,searchBar,btnFilter,btnOpenPopUP,loader, btnMen1, btnMen2, btnMen3, viewMenu;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.jpg"]];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logoHeader"]];

    
    /*CALayer *sublayer = [CALayer layer];
    sublayer.backgroundColor = [UIColor blueColor].CGColor;
    sublayer.frame = CGRectMake(0, 0, self.view.bounds.size.width,searchBar.bounds.size.height);
    [self.view.layer addSublayer:sublayer];*/
    
    

    btnMen1 = [UIButton buttonWithType:UIButtonTypeSystem];
    btnMen1.frame = CGRectMake(0, 0, self.viewMenu.bounds.size.width/3, 60);
    [btnMen1 setImage:[UIImage imageNamed:@"btnSearchMenu"] forState:UIControlStateNormal];
    btnMen1.tintColor = [UIColor colorWithRed:0.263 green:0.596 blue:0.804 alpha:1];
    [viewMenu addSubview:btnMen1];
    
    
    btnMen2 = [UIButton buttonWithType:UIButtonTypeSystem];
    btnMen2.frame = CGRectMake(self.viewMenu.bounds.size.width/3, 0, self.viewMenu.bounds.size.width/3, 60);
    [btnMen2 setImage:[UIImage imageNamed:@"btnAddMenu"] forState:UIControlStateNormal];
    btnMen2.tintColor = [UIColor whiteColor];
    [viewMenu addSubview:btnMen2];
    
    btnMen3 = [UIButton buttonWithType:UIButtonTypeSystem];
    btnMen3.frame = CGRectMake((self.viewMenu.bounds.size.width/3)*2, 0, self.viewMenu.bounds.size.width/3, 60);
    [btnMen3 setImage:[UIImage imageNamed:@"btnUserMenu"] forState:UIControlStateNormal];
    btnMen3.tintColor = [UIColor whiteColor];
    [viewMenu addSubview:btnMen3];
    
    
    
    
    
    GridView.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    GridView.view.frame = CGRectMake(0, 0, self.viewLoaded.bounds.size.width,self.viewLoaded.bounds.size.height);
    GridView = [self.storyboard instantiateViewControllerWithIdentifier:@"GridView"];
    
    ListView.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    ListView.view.frame = CGRectMake(0, 0, self.viewLoaded.bounds.size.width,self.viewLoaded.bounds.size.height);
    ListView = [self.storyboard instantiateViewControllerWithIdentifier:@"ListView"];
    
    searchBar.backgroundColor = [UIColor colorWithRed:0.243 green:0.592 blue:0.812 alpha:1];
    [searchBar setBackgroundColor:[UIColor colorWithRed:0.243 green:0.592 blue:0.812 alpha:1]];
    [searchBar setSearchFieldBackgroundImage:[UIImage imageNamed:@"bgSearch.png"] forState:UIControlStateNormal];

    searchBar.delegate = self;
    UITextField *searchField = [searchBar valueForKey:@"_searchField"];
    searchField.textColor = [UIColor whiteColor];
    [searchField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    searchField.tintColor = [UIColor whiteColor];
    searchField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    searchField.keyboardAppearance = UIKeyboardAppearanceDark;
    
    UIImage *image = [UIImage imageNamed: @"btnSearch.png"];
    UIImageView *iView = [[UIImageView alloc] initWithImage:image];
    searchField.leftView = iView;
    
    btnFilter.layer.borderColor = [UIColor colorWithRed:0.243 green:0.592 blue:0.812 alpha:1].CGColor;
    btnFilter.layer.borderWidth = 1.0f;
    btnFilter.layer.cornerRadius = 5.0f;
    btnOpenPopUP.layer.borderColor = [UIColor colorWithRed:0.243 green:0.592 blue:0.812 alpha:1].CGColor;
    btnOpenPopUP.layer.borderWidth = 1.0f;
    btnOpenPopUP.layer.cornerRadius = 5.0f;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


// SEARCH BAR METHODS DELEGATE
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"Buscando: %@", self.searchBar.text);
    
    [self.searchBar resignFirstResponder];
}
- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar{
    [self.searchBar resignFirstResponder];
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self.searchBar resignFirstResponder];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [searchBar resignFirstResponder];
}


// CUSTOM METHODS

- (IBAction)changeView:(id)sender {
    //[[self.viewLoaded subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UISegmentedControl * tmpControl = sender;
    NSLog(@"Selected %ld", (long)tmpControl.selectedSegmentIndex);
    [self.containerViewController swapViewControllers];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    if ([segue.identifier isEqualToString:@"embedContainer"]) {
        self.containerViewController = segue.destinationViewController;
    }
}
- (IBAction)filterSearch:(id)sender {
    FilterViewController *fVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FilterView"];
    [self.navigationController pushViewController:fVC animated:NO];
}

@end