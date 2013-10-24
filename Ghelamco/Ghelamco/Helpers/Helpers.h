//
//  Helpers.h
//  Ghelamco
//
//  Created by Spencer Pieters on 24/10/13.
//  Copyright (c) 2013 Spencer Pieters. All rights reserved.
//

#ifndef Ghelamco_Helpers_h
#define Ghelamco_Helpers_h

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0f)
#define IS_RETINA ([[UIScreen mainScreen] scale] == 2.0f)

#endif
