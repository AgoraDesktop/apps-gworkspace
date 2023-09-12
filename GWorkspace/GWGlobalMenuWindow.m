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
	}

	NSMenuView *systemMenuView = [NSMenuView new];
	systemMenuView.frame = NSMakeRect(-2, -1, 22, 22);
	systemMenuView.horizontal = YES;
	[self.contentView addSubview: systemMenuView];

	NSMenu *systemMenu = [NSMenu new];
	systemMenuView.menu = systemMenu;

	id<NSMenuItem> systemMenuItem = [systemMenu addItemWithTitle: @""
							       action: NULL
							keyEquivalent: @""];
	systemMenuItem.image = [NSImage imageNamed: @"common_SystemMenu"];



	NSMenu *systemSubmenu = [NSMenu new];
	[systemMenu setSubmenu: systemSubmenu
		       forItem: systemMenuItem];
	
	[systemSubmenu addItemWithTitle: @"About Agora"
				 action: NULL
		   	  keyEquivalent: @""];

	[systemSubmenu addItem: [NSMenuItem separatorItem]];


	[systemSubmenu addItemWithTitle: @"System Preferences"
				 action: @selector(openSystemPreferences:)
		   	  keyEquivalent: @""];
/*
	id<NSMenuItem> dockMenuItem = [systemSubmenu addItemWithTitle: @"Dock"
				 				action: NULL
	   	  	  				 keyEquivalent: @""];

	dockMenuItem.submenu = [NSMenu new];

	[dockMenuItem.submenu addItemWithTitle: @"Hide"
	   			        action: NULL
				 keyEquivalent: @""];


	[dockMenuItem.submenu addItem: [NSMenuItem separatorItem]];

	[dockMenuItem.submenu addItemWithTitle: @"Pin to Left Side"
					action: NULL
				 keyEquivalent: @""];
	
	[dockMenuItem.submenu addItemWithTitle: @"Pin to Right Side"
					action: NULL
				 keyEquivalent: @""];

	[dockMenuItem.submenu update];
*/
	[systemSubmenu addItem: [NSMenuItem separatorItem]];

	[systemSubmenu addItemWithTitle: @"Force quit..."
				 action: NULL
		   	  keyEquivalent: @""];

	[systemSubmenu addItem: [NSMenuItem separatorItem]];
	
	[systemSubmenu addItemWithTitle: @"Restart..."
				 action: NULL
			  keyEquivalent: @""];

	[systemSubmenu addItemWithTitle: @"Shut down..."
				 action: NULL
			  keyEquivalent: @""];

	[systemSubmenu addItem: [NSMenuItem separatorItem]];

	[[systemSubmenu addItemWithTitle: @"Log out..."
			  	  action: @selector(terminate:)
	                   keyEquivalent: @""] setTarget: NSApp];

	

	return self;
}

- (BOOL) canBecomeKeyWindow {
	return NO;
}

- (BOOL) canBecomeMainWindow {
	return NO;
}

@end

