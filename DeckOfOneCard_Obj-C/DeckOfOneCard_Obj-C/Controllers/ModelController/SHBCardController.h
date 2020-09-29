//
//  SHBCardController.h
//  DeckOfOneCard_Obj-C
//
//  Created by Shean Bjoralt on 9/29/20.
//

#import "SHBCard.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHBCardController : NSObject

+ (void)drawNewCard:(NSInteger)numberOfCards completion: (void (^) (NSArray<SHBCard *> *cards, NSError *error))completion;

+ (void)fetchCardImage:(SHBCard *)card completion: (void (^) (UIImage *))completion;

@end

NS_ASSUME_NONNULL_END
