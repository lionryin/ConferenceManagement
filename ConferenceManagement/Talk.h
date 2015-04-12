//
//  Talk.h
//  ConferenceManagement
//
//  Created by MacAir2 on 15/4/11.
//  Copyright (c) 2015年 lixiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Talk : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic) NSInteger time;
@property (nonatomic) NSInteger step;

- (id)initWithTitle:(NSString *)aTitle andTime:(NSInteger)aTime;


@end
