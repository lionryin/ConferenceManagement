//
//  Talk.m
//  ConferenceManagement
//
//  Created by MacAir2 on 15/4/11.
//  Copyright (c) 2015年 lixiang. All rights reserved.
//

#import "Talk.h"

@implementation Talk
- (id)initWithTitle:(NSString *)aTitle andTime:(NSInteger)aTime{
    if ([super init]) {
        self.title = aTitle;
        self.time = aTime;
        self.step = -1;
    }
    
    return self;
}

@end
