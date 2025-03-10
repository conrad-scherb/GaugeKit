# GaugeKit

GaugeKit is a free-to-use, lightweight Swift package which enables easy, effortless creation of a gauge-like view ideal for visualizing a value in a gauge,
not too different from the native gauges used by Apple for some Apple Watch complications.

## Importing GaugeKit

To use GaugeKit in your project, simply add a Swift Package to your project using the URL to this repository, or add it to your Package.swift manifest manually.

```swift

let package = Package(
	...
	dependencies: [
		.package(url: "https://github.com/antonmartinsson/gaugekit.git", from: "0.1.0")
	],
	...
)
```

## Requirements

GaugeKit is built with SwiftUI, and thus the minimum requirement to use it is that your project (or the views you're creating with it) has a deployment target set to iOS 13 / macOS 11 / watchOS 6 or later. 

To use it in a UIKit project, use a [UIHostingController](https://developer.apple.com/documentation/swiftui/uihostingcontroller).\
To use it in an AppKit project, use a [NSHostingController](https://developer.apple.com/documentation/swiftui/nshostingcontroller) or [NSHostingView](https://developer.apple.com/documentation/swiftui/nshostingview).

## Usage 

To create a basic Gauge is as simple as providing it with a title, an integer value, and the colors that you want the gauge display along itself.  For example:

```swift
GaugeView(title: "Speed", value: 88, colors: [.red, .orange, .yellow, .green])
```

![alt text](https://i.imgur.com/iXPEpmm.png)

A basic gauge like this will default to 100 for its max value, and to 0 for its min value. You can also explicitely set the max and/or min values of the gauge to a custom value. The following initialization will create a gauge that maxes out at 1000 instead of 100.  

```swift
GaugeView(title: "Speed", value: 100, maxValue: 1000, colors: [.red, .orange, .yellow, .green])
```

Additionally, as space for additional information is quite limited within the gauge, you can initialize a gauge with some additional information using three different (optional) strings. This information will be revealed to the user with a quick flip animation when a tap on the gauge view is recorded.   

```swift
let strap = "This is a semi-clever reference."
let title = "#BTTF"
let body = "This is how fast you need to go to trigger the flux capacitor."
let additionalInfo = GaugeAdditionalInfo(strap: strap, title: title, body: body)

GaugeView(title: "Speed", value: 88, colors: [.red, .orange, .yellow, .green], additionalInfo: additionalInfo)
```

If you leave any of the strings as nil, the Text instance responsible for displaying that string will not be rendered. So if you just want to create a gauge with a short description and no secondary title or body, this is also a valid init:

```swift
let strap = "This is a semi-clever reference."
let additionalInfo = GaugeAdditionalInfo(strap: strap, title: nil, body: nil)

GaugeView(title: "Speed", value: 88, colors: [.red, .orange, .yellow, .green], additionalInfo: additionalInfo)
```

Finally, if you're feeling like you don't need any built in text elements, you could create a gauge without a title or value (or any additional info), like this:  

```swift
GaugeView(colors: [.red, .orange, .yellow, .green])
```

Should you have the need to control the colors of the indicator or the text within the gauge, there are four view modifiers you can use to do so.

```swift
// To control the color of the numbers in the center of the gauge.
.gaugeValueColor(.blue)

// To control the color of the title below the numbers in the center of the gauge.
.gaugeTitleColor(.yellow)

// To control the color of the indicator.
.gaugeIndicatorColor(.blue)

// To control the color of the text visible when the gauge is flipped around.
.gaugeBackTint(.yellow)
```

## Roadmap

While I don't have many concrete plans for GaugeKit at the moment, I do plan to fiddle around with it and improve it best I can from time to time. If you have any feature requests or ideas you think I should take into consideration, please feel free to contact me here on GitHub.

## Using GaugeKit in your project?

Are you using GuageKit in one of your projects? Please message me and tell me about it on [Twitter](https://www.twitter.com/ntonmartinsson) or by emailing me using the form over at [antonmartinsson.com](https://www.antonmartinsson.com). I'd love to see what you create with it!
