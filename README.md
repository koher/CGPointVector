CGPointVector
==================

_CGPointVector_ provides the extension for arithmetic operations with _CGPoint_ in __Swift__, which are convenient when _CGPoint_ values are used as vectors.

```swift
let sum = a + b // (-2.0, 7.0)
let distance = (b - a).length // 5.0
let direction = (b - a).unit // (-0.8, 0.6)
let rotated = a * CGAffineTransform(rotationAngle: CGFloat.pi / 2) // (-2.0, 1.0)
```

Usage
------------------

```swift
import CGPointVector

let sum = a + b // (5.0, -9.0)
let length = a.length // 5.0
let distance = a.distance(from: b) // 1.4142135623731
let unitVector = a.unit // (0.6, -0.8)
let dotProduct = a * b // 26.0
```

Installation
------------------

### Swift Package Manager

```swift
.Package( url: "https://github.com/koher/CGPointVector.git", "0.1.0")
```

License
-------

[The MIT License](LICENSE)
