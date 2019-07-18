//
//  FFEvaluationViewController.m
//  bosheng
//
//  Created by zhou on 2019/7/16.
//  Copyright © 2019 bosheng. All rights reserved.
//

#import "FFEvaluationViewController.h"
#import "FFStarView.h"
#import "Masonry.h"

//6宽高比例
#define WIDTH_6_SCALE 375.0 * [UIScreen mainScreen].bounds.size.width
#define HEIGHT_6_SCALE 667.0 * [UIScreen mainScreen].bounds.size.width
//字体
#define FONTANDBOLD(FONTSIZE) [UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEMFONT(FONTSIZE) [UIFont systemFontOfSize:FONTSIZE]
/**iphone X 导航栏 */
#define SafeAreaTopHeight ([UIScreen mainScreen].bounds.size.height == 812.0 ? 88 : 64)
/**iphone X tabbar底部 */
#define SafeAreaBottomHeight ([UIScreen mainScreen].bounds.size.height == 812.0 ? 34 : 0)


@interface FFEvaluationViewController ()<UITextViewDelegate>
///商品信息 *********************************************************************
@property (nonatomic, strong) UIView *goodsInfoView;
///商品图片
@property (nonatomic, strong) UIImageView *goodsImageView;
///商品名称
@property (nonatomic, strong) UILabel *goodsTitleLabel;
///店铺名称
@property (nonatomic, strong) UILabel *storeNameLabel;

///商品评价 *********************************************************************
@property (nonatomic, strong) UIView *goodsEvaluationView;
///商品评价标题
@property (nonatomic, strong) UILabel *goodsEvaluationTitleLabel;
///商品评价星星
@property (nonatomic, strong) FFStarView *goodsStar;
///商品评价内容
@property (nonatomic, strong) UITextView *contentTextView;
///商品评价内容输入前提示文字
@property (nonatomic, strong) UILabel *promptLabel;
///商品评价内容文本输入字数监听
@property (nonatomic, strong) UILabel *listenInputNumberLabel;

///店铺评价 *********************************************************************
@property (nonatomic, strong) UIView *storeEvaluationView;
///店铺评价标题
@property (nonatomic, strong) UILabel *storeEvaluationTitleLabel;
///店铺评价：描述相符
@property (nonatomic, strong) FFStarView *storeDescriptStar;
///店铺评价：物流服务
@property (nonatomic, strong) FFStarView *storelogisticsStar;
///店铺评价：服务态度
@property (nonatomic, strong) FFStarView *storeServiceStar;

///匿名评价 *********************************************************************
@property (nonatomic, strong) UIView *anonymousView;
///是否匿名评价
@property (nonatomic, strong) UIButton *isAnonymousBtn;

///评价提交
@property (nonatomic, strong) UIButton *evaluationBtn;

@end

@implementation FFEvaluationViewController

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpUI];
}

