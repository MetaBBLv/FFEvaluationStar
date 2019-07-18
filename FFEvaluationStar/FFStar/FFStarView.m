//
//  FFStarView.m
//  FFEvaluationStar
//
//  Created by zhou on 2019/7/16.
//  Copyright © 2019 MissZhou. All rights reserved.
//

#import "FFStarView.h"

@interface FFStarView ()
@property (nonatomic, strong) UILabel *desLabel;    //评价描述
@end

@implementation FFStarView

- (instancetype)initWithFrame:(CGRect)frame StarNum:(NSInteger)starNum NormalImage:(NSString *)normalImage selectImage:(NSString *)selectImage {
    
    return [self initWithWithFrame:frame Title:@"" StarNum:starNum NormalImage:normalImage selectImage:selectImage];
}

- (instancetype)initWithWithFrame:(CGRect)frame Title:(NSString *)title StarNum:(NSInteger)starNum NormalImage:(NSString *)normalImage selectImage:(NSString *)selectImage {
    
    if (self = [super initWithFrame:frame]) {
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.frame = CGRectMake(0, 0, 60, 20);
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.text = title;
        titleLabel.textAlignment = NSTextAlignmentLeft;
        titleLabel.font = [UIFont systemFontOfSize:14];
        
        if (![title isEqualToString:@""]) {
            [self addSubview:titleLabel];
        }
        
        
        CGFloat btnWidth = 20;
        CGFloat btnHeight = 20;
        CGFloat btnColumnSpacing = 2;
        CGFloat btnLeftWdith = titleLabel.text.length > 0 ? titleLabel.frame.size.width : 0.0;
        
        for (int i = 0; i < starNum; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(btnLeftWdith, 0, btnWidth, btnHeight);
            btn.tag = 1000 + i;
            
            btnLeftWdith = btnLeftWdith + btnColumnSpacing + btnWidth;
            
            [btn setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:selectImage] forState:UIControlStateSelected];
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
        }
        
        _desLabel = [[UILabel alloc] init];
        _desLabel.frame = CGRectMake(btnLeftWdith, 0, 100, 20);
        _desLabel.text = @"";
        _desLabel.font = [UIFont systemFontOfSize:13];
        _desLabel.textAlignment = NSTextAlignmentLeft;
        _desLabel.textColor = [UIColor whiteColor];
        [self addSubview:_desLabel];
    }
    return self;
}


- (void)btnClick:(UIButton *) sender {
    for (int i = 0; i < 5; i++) {
        UIButton *btn = (UIButton *)[self viewWithTag:i+1000];
        if (i+1000 > sender.tag) {
            btn.selected = NO;
        } else {
            btn.selected = YES;
        }
    }
    
    switch (sender.tag) {
        case 1000:
        {
            _desLabel.text = @"非常差";
        }
            break;
        case 1001:
        {
            _desLabel.text = @"差";
        }
            break;
        case 1002:
        {
            _desLabel.text = @"一般";
        }
            break;
        case 1003:
        {
            _desLabel.text = @"满意";
        }
            break;
        case 1004:
        {
            _desLabel.text = @"非常满意";
        }
            break;
    }
}
@end
