//
//  UILabel+WLKTLabelTools.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/8/22.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "UILabel+WLKTLabelTools.h"

@implementation UILabel (WLKTLabelTools)

- (void)alignTop {
    CGSize fontSize = [self.text sizeWithAttributes:@{NSFontAttributeName: self.font}];
    double finalHeight = fontSize.height * self.numberOfLines;
    double finalWidth = self.frame.size.width;    //expected width of label
    CGSize theStringSize = [self.text boundingRectWithSize:CGSizeMake(finalWidth, finalHeight) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.font} context:nil].size;
    int newLinesToPad = (finalHeight  - theStringSize.height) / fontSize.height;
    for(int i=0; i<abs(newLinesToPad); i++)
        self.text = [self.text stringByAppendingString:@"\n "];
}

- (void)alignBottom {
    CGSize fontSize = [self.text sizeWithAttributes:@{NSFontAttributeName: self.font}];
    double finalHeight = fontSize.height * self.numberOfLines;
    double finalWidth = self.frame.size.width;    //expected width of label
    CGSize theStringSize = [self.text boundingRectWithSize:CGSizeMake(finalWidth, finalHeight) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.font} context:nil].size;
    int newLinesToPad = (finalHeight  - theStringSize.height) / fontSize.height;
    for(int i=0; i<abs(newLinesToPad); i++)
        self.text = [NSString stringWithFormat:@" \n%@",self.text];
}

+ (UILabel *)itemLabelWithText:(NSString *)str{
    UILabel *l = [[UILabel alloc]init];
    l.textAlignment = NSTextAlignmentCenter;
    l.font = [UIFont systemFontOfSize:9 *ScreenRatio_6];
    l.textColor = [UIColor colorWithHexString:@"#ee402d"];
    l.layer.cornerRadius = 1.5;
    l.layer.borderColor = [UIColor colorWithHexString:@"#ee402d"].CGColor;
    l.layer.borderWidth = 0.3;
    l.layer.masksToBounds = YES;
    l.text = str;
    return l;
}


@end
