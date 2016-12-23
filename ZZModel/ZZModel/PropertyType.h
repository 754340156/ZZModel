//
//  PropertyType.h
//  ZZModel
//
//  Created by zhaozhe on 16/12/22.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Foundation.h"
//包装类
@interface PropertyType : NSObject
/**  类型标识符 */
@property(nonatomic,strong) NSString * code;

/**  id */
@property (nonatomic, readonly, getter=isIdType) BOOL idType;

/**  基本数字类型 */
@property(nonatomic, readonly, getter=isNumberType) BOOL numberType;

/**  是不是Foundation下的类 */
@property(nonatomic, readonly, getter=isFromFoundation) BOOL  fromFoundation;

/**  bool */
@property (nonatomic, readonly, getter=isBoolType) BOOL boolType;

/**  对象 */
@property (nonatomic, readonly) Class typeClass;

/**  初始化 */
+ (instancetype)propertyTypeWithAttributeString:(NSString *)string;
@end
