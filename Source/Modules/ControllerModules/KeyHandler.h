// Copyright (c) 2011 and onwards The OpenVanilla Project (MIT License).
// All possible vChewing-specific modifications are of:
// (c) 2021 and onwards The vChewing Project (MIT-NTL License).
/*
Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

1. The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

2. No trademark license is granted to use the trade names, trademarks, service
marks, or product names of Contributor, except as required to fulfill notice
requirements above.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

#import <Foundation/Foundation.h>

@class keyParser;
@class InputState;

NS_ASSUME_NONNULL_BEGIN

typedef NSString *const InputMode NS_TYPED_ENUM;
extern InputMode imeModeCHT;
extern InputMode imeModeCHS;
extern InputMode imeModeNULL;

@class KeyHandler;

@protocol KeyHandlerDelegate <NSObject>
- (id)ctlCandidateForKeyHandler:(KeyHandler *)keyHandler;
- (void)keyHandler:(KeyHandler *)keyHandler didSelectCandidateAtIndex:(NSInteger)index ctlCandidate:(id)controller;
- (BOOL)keyHandler:(KeyHandler *)keyHandler didRequestWriteUserPhraseWithState:(InputState *)state;
@end

@interface KeyHandler : NSObject

- (BOOL)isBuilderEmpty;
- (BOOL)handleInput:(keyParser *)input
              state:(InputState *)state
      stateCallback:(void (^)(InputState *))stateCallback
      errorCallback:(void (^)(void))errorCallback
    NS_SWIFT_NAME(handle(input:state:stateCallback:errorCallback:));

- (void)fixNodeWithValue:(NSString *)value NS_SWIFT_NAME(fixNode(value:));
- (void)clear;

- (InputState *)buildInputtingState;
- (nullable InputState *)buildAssociatePhraseStateWithKey:(NSString *)key useVerticalMode:(BOOL)useVerticalMode;

@property(strong, nonatomic) InputMode inputMode;
@property(weak, nonatomic) id<KeyHandlerDelegate> delegate;

// The following items need to be exposed to Swift:
- (NSString *)_popOverflowComposingTextAndWalk;

- (BOOL)_handleCandidateState:(InputState *)state
                        input:(keyParser *)input
                stateCallback:(void (^)(InputState *))stateCallback
                errorCallback:(void (^)(void))errorCallback
    NS_SWIFT_NAME(handleCandidate(state:input:stateCallback:errorCallback:));

- (BOOL)checkWhetherToneMarkerConfirmsPhoneticReadingBuffer;
- (BOOL)chkKeyValidity:(UniChar)value;
- (BOOL)isPhoneticReadingBufferEmpty;
- (NSString *)getCompositionFromPhoneticReadingBuffer;
- (NSString *)getSyllableCompositionFromPhoneticReadingBuffer;
- (void)clearPhoneticReadingBuffer;
- (void)combinePhoneticReadingBufferKey:(UniChar)charCode;
- (void)doBackSpaceToPhoneticReadingBuffer;
- (void)removeBuilderAndReset:(BOOL)shouldReset;
- (void)createNewBuilder;
- (void)setInputModesToLM:(BOOL)isCHS;
- (void)syncBaseLMPrefs;
- (void)ensurePhoneticParser;
- (BOOL)ifLangModelHasUnigramsForKey:(NSString *)reading;
- (void)insertReadingToBuilderAtCursor:(NSString *)reading;
- (BOOL)isPrintable:(UniChar)charCode;
- (void)dealWithOverrideModelSuggestions;
- (NSMutableArray *)getCandidatesArray;
- (NSInteger)getBuilderCursorIndex;
- (NSInteger)getBuilderLength;

@end

NS_ASSUME_NONNULL_END
