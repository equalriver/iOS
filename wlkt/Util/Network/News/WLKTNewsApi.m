//
//  WLKTNewsApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/1/2.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTNewsApi.h"

@interface WLKTNewsApi ()
@property (copy, nonatomic) NSString *newstag;
@property (nonatomic) WLKTNewsType type;
@property (nonatomic) NSInteger page;
@end

@implementation WLKTNewsApi
- (instancetype)initWithType:(WLKTNewsType)type page:(NSInteger)page
{
    self = [super init];
    if (self) {
        _type = type;
        _page = page;
    }
    return self;
}

- (instancetype)initWithType:(WLKTNewsType)type page:(NSInteger)page newstag:(NSString *)newstag
{
    self = [super init];
    if (self) {
        _type = type;
        _page = page;
        _newstag = newstag;
    }
    return self;
}

- (NSString *)requestUrl {
    switch (self.type) {
        case WLKTNewsTypeFrontPage:
            return @"news/toutiao";
            
        case WLKTNewsTypeVideo:
            return @"news/video";
            
        case WLKTNewsTypeNews:
            return @"news/news";
            
        case WLKTNewsTypeComment:
            return @"news/comment";
        
        case WLKTNewsTypeComplaint:
            return @"news/tousu";
            
        case WLKTNewsType_Q_A:
            return @"news/ques";
            
        default:
            break;
    }
    return @"";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    if (self.type == WLKTNewsTypeNews) {
        return @{
                 @"page": @(_page),
                 @"newstag": _newstag ? _newstag : @""
                 };
    }
    return @{
             @"page": @(_page)
             };
}

@end
