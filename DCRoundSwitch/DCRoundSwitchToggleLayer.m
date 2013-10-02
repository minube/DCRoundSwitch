//
//  DCRoundSwitchToggleLayer.m
//
//  Created by Patrick Richards on 29/06/11.
//  MIT License.
//
//  http://twitter.com/patr
//  http://domesticcat.com.au/projects
//  http://github.com/domesticcatsoftware/DCRoundSwitch
//

#import "DCRoundSwitchToggleLayer.h"

@implementation DCRoundSwitchToggleLayer
@synthesize onString, offString, onTintColor, offTintColor, onStringTintColor, onStringShadowTintColor, offStringTintColor, offStringShadowTintColor;
@synthesize drawOnTint;
@synthesize clip;
@synthesize labelFont;

- (void)dealloc
{
	[onString release];
	[offString release];
	[onTintColor release];
    [offTintColor release];
    [onStringTintColor release];
    [onStringShadowTintColor release];
    [offStringTintColor release];
    [offStringShadowTintColor release];

	[super dealloc];
}

- (id)initWithOnString:(NSString *)anOnString offString:(NSString *)anOffString onTintColor:(UIColor *)anOnTintColor
{
	return [self initWithOnString:anOnString offString:anOffString onTintColor:onTintColor offTintColor:nil];
}

- (id)initWithOnString:(NSString *)anOnString offString:(NSString *)anOffString onTintColor:(UIColor *)anOnTintColor offTintColor:(UIColor *)anOffColor
{
    if ((self = [super init]))
	{
		self.onString = anOnString;
		self.offString = anOffString;
		self.onTintColor = anOnTintColor;
        self.offTintColor = anOffColor;
	}
    
	return self;
}

- (UIFont *)labelFont
{
	return [UIFont boldSystemFontOfSize:ceilf(self.bounds.size.height * .6)];
}

- (void)drawInContext:(CGContextRef)context
{
	CGFloat knobRadius = self.bounds.size.height - 2.0;
	CGFloat knobCenter = self.bounds.size.width / 2.0;
	CGRect knobRect = CGRectMake(knobCenter - knobRadius / 2.0, 1.0, knobRadius, knobRadius);

	if (self.clip)
	{
		UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(-self.frame.origin.x + 0.5, 0, self.bounds.size.width / 2.0 + self.bounds.size.height / 2.0 - 1.5, self.bounds.size.height) cornerRadius:self.bounds.size.height / 2.0];
		CGContextAddPath(context, bezierPath.CGPath);
		CGContextClip(context);
	}

	// on tint color
	if (self.drawOnTint)
	{
		CGContextSetFillColorWithColor(context, self.onTintColor.CGColor);
		CGContextFillRect(context, CGRectMake(0, 0, knobCenter, self.bounds.size.height));
	}

	// off tint color (white)
    UIColor *offColor = [UIColor colorWithWhite:0.963 alpha:1.0];
    if (self.offTintColor) {
        offColor = self.offTintColor;
    }
	CGContextSetFillColorWithColor(context, offColor.CGColor);
	CGContextFillRect(context, CGRectMake(knobCenter, 0, self.bounds.size.width - knobCenter, self.bounds.size.height));

	// knob shadow
	CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 1.5, [UIColor colorWithWhite:0.2 alpha:1.0].CGColor);
	CGContextSetStrokeColorWithColor(context, [UIColor colorWithWhite:0.42 alpha:1.0].CGColor);
	CGContextSetLineWidth(context, 1.0);
	CGContextStrokeEllipseInRect(context, knobRect);
	CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 0, NULL);
	

	// strings
	CGFloat textSpaceWidth = (self.bounds.size.width / 2) - (knobRadius / 2);

	UIGraphicsPushContext(context);

	// 'ON' state label (self.onString)
	CGSize onTextSize = [self.onString sizeWithFont:self.labelFont];
	CGPoint onTextPoint = CGPointMake((textSpaceWidth - onTextSize.width) / 2.0 + knobRadius * .15, floorf((self.bounds.size.height - onTextSize.height) / 2.0) + 1.0);
	if (self.onStringShadowTintColor) {
        [self.onStringShadowTintColor set];
    } else {
        [[UIColor colorWithWhite:0.45 alpha:1.0] set]; // .2 & .4
    }
	[self.onString drawAtPoint:CGPointMake(onTextPoint.x + 1.0, onTextPoint.y) withFont:self.labelFont];
    if (self.onStringTintColor) {
        [self.onStringTintColor set];
    } else {
        [[UIColor whiteColor] set];
    }
	[self.onString drawAtPoint:onTextPoint withFont:self.labelFont];

	// 'OFF' state label (self.offString)
	CGSize offTextSize = [self.offString sizeWithFont:self.labelFont];
	CGPoint offTextPoint = CGPointMake(textSpaceWidth + (textSpaceWidth - offTextSize.width) / 2.0 + knobRadius * .86, floorf((self.bounds.size.height - offTextSize.height) / 2.0) + 1.0);
	if (self.offStringShadowTintColor) {
        [self.offStringShadowTintColor set];
    } else {
        [[UIColor whiteColor] set];
    }
	[self.offString drawAtPoint:CGPointMake(offTextPoint.x + 1.0, offTextPoint.y) withFont:self.labelFont];
	if (self.offStringTintColor) {
        [self.offStringTintColor set];
    } else {
        [[UIColor colorWithWhite:0.52 alpha:1.0] set];
    }
	[self.offString drawAtPoint:offTextPoint withFont:self.labelFont];

	UIGraphicsPopContext();
}

@end