#pragma mark - setupUI
- (void)setUpUI{
    self.title = @"评价商品";
    self.view.backgroundColor = [UIColor colorWithRed:0.16 green:0.13 blue:0.22 alpha:1.00];
    [self.view addSubview:self.goodsInfoView];
    [self.goodsInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(SafeAreaTopHeight + 10/WIDTH_6_SCALE);
        make.left.mas_equalTo(10/WIDTH_6_SCALE);
        make.right.mas_equalTo(-10/WIDTH_6_SCALE);
        make.height.mas_equalTo(90/WIDTH_6_SCALE);
    }];
    [self.view addSubview:self.goodsEvaluationView];
    [self.goodsEvaluationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsInfoView.mas_bottom).with.offset(10/WIDTH_6_SCALE);
        make.left.mas_equalTo(10/WIDTH_6_SCALE);
        make.right.mas_equalTo(-10/WIDTH_6_SCALE);
        make.height.mas_equalTo(150/WIDTH_6_SCALE);
    }];
    [self.view addSubview:self.storeEvaluationView];
    [self.storeEvaluationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsEvaluationView.mas_bottom).with.offset(10/WIDTH_6_SCALE);
        make.left.mas_equalTo(10/WIDTH_6_SCALE);
        make.right.mas_equalTo(-10/WIDTH_6_SCALE);
        make.height.mas_equalTo(150/WIDTH_6_SCALE);
    }];
    [self.view addSubview:self.anonymousView];
    [self.anonymousView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.storeEvaluationView.mas_bottom).with.offset(10/WIDTH_6_SCALE);
        make.left.mas_equalTo(10/WIDTH_6_SCALE);
        make.right.mas_equalTo(-10/WIDTH_6_SCALE);
        make.height.mas_equalTo(40/WIDTH_6_SCALE);
    }];
    [self.view addSubview:self.evaluationBtn];
    [self.evaluationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.anonymousView.mas_bottom).with.offset(10/WIDTH_6_SCALE);
        make.left.mas_equalTo(10/WIDTH_6_SCALE);
        make.right.mas_equalTo(-10/WIDTH_6_SCALE);
        make.height.mas_equalTo(40/WIDTH_6_SCALE);
    }];
}

- (UIView *)goodsInfoView{
    if (!_goodsInfoView) {
        _goodsInfoView = [[UIView alloc] init];
        _goodsInfoView.backgroundColor = [UIColor colorWithRed:0.20 green:0.18 blue:0.29 alpha:1.00];
        _goodsInfoView.layer.cornerRadius = 5;
        _goodsInfoView.layer.masksToBounds = YES;
        
        [_goodsInfoView addSubview:self.goodsImageView];
        [self.goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(10/WIDTH_6_SCALE);
            make.bottom.mas_equalTo(-10/WIDTH_6_SCALE);
            make.width.mas_equalTo(70/WIDTH_6_SCALE);
        }];
        [_goodsInfoView addSubview:self.goodsTitleLabel];
        [self.goodsTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10/WIDTH_6_SCALE);
            make.left.equalTo(self.goodsImageView.mas_right).with.offset(10/WIDTH_6_SCALE);
            make.right.mas_equalTo(-10/WIDTH_6_SCALE);
            make.height.mas_equalTo(55/WIDTH_6_SCALE);
        }];
        [_goodsInfoView addSubview:self.storeNameLabel];
        [self.storeNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.goodsTitleLabel.mas_bottom).with.offset(0/WIDTH_6_SCALE);
            make.left.equalTo(self.goodsImageView.mas_right).with.offset(10/WIDTH_6_SCALE);
            make.height.mas_equalTo(15/WIDTH_6_SCALE);
        }];
    }
    return _goodsInfoView;
}

