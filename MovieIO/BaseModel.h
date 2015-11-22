//
//  BaseModel.h
//  MovieIO
//
//  Created by chishengchien on 2015/11/22.
//  Copyright © 2015年 richi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

#pragma mark - request method
- (NSMutableURLRequest *)generalURLRequestWithHTTPMethod:(NSString *)method URLString:(NSString *)url params:(NSDictionary *)params;

@end
