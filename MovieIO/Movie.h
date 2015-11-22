//
//  Movie.h
//  MovieIO
//
//  Created by chishengchien on 2015/11/22.
//  Copyright © 2015年 richi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSNumber *year;
@property (nonatomic, strong) NSNumber *rating;
@property (nonatomic, strong) NSString *poster;

- (id)initWithJSONData:(id)data;

@end