- (UIImageView *)goodsImageView{
    if (!_goodsImageView) {
        _goodsImageView = [[UIImageView alloc] init];
        _goodsImageView.image = [UIImage imageNamed:@"icon_fish"];
        _goodsImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _goodsImageView;
}

- (UILabel *)goodsTitleLabel{
    if (!_goodsTitleLabel) {
        _goodsTitleLabel = [[UILabel alloc] init];
        _goodsTitleLabel.text = @"月黄鲜活生鲜螃蟹苏州市阳澄湖行业大闸蟹协会臻原生礼盒";
        _goodsTitleLabel.font = SYSTEMFONT(14);
        _goodsTitleLabel.textAlignment = NSTextAlignmentLeft;
        _goodsTitleLabel.textColor = [UIColor whiteColor];
        _goodsTitleLabel.numberOfLines = 0;
    }
    return _goodsTitleLabel;
}

- (UILabel *)storeNameLabel{
    if (!_storeNameLabel) {
        _storeNameLabel = [[UILabel alloc] init];
        _storeNameLabel.text = @"狮帆·聚贤阁";
        _storeNameLabel.font = SYSTEMFONT(12);
        _storeNameLabel.textAlignment = NSTextAlignmentLeft;
        _storeNameLabel.textColor = [UIColor colorWithRed:0.59 green:0.59 blue:0.59 alpha:1.00];
    }
    return _storeNameLabel;
}

- (UIView *)goodsEvaluationView {
    if (!_goodsEvaluationView) {
        _goodsEvaluationView = [[UIView alloc] init];
        _goodsEvaluationView.backgroundColor = [UIColor colorWithRed:0.20 green:0.18 blue:0.29 alpha:1.00];
        _goodsEvaluationView.layer.cornerRadius = 5;
        _goodsEvaluationView.layer.masksToBounds = YES;
        
        [_goodsEvaluationView addSubview:self.goodsEvaluationTitleLabel];
        [self.goodsEvaluationTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(10/WIDTH_6_SCALE);
            make.right.mas_equalTo(-10/WIDTH_6_SCALE);
            make.height.mas_equalTo(40/WIDTH_6_SCALE);
        }];
        [_goodsEvaluationView addSubview:self.goodsStar];
        [self.goodsStar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.goodsEvaluationTitleLabel.mas_bottom).with.offset(0);
            make.left.mas_equalTo(10/WIDTH_6_SCALE);
            make.right.mas_equalTo(-10/WIDTH_6_SCALE);
            make.height.mas_equalTo(20/WIDTH_6_SCALE);
        }];
        [_goodsEvaluationView addSubview:self.contentTextView];
        [self.contentTextView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.goodsStar.mas_bottom).with.offset(0);
            make.left.mas_equalTo(5/WIDTH_6_SCALE);
            make.right.mas_equalTo(-10/WIDTH_6_SCALE);
            make.height.mas_equalTo(80/WIDTH_6_SCALE);
        }];
        
        [_goodsEvaluationView addSubview:self.listenInputNumberLabel];
        [self.listenInputNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-10/WIDTH_6_SCALE);
            make.right.mas_equalTo(-10/WIDTH_6_SCALE);
            make.height.mas_equalTo(15/WIDTH_6_SCALE);
        }];
    }
    return _goodsEvaluationView;
}

- (UILabel *)goodsEvaluationTitleLabel {
    if (!_goodsEvaluationTitleLabel) {
        _goodsEvaluationTitleLabel = [[UILabel alloc] init];
        _goodsEvaluationTitleLabel.text = @"商品评分";
        _goodsEvaluationTitleLabel.font = FONTANDBOLD(15);
        _goodsEvaluationTitleLabel.textAlignment = NSTextAlignmentLeft;
        _goodsEvaluationTitleLabel.textColor = [UIColor whiteColor];
    }
    return _goodsEvaluationTitleLabel;
}

- (FFStarView *)goodsStar {
    if (!_goodsStar) {
        _goodsStar = [[FFStarView alloc] initWithFrame:CGRectZero StarNum:4 NormalImage:@"icon_star_normal_" selectImage:@"icon_star_select_"];
//        [[FFStarView alloc] initWithWithFrame:CGRectZero Title:@"商品评分" StarNum:5 NormalImage:@"icon_star_normal_" selectImage:@"icon_star_select_"];
    }
    return _goodsStar;
}

- (UITextView *)contentTextView {
    if (!_contentTextView) {
        _contentTextView = [[UITextView alloc] init];
        _contentTextView.backgroundColor = [UIColor clearColor];
        _contentTextView.textColor = [UIColor whiteColor];
        _contentTextView.font = SYSTEMFONT(13);
        _contentTextView.keyboardType = UIKeyboardTypeDefault;
        _contentTextView.delegate = self;
        
        [_contentTextView addSubview:self.promptLabel];
        [self.promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(5/WIDTH_6_SCALE);
            make.height.mas_equalTo(30/WIDTH_6_SCALE);
        }];
    }
    return _contentTextView;
}

