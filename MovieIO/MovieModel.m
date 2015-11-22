//
//  MovieModel.m
//  MovieIO
//
//  Created by chishengchien on 2015/11/22.
//  Copyright © 2015年 richi. All rights reserved.
//

#import "MovieModel.h"
#import "Movie.h"

@implementation MovieModel

- (void)moviesByKeyword:(NSString *)keyword {
    
    NSString *url = @"http://api.movies.io/movies/search";
    NSDictionary *params = @{@"q":keyword};

    NSMutableURLRequest *request = [self generalURLRequestWithHTTPMethod:@"GET" URLString:url params:params];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    operation.responseSerializer.acceptableContentTypes = [operation.responseSerializer.acceptableContentTypes setByAddingObject:@"application/json"];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id JSON){
        DLog(@"%@", JSON);
        if ([_delegate respondsToSelector:@selector(didGetMovies:) ]) {
            
            NSMutableArray *moives = @[].mutableCopy;
            
            for (id data in JSON[@"movies"]) {
                [moives addObject:[[Movie alloc] initWithJSONData:data]];
            }
            
            [_delegate didGetMovies:moives];
            
        } else {
            DLog(@"[No delegate method] Got data of movies.");
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if ([_delegate respondsToSelector:@selector(failToGetMoviesWithError:)]) {
            
            [_delegate failToGetMoviesWithError:error];
            
        } else {
            DLog(@"[No delegate method] Fail to get movies with error : %@", error);
        }
        
    }];
    
    [operation start];
    
}

@end
