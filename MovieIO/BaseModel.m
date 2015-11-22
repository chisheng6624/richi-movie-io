//
//  BaseModel.m
//  MovieIO
//
//  Created by chishengchien on 2015/11/22.
//  Copyright © 2015年 richi. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

/*
 *  組合request
 */
- (NSMutableURLRequest *)generalURLRequestWithHTTPMethod:(NSString *)method URLString:(NSString *)url params:(NSDictionary *)params {
    
    if (params) {
        DLog(@"request url : %@ params : %@", url, params);
    }
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:[method uppercaseString] URLString:url parameters:params error:nil];
    request.cachePolicy = NSURLRequestUseProtocolCachePolicy;
    request.timeoutInterval = 10;
    
    return request;
    
}

@end
