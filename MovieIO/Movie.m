//
//  Movie.m
//  MovieIO
//
//  Created by chishengchien on 2015/11/22.
//  Copyright © 2015年 richi. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (id)initWithJSONData:(id)data {
    
    if ( self = [super init] ) {
        _title = data[@"title"];
        _year = data[@"year"];
        _rating = data[@"rating"];
        _poster = data[@"poster"][@"urls"][@"w185"];
    }
    
    return self;
}

@end
