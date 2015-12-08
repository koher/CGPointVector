CGPointVector
==================

_CGPointVector_ provides the extension for arithmetic operations with _CGPoint_ in both __Swift__ and __Objective-C__, which are convenient when _CGPoint_ values are used as vectors.

```swift
// in Swift
let a = CGPoint(x: 1, y: 2), b = CGPoint(x: -3, y: 5)

let sum = a + b // ( -2.0, 7.0 )
let distance = (b - a).length // 5.0
let direction = (b - a).unit // ( -0.8, 0.6 )
let rotated = a * CGAffineTransformMakeRotation(CGFloat.pi / 2) // ( -2.0, 1.0 )
```

For Objective-C, the functions in _CGPointVector_ are optimized for both 32-bit and 64-bit _CGFloat_. They switch math functions used in their implementations at the compile time depending on the CPU architecture.

Usage
------------------

### Swift

```swift
import CGPointVector

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
#import <CGPointVector/CGPointVector.h>
```

```objc
CGPoint a = CGPointMake(1.0, -1.0);
CGPoint b = CGPointMake(3.0, -1.0);

CGPoint sum = CGPointAdd(a, b); // (4.0, -2.0)
CGFloat length = CGPointGetLength(a); // 1.414214
CGFloat distance = CGPointGetDistance(a, b); // 2.0
CGPoint unitVector = CGPointNormalize(a); // (0.707107, -0.707107)
CGFloat dotProduct = CGPointGetDotProduct(a, b); // 4.0
```

Installation
------------------

### Carthage

[_Carthage_](https://github.com/Carthage/Carthage) is available to install _CGPointVector_. Add it to your _Cartfile_:

```
github "koher/CGPointVector"
```

### Manually

#### Embedded Framework

1. Put [CGPointVector.xcodeproj](CGPointVector.xcodeproj) into your project in Xcode.
2. Click the project icon and select the "General" tab.
3. Add CGPointVector.framework to "Embedded Binaries".

License
-------

[The MIT License](LICENSE)
