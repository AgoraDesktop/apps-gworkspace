/* FSNIconsView.h
 *  
 * Copyright (C) 2004 Free Software Foundation, Inc.
 *
 * Author: Enrico Sersale <enrico@imago.ro>
 * Date: March 2004
 *
 * This file is part of the GNUstep FSNode framework
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
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */

#ifndef FSN_ICONS_VIEW_H
#define FSN_ICONS_VIEW_H

#include <Foundation/Foundation.h>
#include <AppKit/NSView.h>
#include "FSNodeRep.h"

@class NSColor;
@class NSFont;
@class FSNode;
@class FSNIcon;
@class FSNIconNameEditor;

@interface FSNIconsView : NSView
{
  FSNode *node;
  NSString *infoPath;
  NSMutableDictionary *nodeInfo;
  NSMutableArray *icons;
  FSNInfoType infoType;
  NSString *extInfoType;
  
  NSImage *verticalImage;
  NSImage *horizontalImage;

  FSNSelectionMask selectionMask;
  NSArray *lastSelection;

  FSNIconNameEditor *nameEditor;
  FSNIcon *editIcon;

  int iconSize;
  int labelTextSize;
  NSFont *labelFont;
  int iconPosition;

  NSSize gridSize;
  int colcount;

	BOOL isDragTarget;
  
  NSString *charBuffer;	
	NSTimeInterval lastKeyPressed;
  
  NSColor *backColor;
  NSColor *textColor;
  NSColor *disabledTextColor;

  id <DesktopApplication> desktopApp;
}

- (void)sortIcons;

- (NSDictionary *)readNodeInfo;

- (void)updateNodeInfo;

- (void)calculateGridSize;

- (void)tile;

- (void)scrollIconToVisible:(FSNIcon *)icon;

- (NSString *)selectIconWithPrefix:(NSString *)prefix;

- (void)selectIconInPrevLine;

- (void)selectIconInNextLine;

- (void)selectPrevIcon;

- (void)selectNextIcon;

@end


@interface FSNIconsView (NodeRepContainer)

- (void)showContentsOfNode:(FSNode *)anode;
- (void)reloadContents;
- (FSNode *)shownNode;
- (BOOL)isSingleNode;
- (BOOL)isShowingNode:(FSNode *)anode;
- (BOOL)isShowingPath:(NSString *)path;
- (void)sortTypeChangedAtPath:(NSString *)path;
- (void)nodeContentsWillChange:(NSDictionary *)info;
- (void)nodeContentsDidChange:(NSDictionary *)info;
- (void)watchedPathChanged:(NSDictionary *)info;
- (void)setShowType:(FSNInfoType)type;
- (void)setExtendedShowType:(NSString *)type;
- (FSNInfoType)showType;
- (void)setIconSize:(int)size;
- (int)iconSize;
- (void)setLabelTextSize:(int)size;
- (int)labelTextSize;
- (void)setIconPosition:(int)pos;
- (int)iconPosition;
- (void)updateIcons;
- (id)repOfSubnode:(FSNode *)anode;
- (id)repOfSubnodePath:(NSString *)apath;
- (id)addRepForSubnode:(FSNode *)anode;
- (id)addRepForSubnodePath:(NSString *)apath;
- (void)removeRepOfSubnode:(FSNode *)anode;
- (void)removeRepOfSubnodePath:(NSString *)apath;
- (void)removeRep:(id)arep;
- (void)unloadFromPath:(NSString *)path;
- (void)repSelected:(id)arep;
- (void)unselectOtherReps:(id)arep;
- (void)selectReps:(NSArray *)reps;
- (void)selectRepsOfSubnodes:(NSArray *)nodes;
- (void)selectRepsOfPaths:(NSArray *)paths;
- (void)selectAll;
- (NSArray *)reps;
- (NSArray *)selectedReps;
- (NSArray *)selectedNodes;
- (NSArray *)selectedPaths;
- (void)selectionDidChange;
- (void)checkLockedReps;
- (void)setSelectionMask:(FSNSelectionMask)mask;
- (FSNSelectionMask)selectionMask;
- (void)openSelectionInNewViewer:(BOOL)newv;
- (void)restoreLastSelection;
- (void)setLastShownNode:(FSNode *)anode;
- (BOOL)involvedByFileOperation:(NSDictionary *)opinfo;
- (BOOL)validatePasteOfFilenames:(NSArray *)names
                       wasCutted:(BOOL)cutted;
- (void)setBackgroundColor:(NSColor *)acolor;
- (NSColor *)backgroundColor;
- (void)setTextColor:(NSColor *)acolor;
- (NSColor *)textColor;
- (NSColor *)disabledTextColor;

@end


@interface FSNIconsView (DraggingDestination)

- (unsigned int)draggingEntered:(id <NSDraggingInfo>)sender;

- (unsigned int)draggingUpdated:(id <NSDraggingInfo>)sender;

- (void)draggingExited:(id <NSDraggingInfo>)sender;

- (BOOL)prepareForDragOperation:(id <NSDraggingInfo>)sender;

- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender;

- (void)concludeDragOperation:(id <NSDraggingInfo>)sender;

@end


@interface FSNIconsView (IconNameEditing)

- (void)updateNameEditor;

- (void)controlTextDidChange:(NSNotification *)aNotification;

- (void)controlTextDidEndEditing:(NSNotification *)aNotification;

- (BOOL)fileManager:(NSFileManager *)manager 
              shouldProceedAfterError:(NSDictionary *)errorDict;

- (void)fileManager:(NSFileManager *)manager willProcessPath:(NSString *)path;

@end

#endif // FSN_ICONS_VIEW_H
