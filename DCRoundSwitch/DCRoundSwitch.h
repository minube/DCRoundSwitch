//
//  DCRoundSwitch.h
//
//  Created by Patrick Richards on 28/06/11.
//  MIT License.
//
//  http://twitter.com/patr
//  http://domesticcat.com.au/projects
//  http://github.com/domesticcatsoftware/DCRoundSwitch
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class DCRoundSwitchToggleLayer;
@class DCRoundSwitchOutlineLayer;
@class DCRoundSwitchKnobLayer;

@interface DCRoundSwitch : UIControl

@property (nonatomic, retain) UIColor *onTintColor;					// default: blue (matches normal UISwitch)
@property (nonatomic, retain) UIColor *offTintColor;				// default: white (matches normal UISwitch)
@property (nonatomic, getter=isOn) BOOL on;							// default: NO
@property (nonatomic, copy) NSString *onText;						// default: 'ON' - automatically localized
@property (nonatomic, copy) NSString *offText;						// default: 'OFF' - automatically localized
@property (nonatomic, retain) UIColor *onStringTintColor;			// default: white (matches normal UISwitch)
@property (nonatomic, retain) UIColor *onStringShadowTintColor;		// default: dark grey (matches normal UISwitch)
@property (nonatomic, retain) UIColor *offStringTintColor;			// default: grey (matches normal UISwitch)
@property (nonatomic, retain) UIColor *offStringShadowTintColor;	// default: white (matches normal UISwitch)
@property (nonatomic, assign) BOOL showGlossOutline;				// default: YES
@property (nonatomic, assign) BOOL flatKnob;						// default: NO
@property (nonatomic, retain) UIFont *toggleFont;

+ (Class)knobLayerClass;
+ (Class)outlineLayerClass;
+ (Class)toggleLayerClass;

- (void)setOn:(BOOL)newOn animated:(BOOL)animated;
- (void)setOn:(BOOL)newOn animated:(BOOL)animated ignoreControlEvents:(BOOL)ignoreControlEvents;

@end
