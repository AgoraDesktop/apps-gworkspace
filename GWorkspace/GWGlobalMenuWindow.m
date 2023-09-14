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

@implementation GWGlobalMenuWindow

- (instancetype) initWithContentRect:(NSRect)contentRect 
                           styleMask:(NSWindowStyleMask)style 
		             backing:(NSBackingStoreType)backingStoreType 
		               defer:(BOOL)flag {

	if (self = [super initWithContentRect: contentRect 
			            styleMask: NSWindowStyleMaskBorderless | NSWindowStyleMaskNonactivatingPanel
				      backing:(NSBackingStoreType)backingStoreType 
				        defer:(BOOL)flag]) {

		self.level = NSMainMenuWindowLevel - 1;
		self.canHide = NO;
		self.hidesOnDeactivate = NO;
		self.excludedFromWindowsMenu = YES;
		self.movableByWindowBackground = NO;
		self.releasedWhenClosed = NO;

		// Generate the system menu

		NSMenuView *systemMenuView = [NSMenuView new];
		systemMenuView.frame = NSMakeRect(0,0,25,25);
		systemMenuView.horizontal = YES;

		NSMenu *systemMenuToplevel = [NSMenu new];
		id<NSMenuItem> systemMenuItem = [systemMenuToplevel addItemWithTitle: @""
								              action: NULL
							               keyEquivalent: @""];
		systemMenuItem.image = [NSImage imageNamed: @"common_SystemMenu"];

		NSMenu* systemMenu = [NSMenu new];
		systemMenuItem.submenu = systemMenu;

		[systemMenu addItemWithTitle: @"About Agora..."
				      action: NULL
			       keyEquivalent: @""];
	
		[systemMenu addItem: NSMenuItem.separatorItem];

		[systemMenu addItemWithTitle: @"System Preferences"
				      action: NULL
			       keyEquivalent: @""];

		[systemMenu addItemWithTitle: @"Dock"
				      action: NULL
			       keyEquivalent: @""];

		[systemMenu addItem: NSMenuItem.separatorItem];

		[systemMenu addItemWithTitle: @"Force Quit..."
				      action: NULL
			       keyEquivalent: @""];

		[systemMenu addItem: NSMenuItem.separatorItem];

		[systemMenu addItemWithTitle: @"Restart..."
				      action: NULL
			       keyEquivalent: @""];

		[systemMenu addItemWithTitle: @"Shut Down..."
				      action: NULL
			       keyEquivalent: @""];

		[systemMenu addItem: NSMenuItem.separatorItem];

		[systemMenu addItemWithTitle: @"Log Out..."
				      action: @selector(terminate:)
			       keyEquivalent: @""];

		[systemMenu update];
		[systemMenuToplevel update];
		systemMenuView.menu = systemMenuToplevel;
		[self.contentView addSubview: systemMenuView];


		// Generate the clock -- a dummy for now.

		NSTextField *clock = [NSTextField new];
		clock.stringValue = @"Sun 1 Jan 1988    08:43";
		clock.editable = NO;
		clock.selectable = NO;
		clock.drawsBackground = NO;
		clock.bezeled = NO;
		clock.bordered = NO;
		clock.font = [NSFont boldSystemFontOfSize: 0.0];
		clock.frame = NSMakeRect(contentRect.size.width - 110,0,100,18);

		[self.contentView addSubview: clock];

	}

	return self;
}

- (BOOL) canBecomeKeyWindow {
	return NO;
}

- (BOOL) canBecomeMainWindow {
	return NO;
}

@end

