//
// RKObjectParameterization.h
// RestKit
//
// Created by Blake Watters on 5/2/11.
// Copyright (c) 2009-2012 RestKit. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "RKRequestDescriptor.h"

/**
   The `RKObjectParameterization` class provides an interface for mapping a local domain object into an `NSDictionary` representation suitable for use as the parameters of an HTTP request.
 */
@interface RKObjectParameterization : NSObject

///-------------------------------
/// @name Parameterizing an Object
///-------------------------------

/**
   Returns a dictionary representation of the given object by performing object mapping using the mapping
   from the given request descriptor. If the request descriptor specifies a root key path, the mapped parameters
   will be nested within the dictionary under the specified root key path.

   @param object The object to be parameterized.
   @param requestDescriptor The request descriptor describing how the object is to be mapped into an `NSDictionary` of parameters.
   @param error If there is a problem mapping the parameters, upon return contains a pointer to an instance of `NSError` that describes the problem.
   @return A new dictionary containing the mapped parameters or nil if an error has occurred.
 */
+ (NSDictionary *)parametersWithObject:(id)object requestDescriptor:(RKRequestDescriptor *)requestDescriptor error:(NSError **)error;

@end
