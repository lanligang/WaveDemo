//
//  WaveView.h
//  DrawRectObject
//
//  Created by YouXianMing on 16/8/1.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "CustomDrawingView.h"

typedef enum : NSUInteger {
    
    kStrokeWave = 1 << 2,
    kFillWave   = 1 << 3 ,
    
} EWaveViewType;

@interface WaveView : CustomDrawingView

/**
 *  Wave type, default is kFillWave.
 */
@property (nonatomic,assign) EWaveViewType type;

/**
 *  Sine phase, default is 0.
 */
@property (nonatomic,assign) CGFloat  phase;

/**
 *  Wave crest height, Default is 10.
 */
@property (nonatomic,assign) CGFloat  waveCrest;

/**
 *  Full wave count,  default is 1.
 */
@property (nonatomic,assign) NSInteger waveCount;

/**
 *  The fill style.
 */
@property (nonatomic, strong) DrawingStyle *fillStyle;

/**
 *  The stroke style.
 */
@property (nonatomic, strong) DrawingStyle *strokeStyle;

@end
