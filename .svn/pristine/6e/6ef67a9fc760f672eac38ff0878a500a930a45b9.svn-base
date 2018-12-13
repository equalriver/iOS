//
//  WLKTLocationChange.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/20.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTLocationChange.h"

static const double a = 6378245.0;
static const double ee = 0.00669342162296594323;

@implementation WLKTLocationChange
+ (CLLocationCoordinate2D)wgs84ToGCJ_02:(CLLocationCoordinate2D)coordinate{
    CLLocationCoordinate2D adjustLoc;
    double adjustLat = [self transformLatWithX:coordinate.longitude - 105.0 withY:coordinate.latitude - 35.0];
    double adjustLon = [self transformLonWithX:coordinate.longitude - 105.0 withY:coordinate.latitude - 35.0];
    long double radLat = coordinate.latitude / 180.0 * M_PI;
    long double magic = sin(radLat);
    magic = 1 - ee * magic * magic;
    long double sqrtMagic = sqrt(magic);
    adjustLat = (adjustLat * 180.0) / ((a * (1 - ee)) / (magic * sqrtMagic) * M_PI);
    adjustLon = (adjustLon * 180.0) / (a / sqrtMagic * cos(radLat) * M_PI);
    adjustLoc.latitude = coordinate.latitude + adjustLat;
    adjustLoc.longitude = coordinate.longitude + adjustLon;

    return adjustLoc;
}

+ (double)transformLatWithX:(double)x withY:(double)y {
    double lat = -100.0 + 2.0 * x + 3.0 * y + 0.2 * y * y + 0.1 * x * y + 0.2 * sqrt(fabs(x));
    
    lat += (20.0 * sin(6.0 * x * M_PI) + 20.0 *sin(2.0 * x * M_PI)) * 2.0 / 3.0;
    lat += (20.0 * sin(y * M_PI) + 40.0 * sin(y / 3.0 * M_PI)) * 2.0 / 3.0;
    lat += (160.0 * sin(y / 12.0 * M_PI) + 320 * sin(y * M_PI / 30.0)) * 2.0 / 3.0;
    return lat;
}

+ (double)transformLonWithX:(double)x withY:(double)y {
    double lon = 300.0 + x + 2.0 * y + 0.1 * x * x + 0.1 * x * y + 0.1 * sqrt(fabs(x));
    lon += (20.0 * sin(6.0 * x * M_PI) + 20.0 * sin(2.0 * x * M_PI)) * 2.0 / 3.0;
    lon += (20.0 * sin(x * M_PI) + 40.0 * sin(x / 3.0 * M_PI)) * 2.0 / 3.0;
    lon += (150.0 * sin(x / 12.0 * M_PI) + 300.0 * sin(x / 30.0 * M_PI)) * 2.0 / 3.0;
    return lon;
}

// GCJ-02 坐标转换成 BD-09 坐标
+ (CLLocationCoordinate2D)MarsGS2BaiduGS:(CLLocationCoordinate2D)coordinate
{
    double x_pi = M_PI * 3000.0 / 180.0;
    double x = coordinate.longitude, y = coordinate.latitude;
    double z = sqrt(x * x + y * y) + 0.00002 * sin(y * x_pi);
    double theta = atan2(y, x) + 0.000003 * cos(x * x_pi);
    double bd_lon = z * cos(theta) + 0.0065;
    double bd_lat = z * sin(theta) + 0.006;
    return CLLocationCoordinate2DMake(bd_lat, bd_lon);
}

// BD-09 坐标转换成 GCJ-02 坐标
+ (CLLocationCoordinate2D)BaiduGS2MarsGS:(CLLocationCoordinate2D)coordinate
{
    double x_pi = M_PI * 3000.0 / 180.0;
    double x = coordinate.longitude - 0.0065, y = coordinate.latitude - 0.006;
    double z = sqrt(x * x + y * y) - 0.00002 * sin(y * x_pi);
    double theta = atan2(y, x) - 0.000003 * cos(x * x_pi);
    double gg_lon = z * cos(theta);
    double gg_lat = z * sin(theta);
    return CLLocationCoordinate2DMake(gg_lat, gg_lon);
}
@end
