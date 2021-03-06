//
//  LuckyRecordLayout.h
//  WinTreasure
//
//  Created by Apple on 16/6/27.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LuckyRecordModel.h"

#define kLuckyRecordLabelMargin 5
#define kLuckyRecordMargin 15
#define kLuckyRecordPaddingLeft 15
#define kLuckyRecordPaddingRight 8
#define kLuckyRecordImageWidth 70
#define kLuckyRecordNameWidth kScreenWidth-kLuckyRecordPaddingLeft*2-kLuckyRecordImageWidth-kLuckyRecordPaddingRight
#define kLuckyRecordPrizeViewHeight 48
#define kLuckyRecordButtonWidth 70
#define kLuckyRecordButtonHeight 30

@interface LuckyRecordLayout : NSObject

/**顶部留白
 */
@property (nonatomic, assign) CGFloat marginTop;

/**底部留白
 */
@property (nonatomic, assign) CGFloat marginBottom;

/**产品名高度
 */
@property (nonatomic, assign) CGFloat nameHeight;

@property (nonatomic, strong) YYTextLayout *nameLayout;

/**期号高度
 */
@property (nonatomic, assign) CGFloat periodHeight;

@property (nonatomic, strong) YYTextLayout *periodLayout;

/**总需人次高度
 */
@property (nonatomic, assign) CGFloat amountHeight;

@property (nonatomic, strong) YYTextLayout *amountLayout;

/**幸运号码高度
 */
@property (nonatomic, assign) CGFloat luckyNumberHeight;

@property (nonatomic, strong) YYTextLayout *luckyNumberLayout;

/**参与人次高度
 */
@property (nonatomic, assign) CGFloat partInHeight;

@property (nonatomic, strong) YYTextLayout *partInLayout;

/**登记领奖视图高度
 */
@property (nonatomic, assign) CGFloat prizeViewHeight;

/**揭晓时间高度
 */
@property (nonatomic, assign) CGFloat timeHeight;

@property (nonatomic, strong) YYTextLayout *timeLayout;

/**总高度
 */
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, strong) LuckyRecordModel *model;

- (instancetype)initWithModel:(LuckyRecordModel *)model;

@end
