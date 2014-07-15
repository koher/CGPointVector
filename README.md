CGPoint+Vector
==================

__CGPoint+Vector__ provides arithmetic functions for _CGPoint_, which are convenient when _CGPoint_ values are used as vectors.

Followings are the examples of the functions.

- _CGPointAdd_
- _CGPointSubtract_
- _CGPointMultiply_
- _CGPointNormalize_
- _CGPointGetLength_
- _CGPointGetDistance_
- _CGPointGetDotProduct_
- _CGPointGetAngleBetween_

The functions in CGPoint+Vector are optimized for both 32-bit and 64-bit _CGFloat_. They switch math functions used in their implementations at the compile time depending on the CPU architecture.

How to Install
--------------

Put the following files into your project.

- CGPoint+Vector/CGPoint+Vector/CGPoint+Vector.h
- CGPoint+Vector/CGPoint+Vector/CGPoint+Vector.m

Usage
-----

```objectivec

#import "CGPoint+Vector.h"

...

- (void)demo {
	CGPoint a = CGPointMake(1.0, -1.0);
	CGPoint b = CGPointMake(3.0, -1.0);
	
	CGPoint sum = CGPointAdd(a, b); // (4.0, -2.0)
	CGFloat length = CGPointGetLength(a); // 1.414214
	CGFloat distance = CGPointGetDistance(a, b); // 2.0
	CGPoint unitVector = CGPointNormalize(a); // (0.707107, -0.707107)
	CGFloat dotProduct = CGPointGetDotProduct(a, b); // 4.0
}

...

```

License
-------

MIT License. Read [the LICENSE file](LICENSE).
