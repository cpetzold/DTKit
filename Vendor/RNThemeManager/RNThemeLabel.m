//
//  RNThemeLabel.m
//  DT
//
//  Created by Ryan Nystrom on 2/5/13.
//
//

#import "RNThemeLabel.h"
#import "RNThemeManager.h"

@implementation RNThemeLabel

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self _init];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self _init];
    }
    return self;
}

- (id)init {
    if (self = [super init]) {
        [self _init];
    }
    return self;
}

- (void)_init {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeDidChangeNotification:) name:RNThemeManagerDidChangeThemes object:nil];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self applyTheme];
}

- (void)dealloc {
    @try {
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
    @catch (NSException *exception) {
        // do nothing, only unregistering self from notifications
    }
}

- (void)applyTheme {
    if (self.fontKey) {
        self.font = [[RNThemeManager sharedManager] fontForKey:self.fontKey];
    }
    
    if (self.textColorKey) {
        self.textColor = [[RNThemeManager sharedManager] colorForKey:self.textColorKey];
    }
    
    if (self.backgroundColorKey) {
        self.backgroundColor = [[RNThemeManager sharedManager] colorForKey:self.backgroundColorKey];
    }
}

- (void)themeDidChangeNotification:(NSNotification *)notification {
    [self applyTheme];
}

@end
