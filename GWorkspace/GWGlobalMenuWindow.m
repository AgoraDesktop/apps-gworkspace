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

	return self;
}

- (BOOL) canBecomeKeyWindow {
	return NO;
}

- (BOOL) canBecomeMainWindow {
	return NO;
}

@end