- (UILabel *)promptLabel {
    if (!_promptLabel) {
        _promptLabel = [[UILabel alloc] init];
        _promptLabel.text = @"商品好不好，您说了算";
        _promptLabel.textColor = [UIColor colorWithRed:0.59 green:0.59 blue:0.59 alpha:1.00];
        _promptLabel.font = SYSTEMFONT(13);
        _promptLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _promptLabel;
}

- (UILabel *)listenInputNumberLabel{
    if (!_listenInputNumberLabel) {
        _listenInputNumberLabel = [[UILabel alloc] init];
        _listenInputNumberLabel.text = @"0/300";
        _listenInputNumberLabel.textColor = [UIColor colorWithRed:0.59 green:0.59 blue:0.59 alpha:1.00];
        _listenInputNumberLabel.font = SYSTEMFONT(12);
        _listenInputNumberLabel.textAlignment = NSTextAlignmentRight;
    }
    return _listenInputNumberLabel;
}

- (UIView *)storeEvaluationView {
    if (!_storeEvaluationView) {
        _storeEvaluationView = [[UIView alloc] init];
        _storeEvaluationView.backgroundColor = [UIColor colorWithRed:0.20 green:0.18 blue:0.29 alpha:1.00];
        _storeEvaluationView.layer.cornerRadius = 5;
        _storeEvaluationView.layer.masksToBounds = YES;
        
        [_storeEvaluationView addSubview:self.storeEvaluationTitleLabel];
        [self.storeEvaluationTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0/WIDTH_6_SCALE);
            make.left.mas_equalTo(10/WIDTH_6_SCALE);
            make.right.mas_equalTo(-10/WIDTH_6_SCALE);
            make.height.mas_equalTo(40/WIDTH_6_SCALE);
        }];
        [_storeEvaluationView addSubview:self.storeDescriptStar];
        [self.storeDescriptStar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.storeEvaluationTitleLabel.mas_bottom).with.offset(5/WIDTH_6_SCALE);
            make.left.mas_equalTo(10/WIDTH_6_SCALE);
            make.right.mas_equalTo(-10/WIDTH_6_SCALE);
            make.height.mas_equalTo(30/WIDTH_6_SCALE);
        }];
        [_storeEvaluationView addSubview:self.storelogisticsStar];
        [self.storelogisticsStar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.storeDescriptStar.mas_bottom).with.offset(5/WIDTH_6_SCALE);
            make.left.mas_equalTo(10/WIDTH_6_SCALE);
            make.right.mas_equalTo(-10/WIDTH_6_SCALE);
            make.height.mas_equalTo(30/WIDTH_6_SCALE);
        }];
        [_storeEvaluationView addSubview:self.storeServiceStar];
        [self.storeServiceStar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.storelogisticsStar.mas_bottom).with.offset(5/WIDTH_6_SCALE);
            make.left.mas_equalTo(10/WIDTH_6_SCALE);
            make.right.mas_equalTo(-10/WIDTH_6_SCALE);
            make.height.mas_equalTo(30/WIDTH_6_SCALE);
        }];
    }
    return _storeEvaluationView;
}

