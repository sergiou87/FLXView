#import "UIView+FLXNode.h"

#import "FLXNode.h"

#import "FLXView.h"

NS_ASSUME_NONNULL_BEGIN

@implementation FLXView

#pragma mark - Lifecycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self == nil) return nil;

    _childAlignment = FLXChildAlignmentStart;

    return self;
}

#pragma mark - FLXView

- (void)setDirection:(FLXDirection)direction {
    _direction = direction;

    [self setNeedsLayout];
}

- (void)setChildAlignment:(FLXChildAlignment)childAlignment {
    _childAlignment = childAlignment;

    [self setNeedsLayout];
}

- (void)setJustification:(FLXJustification)justification {
    _justification = justification;

    [self setNeedsLayout];
}

- (void)setPadding:(FLXPadding)padding {
    _padding = padding;

    [self setNeedsLayout];
}

- (void)setPaddingValue:(CGFloat)padding {
    self.padding = FLXPaddingMake(padding, padding, padding, padding);
}

- (CGFloat)paddingLeft {
    return self.padding.left;
}

- (void)setPaddingLeft:(CGFloat)left {
    FLXPadding padding = self.padding;
    padding.left = left;
    self.padding = padding;
}

- (CGFloat)paddingRight {
    return self.padding.right;
}

- (void)setPaddingRight:(CGFloat)right {
    FLXPadding padding = self.padding;
    padding.right = right;
    self.padding = padding;
}

- (CGFloat)paddingTop {
    return self.padding.top;
}

- (void)setPaddingTop:(CGFloat)top {
    FLXPadding padding = self.padding;
    padding.top = top;
    self.padding = padding;
}

- (CGFloat)paddingBottom {
    return self.padding.bottom;
}

- (void)setPaddingBottom:(CGFloat)bottom {
    FLXPadding padding = self.padding;
    padding.bottom = bottom;
    self.padding = padding;
}

- (void)setWrap:(BOOL)wrap {
    _wrap = wrap;

    [self setNeedsLayout];
}

#pragma mark - UIView+FLXNode

- (FLXNode *)flx_generateTree {
    FLXNode *node = [super flx_generateTree];

    node.childAlignment = self.childAlignment;

    NSMutableArray *children = [NSMutableArray arrayWithCapacity:self.subviews.count];
    for (UIView *subview in self.subviews) {
        [children addObject:[subview flx_generateTree]];
    }
    node.children = children;

    node.direction = self.direction;
    node.justification = self.justification;
    node.origin = CGPointZero;
    node.padding = self.padding;
    node.wrap = self.wrap;

    return node;
}

#pragma mark - UIView

- (CGSize)sizeThatFits:(CGSize)size {
    FLXNode *node = [self flx_generateTree];
    node.size = CGSizeMake(size.width, NAN);

    [node layoutWithMaxWidth:size.width];

    return node.size;
}

- (void)layoutSubviews {
    FLXNode *node = [self flx_generateTree];
    node.size = self.bounds.size;

    [node layoutWithMaxWidth:self.bounds.size.width];

    for (FLXNode *subnode in node.children) {
        subnode.view.frame = (CGRect){
            .origin = subnode.origin,
            .size = subnode.size
        };
    }
}

@end

NS_ASSUME_NONNULL_END
