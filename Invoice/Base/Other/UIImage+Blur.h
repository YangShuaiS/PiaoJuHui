@import UIKit;

@interface UIImage (Blur)


/**
 设置图片的模糊效果

 @param tintColor 背景颜色
 @param colorOpacity 不透明度
 @param saturationDeltaFactor 饱和度
 @param blurRadius 模糊度
 @param completion 返回值
 */
- (void)blurImageWithColor:(UIColor *)tintColor
              colorOpacity:(CGFloat)colorOpacity
     saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                blurRadius:(CGFloat)blurRadius
                completion:(void(^)(UIImage *blurImage))completion;

- (UIImage *)blurImageWithRadius:(CGFloat)blurRadius
                       tintColor:(UIColor *)tintColor
           saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                       maskImage:(UIImage *)maskImage;

@end
