//
//  Myfunction.h
//  ConferenceManagement
//
//  Created by MacAir2 on 15/4/12.
//  Copyright (c) 2015年 lixiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Talk.h"

@interface Myfunction : NSObject

@property (nonatomic) NSInteger currentIndex;
@property (nonatomic) NSInteger total;
@property (nonatomic) BOOL isAmComplete;
@property (strong, nonatomic) NSMutableArray *output;
@property (strong, nonatomic) NSMutableArray *inputTemp;
@property (strong, nonatomic) NSArray *input;



- (id)initWithInputArray:(NSArray *)inputArray;
- (NSArray *)conferenceManagement;

@end
