#import <objc/runtime.h>

#import "FLXData.h"

#import "UIView+Flex.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Flex_Private)

@property (readonly, nonatomic, strong) FLXData *flx_data;

@end

@implementation UIView (Flex)

- (FLXData *)flx_data {
    FLXData *data = objc_getAssociatedObject(self, _cmd);

    if (data == nil) {
        data = [[FLXData alloc] init];
        objc_setAssociatedObject(self, _cmd, data, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }

    return data;
}

- (CGFloat)flx_flex {
    return self.flx_data.flex;
}

- (void)setFlx_flex:(CGFloat)flex {
    self.flx_data.flex = flex;

    [self.superview setNeedsLayout];
}

- (FLXLayoutStrategy *)flx_layoutStrategy {
    return self.flx_data.layoutStrategy;
}

- (void)setFlx_layoutStrategy:(FLXLayoutStrategy *)layoutStrategy {
    self.flx_data.layoutStrategy = layoutStrategy;

    [self.superview setNeedsLayout];
}

- (FLXMargins)flx_margins {
    return self.flx_data.margins;
}

- (void)setFlx_margins:(FLXMargins)margins {
    self.flx_data.margins = margins;

    [self.superview setNeedsLayout];
}

- (void)flx_setMarginValue:(CGFloat)margin {
    self.flx_margins = FLXMarginsMake(margin, margin, margin, margin);
}

- (CGFloat)flx_marginLeft {
    return self.flx_margins.left;
}

- (void)setFlx_marginLeft:(CGFloat)margin {
    FLXMargins margins = self.flx_margins;
    margins.left = margin;
    self.flx_margins = margins;
}

- (CGFloat)flx_marginRight {
    return self.flx_margins.right;
}

- (void)setFlx_marginRight:(CGFloat)margin {
    FLXMargins margins = self.flx_margins;
    margins.right = margin;
    self.flx_margins = margins;
}

- (CGFloat)flx_marginTop {
    return self.flx_margins.top;
}

- (void)setFlx_marginTop:(CGFloat)margin {
    FLXMargins margins = self.flx_margins;
    margins.top = margin;
    self.flx_margins = margins;
}

- (CGFloat)flx_marginBottom {
    return self.flx_margins.bottom;
}

- (void)setFlx_marginBottom:(CGFloat)margin {
    FLXMargins margins = self.flx_margins;
    margins.bottom = margin;
    self.flx_margins = margins;
}

- (FLXSelfAlignment)flx_selfAlignment {
    return self.flx_data.selfAlignment;
}

- (void)setFlx_selfAlignment:(FLXSelfAlignment)selfAlignment {
    self.flx_data.selfAlignment = selfAlignment;

    [self.superview setNeedsLayout];
}

@end

NS_ASSUME_NONNULL_END
