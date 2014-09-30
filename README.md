CGPoint+Vector
==================

__CGPoint+Vector__ provides the extension for arithmetic operations with _CGPoint_ in both __Swift__ and __Objective-C__, which are convenient when _CGPoint_ values are used as vectors.

```swift
let a = CGPoint(x: 1, y: 2), b = CGPoint(x: -3, y: 5)

let sum = a + b // (-2.0,7.0)
let distance = (a - b).length // 5.0
let unitVector = (a - b).unit // (0.8,-0.6)
```

For Objective-C, the functions in CGPoint+Vector are optimized for both 32-bit and 64-bit _CGFloat_. They switch math functions used in their implementations at the compile time depending on the CPU architecture.

How to Install
--------------

Put the following files into your project.

### Swift

- CGPoint+Vector/CGPoint+Vector/CGPoint+Vector.swift

### Objective-C

- CGPoint+Vector/CGPoint+Vector/CGPoint+Vector.h
- CGPoint+Vector/CGPoint+Vector/CGPoint+Vector.m

Usage
-----

### Swift

```swift
let a = CGPoint(x: 3.0, y: -4.0)
let b = CGPoint(x: 2.0, y: -5.0)

let sum = a + b // (5.0,-9.0)
let length = a.length // 5.0
let distance = a.distanceFrom(b) // 1.4142135623731
let unitVector = a.unit // (0.6,-0.8)
let dotProduct = a * b // 26.0
```

### Objective-C

```objc

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
