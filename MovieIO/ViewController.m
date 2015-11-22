//
//  ViewController.m
//  MovieIO
//
//  Created by chishengchien on 2015/11/22.
//  Copyright © 2015年 richi. All rights reserved.
//

#import "ViewController.h"
#import "MovieModel.h"
#import "Movie.h"
#import "MovieCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, MovieModelDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) MovieModel *movieModel;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation ViewController
static NSString *movieCellIdentifier = @"MovieCell";

#pragma mark - life cycles of viewcontroller
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [_tableView registerNib:[UINib nibWithNibName:movieCellIdentifier bundle:nil] forCellReuseIdentifier:movieCellIdentifier];
    
    _movieModel = [[MovieModel alloc] init];
    _movieModel.delegate = self;
    
    [_movieModel moviesByKeyword:@"transformer"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:movieCellIdentifier forIndexPath:indexPath];
    
    Movie *movie = _dataSource[indexPath.row];
    cell.titleLabel.text = movie.title;
    
    if ( [movie.year isEqual:@(-1)] ) {
        cell.yearLabel.text = @"N/A";
    } else {
        cell.yearLabel.text = [NSString stringWithFormat:@"%@", movie.year];
    }
    
    cell.ratingLabel.text = [NSString stringWithFormat:@"%@", movie.rating];
    
    cell.posterImageView.backgroundColor = [UIColor grayColor];
    [cell.posterImageView setImageWithURL:[NSURL URLWithString:movie.poster] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    return cell;
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90.0f;
}

#pragma mark - MovieModelDelegate
- (void)didGetMovies:(NSArray *)movies {
    _dataSource = movies;
    [_tableView reloadData];
}

- (void)failToGetMoviesWithError:(NSError *)error {
    DLog(@"failToGetMoviesWithError: %@", error);
}

@end
