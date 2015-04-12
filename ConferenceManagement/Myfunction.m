//
//  Myfunction.m
//  ConferenceManagement
//
//  Created by MacAir2 on 15/4/12.
//  Copyright (c) 2015年 lixiang. All rights reserved.
//

#import "Myfunction.h"


@implementation Myfunction

- (id)initWithInputArray:(NSArray *)inputArray{
    if ([super init]) {
        _currentIndex = -1;
        _total = 0;
        _output = [[NSMutableArray alloc] init];
        _input = inputArray;
        _isAmComplete = NO;
        _inputTemp = [inputArray mutableCopy];
    }
    return self;
}

- (NSArray *)conferenceManagement{
    [self judgeTheTalk:[self chooseOneTalk]];
    
    return _output;
}

- (Talk *)choose {
    Talk *talk = [_inputTemp objectAtIndex:_currentIndex];
    return talk.step == _output.count+1 ? [self chooseOneTalk] : talk;
}

- (Talk *)chooseOneTalk{
    _currentIndex++;
    if (_currentIndex < _inputTemp.count) {
        return [self choose];
    }
    else{
        return nil;
    }
    
}

- (void)stepBackThenJudgeNextTalk {
    [self stepBack];
    [self judgeTheTalk:[self chooseOneTalk]];
}

- (void)judgePMTalk:(Talk *)talk {
    if ( (_total + talk.time) > 360 && (_total + talk.time) < 420) {
        [self nextStepWithTheTalk:talk];
        return;
    }
    
    ((_total + talk.time) <= 360) ? [self stepWithNextTalkAndContinue:talk] : [self stepBackThenJudgeNextTalk];
    
}

- (void)stepWithNextTalkAndContinue:(Talk *)talk {
    [self nextStepWithTheTalk:talk];
    [self judgeTheTalk:[self chooseOneTalk]];
}

- (void)dealWithTheValidTalk:(Talk *)talk {
    if ( (_total + talk.time) <= 180 ) {
        _isAmComplete = ( (_total + talk.time) == 180 );
        [self stepWithNextTalkAndContinue:talk];
    }
    else {
        _isAmComplete ? [self judgePMTalk:talk] : [self judgeTheTalk:[self chooseOneTalk]];
    }
}

- (void)judgeTheTalk:(Talk *)talk{
    if (!talk) {
        [self stepBackThenJudgeNextTalk];
        
        return;
    }
    
    [self dealWithTheValidTalk:talk];

}

- (void)nextStepWithTheTalk:(Talk *)talk{
    [_output addObject:talk];
    talk.step = _output.count;
    [_inputTemp removeObject:talk];
    _total += talk.time;
    _currentIndex = -1;
}
- (void)stepBack{
    Talk *talk = [_output lastObject];
    _total -= talk.time;
    [_inputTemp addObject:talk];
    [_output removeObject:talk];
    _currentIndex = -1;
    
}

@end
