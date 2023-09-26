/* GWGlobalMenuWindow.m
 *  
 * Copyright (C) 2023 Kyle J Cardoza
 *
 * Author: Kyle J Cardoza <Kyle.Cardoza@icloud.com>
 * Date: September 2023
 *
 * This file is part of the Agora fork of the GWorkspace application
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02111 USA.
 */

#import "GWGlobalMenuWindow.h"

#import <AppKit/AppKit.h>

@implementation GWGlobalMenuPanel

- (instancetype) initWithContentRect: (NSRect) contentRect 
                           styleMask: (NSWindowStyleMask) style 
                             backing: (NSBackingStoreType) backingStoreType 
                               defer: (BOOL)flag {

	if (self = [super initWithContentRect: contentRect
				    styleMask: style
				      backing: backingStoreType
				        defer: flag]) {

		// Set our window properties
		self.level = NSMainMenuWindowLevel - 1;
		self.canHide = NO;
		self.hidesOnDeactivate = NO;
		self.excludedFromWindowsMenu = YES;
		self.movableByWindowBackground = NO;
		self.releasedWhenClosed = NO;
		self.backgroundColor = NSColor.clearColor;
		self.worksWhenModal = YES;
		self.becomesKeyOnlyIfNeeded = YES;

		// Create a MenuView to hold our global menu.
		NSMenuView *menuView = [[NSMenuView alloc] initWithFrame: NSMakeRect(-3,-1,25,25)];
		menuView.horizontal = true;

		// Create our global menu.
		GWGlobalMenu *globalMenu = [GWGlobalMenu new];

		// Attach the menu to the menu view
		menuView.menu = globalMenu;

		// Add the menu view as our subview
		[self.contentView addSubview: menuView];
	}

	return self;
}

- (void) _setmenu: (NSMenu *) menu {
	_the_menu = menu;
}

- (NSMenu *) _menu {
	return _the_menu;
}


- (BOOL) canBecomeKeyWindow {
	return NO;
}

- (BOOL) canBecomeMainWindow {
	return NO;
}

@end


@implementation GWGlobalMenu

- (instancetype) init {

	if (self = [super init]) {
	
		// Generate the system menu

		id<NSMenuItem> systemMenuItem = [self addItemWithTitle: @""
								action: NULL
						         keyEquivalent: @""];
		systemMenuItem.image = [NSImage imageNamed: @"common_SystemMenu"];

		NSMenu* systemMenu = [NSMenu new];
		systemMenuItem.submenu = systemMenu;

		[systemMenu addItemWithTitle: @"About Agora..."
				      action: @selector(showAboutAgoraWindow:)
			       keyEquivalent: @""];
	
		[systemMenu addItem: NSMenuItem.separatorItem];

		[systemMenu addItemWithTitle: @"System Preferences"
				      action: @selector(openSystemPreferences:)
			       keyEquivalent: @""];

		[systemMenu addItemWithTitle: @"Dock"
				      action: NULL
			       keyEquivalent: @""];

		[systemMenu addItem: NSMenuItem.separatorItem];

		[systemMenu addItemWithTitle: @"Force Quit..."
				      action: @selector(forceQuit:)
			       keyEquivalent: @""];

		[systemMenu addItem: NSMenuItem.separatorItem];

		[systemMenu addItemWithTitle: @"Restart..."
				      action: @selector(restartComputer:)
			       keyEquivalent: @""];

		[systemMenu addItemWithTitle: @"Shut Down..."
				      action: @selector(shutDownComputer:)
			       keyEquivalent: @""];

		[systemMenu addItem: NSMenuItem.separatorItem];

		[systemMenu addItemWithTitle: @"Log Out..."
				      action: @selector(terminate:)
			       keyEquivalent: @""];

		[systemMenu update];
	}

	return self;
}

@end