- (UILabel *)storeEvaluationTitleLabel {
    if (!_storeEvaluationTitleLabel) {
        _storeEvaluationTitleLabel = [[UILabel alloc] init];
        _storeEvaluationTitleLabel.text = @"店铺评分";
        _storeEvaluationTitleLabel.textColor = [UIColor whiteColor];
        _storeEvaluationTitleLabel.font = FONTANDBOLD(15);
        _storeEvaluationTitleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _storeEvaluationTitleLabel;
}

/**
 带标题版初始化
 */
- (FFStarView *)storeDescriptStar {
    if (!_storeDescriptStar) {
        _storeDescriptStar = [[FFStarView alloc] initWithWithFrame:CGRectZero Title:@"描述相符" StarNum:5 NormalImage:@"icon_star_normal_" selectImage:@"icon_star_select_"];
        
    }
    return _storeDescriptStar;
}

- (FFStarView *)storelogisticsStar {
    if (!_storelogisticsStar) {
        _storelogisticsStar =
        [[FFStarView alloc] initWithWithFrame:CGRectZero Title:@"物流服务" StarNum:5 NormalImage:@"icon_star_normal_" selectImage:@"icon_star_select_"];
    }
    return _storelogisticsStar;
}

- (FFStarView *)storeServiceStar {
    if (!_storeServiceStar) {
        _storeServiceStar = [[FFStarView alloc] initWithWithFrame:CGRectZero Title:@"服务态度" StarNum:5 NormalImage:@"icon_star_normal_" selectImage:@"icon_star_select_"];
    }
    return _storeServiceStar;
}

- (UIView *)anonymousView {
    if (!_anonymousView) {
        _anonymousView = [[UIView alloc] init];
        _anonymousView.backgroundColor = [UIColor colorWithRed:0.20 green:0.18 blue:0.29 alpha:1.00];
        _anonymousView.layer.cornerRadius = 5;
        _anonymousView.layer.masksToBounds = YES;
        
        [_anonymousView addSubview:self.isAnonymousBtn];
        [self.isAnonymousBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.right.mas_equalTo(-10/WIDTH_6_SCALE);
            make.width.mas_equalTo(80/WIDTH_6_SCALE);
        }];
    }
    return _anonymousView;
}

- (UIButton *)isAnonymousBtn {
    if (!_isAnonymousBtn) {
        _isAnonymousBtn = [[UIButton alloc] init];
        [_isAnonymousBtn setImage:[UIImage imageNamed:@"icon_circle_32*32_"] forState:UIControlStateNormal];
        [_isAnonymousBtn setImage:[UIImage imageNamed:@"icon_circle_select_32*32_"] forState:UIControlStateSelected];
        [_isAnonymousBtn setTitle:@"匿名评价" forState:UIControlStateNormal];
        [_isAnonymousBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _isAnonymousBtn.titleLabel.font = SYSTEMFONT(14);
        [_isAnonymousBtn addTarget:self action:@selector(isAnonymousBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _isAnonymousBtn;
}

- (UIButton *)evaluationBtn {
    if (!_evaluationBtn) {
        _evaluationBtn = [[UIButton alloc] init];
        [_evaluationBtn setTitle:@"评价" forState:UIControlStateNormal];
        [_evaluationBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _evaluationBtn.titleLabel.font = SYSTEMFONT(17);
        _evaluationBtn.layer.cornerRadius = 5;
        _evaluationBtn.layer.masksToBounds = YES;
        _evaluationBtn.backgroundColor = [UIColor colorWithRed:0.86 green:0.43 blue:0.18 alpha:1.00];
        [_evaluationBtn addTarget:self action:@selector(evaluationBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _evaluationBtn;
}

#pragma mark - UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView {
    
    if (textView == self.contentTextView && textView.text.length >300) {
        textView.text = [textView.text substringToIndex:300];
        [self showMessage:@"输入达到最大限制300字"];
    }
    if (textView == self.contentTextView && textView.text.length > 0) {
        self.promptLabel.hidden = YES;
        self.listenInputNumberLabel.text = [NSString stringWithFormat:@"%lu/300",(unsigned long)textView.text.length];
    } else {
        self.promptLabel.hidden = NO;
        self.listenInputNumberLabel.text = @"0/300";
    }
    
    
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    
}


#pragma mark - event response
/**
 是否匿名

 @param sender FF
 */
- (void)isAnonymousBtnAction:(UIButton *)sender {
    sender.selected = !sender.isSelected;
}

/**
 提交评价
 */
- (void)evaluationBtnAction {
    NSLog(@"提交评价");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark - private method
- (void)showMessage:(NSString*)message{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:message preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alertController animated:YES completion:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismissViewControllerAnimated:alertController completion:nil];
    });
}

@end
