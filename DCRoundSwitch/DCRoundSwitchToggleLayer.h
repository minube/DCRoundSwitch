//
//  DCRoundSwitchToggleLayer.h
//
//  Created by Patrick Richards on 29/06/11.
//  MIT License.
//
//  http://twitter.com/patr
//  http://domesticcat.com.au/projects
//  http://github.com/domesticcatsoftware/DCRoundSwitch
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface DCRoundSwitchToggleLayer : CALayer

@property (nonatomic, retain) UIColor *onTintColor;
@property (nonatomic, retain) UIColor *offTintColor;
@property (nonatomic, retain) NSString *onString;
@property (nonatomic, retain) NSString *offString;
@property (nonatomic, retain) UIColor *onStringTintColor;
@property (nonatomic, retain) UIColor *onStringShadowTintColor;
@property (nonatomic, retain) UIColor *offStringTintColor;
@property (nonatomic, retain) UIColor *offStringShadowTintColor;
@property (nonatomic, retain) UIFont *labelFont;
@property (nonatomic) BOOL drawOnTint;
@property (nonatomic) BOOL clip;
@property (nonatomic) BOOL flatKnob;

- (id)initWithOnString:(NSString *)anOnString offString:(NSString *)anOffString onTintColor:(UIColor *)anOnTintColor;
- (id)initWithOnString:(NSString *)anOnString offString:(NSString *)anOffString onTintColor:(UIColor *)anOnTintColor offTintColor:(UIColor *)anOffColor;

@end
