//
//  SHBCard.h
//  DeckOfOneCard_Obj-C
//
//  Created by Shean Bjoralt on 9/29/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHBCard : NSObject

@property (nonatomic, copy, readonly) NSString *suit;
@property (nonatomic, copy, readonly) NSString *image;

- (instancetype)initWithSuit:(NSString *)suit
                      image:(NSString *)image;


@end

@interface SHBCard (JSONConvertable)
- (SHBCard *)initWithDictionary:(NSDictionary <NSString *, id>* )topLevelDictionary;

@end

NS_ASSUME_NONNULL_END
