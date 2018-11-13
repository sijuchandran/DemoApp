//
//  TEWHelpersConstants.h
//  TEWHelpers
//
//  Created by Adam Richardson on 28/02/2018.
//  Copyright © 2018 The EarthWorks Digital LTD. All rights reserved.
//

#ifndef TEWHelpersConstants_h
#define TEWHelpersConstants_h

typedef enum
{
    kResponseOk = 0,
    kResponseUnauthorised,
    kResponseLockout,
    kResponseError
} kResponseType;

typedef enum
{
    kLeftJustified = 0,
    kCentered,
    kRightJustified
} kTextJustification;

#endif /* TEWHelpersConstants_h */
