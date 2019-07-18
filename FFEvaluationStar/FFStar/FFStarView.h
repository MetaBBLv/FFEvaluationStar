//
//  FFStarView.h
//  FFEvaluationStar
//
//  Created by zhou on 2019/7/16.
//  Copyright © 2019 MissZhou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FFStarView : UIView

/**
 评价星星(常规版)

 @param frame 父容器frame
 @param starNum 星星个数
 @param normalImage 默认图片
 @param selectImage 选中后图片
 @return FF
 */
- (instancetype)initWithFrame:(CGRect)frame
                      StarNum:(NSInteger)starNum
                  NormalImage:(NSString *)normalImage
                  selectImage:(NSString *)selectImage;

/**
 评价星星（带标题版）
 
 @param frame 父容器frame
 @param title 标题
 @param starNum 星星个数
 @param normalImage 默认图片
 @param selectImage 选中后图片
 @return FF
 */
- (instancetype)initWithWithFrame:(CGRect)frame
                            Title:(NSString *)title
                          StarNum:(NSInteger)starNum
                      NormalImage:(NSString *)normalImage
                      selectImage:(NSString *)selectImage;

@end

NS_ASSUME_NONNULL_END
