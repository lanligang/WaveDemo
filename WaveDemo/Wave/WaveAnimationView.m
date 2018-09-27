//
//  WaveAnimationView.m
//  WaveDemo
//
//  Created by ios2 on 2018/9/27.
//  Copyright © 2018年 ios2. All rights reserved.
//

#import "WaveAnimationView.h"
#import "WaveView.h"
#import "UIView+LG_Frame.h"

@implementation WaveAnimationView

-(instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		self.clipsToBounds = YES;
		[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(didBackNoti:) name:UIApplicationWillEnterForegroundNotification object:nil];
		[self readyToBegin];
	}
	return self;
}
-(void)didBackNoti:(NSNotification *)noti
{
	[self readyToBegin];
}
-(void)loadWaveView
{

	CGFloat phases[4] = {10.5f,5.0f,0.0f,15.0f};
	CGFloat maxY =  CGRectGetHeight(self.frame)/2.0f;
	//振幅
	CGFloat waveCrests[4] = {maxY*0.1,maxY*0.15,maxY*0.14,maxY*0.11};

	CGFloat alphas[4] = {0.3f,0.5f,0.6f,0.5f};
	for (int i = 0; i<4; i++) {
		UIView *lastView = [self viewWithTag:100+i];
		if (lastView) {
			[lastView.layer removeAllAnimations];
			[lastView removeFromSuperview];
		}
		WaveView *waveView = [[WaveView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame) * 2, CGRectGetHeight(self.frame))];
		waveView.phase     = phases[i];
		waveView.waveCrest = waveCrests[i];
		waveView.waveCount = 2;
		waveView.type      = kFillWave|kFillWave;
		[self addSubview:waveView];
		waveView.tag = 100 + i;
		DrawingStyle *fillStyle = [DrawingStyle new];
		fillStyle.fillColor     = [DrawingColor colorWithUIColor:[[UIColor blueColor] colorWithAlphaComponent:alphas[i]]];
		waveView.fillStyle      = fillStyle;
		DrawingStyle *strokeStyle = [DrawingStyle new];
		strokeStyle.strokeColor   = [DrawingColor colorWithUIColor:[[UIColor blueColor] colorWithAlphaComponent:0.25f]];
		strokeStyle.lineWidth     = 0.5f;
		waveView.strokeStyle      = strokeStyle;
	}
}
- (void)readyToBegin
{
	[self loadWaveView];
	CGFloat animationDurations[4] = {2.8f,3.0f,4.5f,5.5f};
	for (int i = 0; i<4; i++) {
		WaveView *waveView = (WaveView *)[self viewWithTag:(100+i)];
		if (waveView) {
			waveView.x   =  0;
			[UIView animateWithDuration:animationDurations[i]
								  delay:0
								options:UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction
							 animations:^{
								 waveView.x = -CGRectGetWidth(self.frame);
							 } completion:nil];
		}
	}
}

-(void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillEnterForegroundNotification object:nil];
}



@end
