# FFEvaluationStar
自定义商品评价打分的星星

## 分为两种模式：
  1、默认版本
  2、带标题版本

## 使用方法：
  导入项目内FFStar文件夹内文件，在所需页面引入```#import "FFEvaluationViewController.h"```
  然后初始化即可
  ```
  /**
    默认版初始化
 */
- (FFStarView *)goodsStar {
    if (!_goodsStar) {
        _goodsStar = [[FFStarView alloc] initWithFrame:CGRectZero StarNum:4 NormalImage:@"icon_star_normal_" selectImage:@"icon_star_select_"];
    }
    return _goodsStar;
}
```
  带标题版初始化
  ```
  /**
    带标题版初始化
 */
- (FFStarView *)storeDescriptStar {
    if (!_storeDescriptStar) {
        _storeDescriptStar = [[FFStarView alloc] initWithWithFrame:CGRectZero Title:@"描述相符" StarNum:5 NormalImage:@"icon_star_normal_" selectImage:@"icon_star_select_"];
        
    }
    return _storeDescriptStar;
}
```
## 说明
此文仅表达个人观点，功力尚浅，iOS一路走来也有一些自己的小感悟，特此记录下来，以后如果有跟好的方法会持续更新。如果有小伙伴有好的建议及问题请issuse我
  

