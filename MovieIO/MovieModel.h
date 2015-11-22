//
//  MovieModel.h
//  MovieIO
//
//  Created by chishengchien on 2015/11/22.
//  Copyright © 2015年 richi. All rights reserved.
//

#import "BaseModel.h"

@protocol MovieModelDelegate <NSObject>

@optional
- (void)didGetMovies:(NSArray *)movies;
- (void)failToGetMoviesWithError:(NSError *)error;
@end

@interface MovieModel : BaseModel

@property (nonatomic, weak) id<MovieModelDelegate> delegate;

- (void)moviesByKeyword:(NSString *)keyword;

@end
