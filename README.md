<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Flutter package allows creating Google Maps markers with text labels

## Motivation

In many applications we need to show some text on the map markers. This text could be computed at runtime, thus, we can't pre-embed it a marker asset. For instance, an accommodation booking app that shows the number of available hotels in an area. If you're using flutter_google_maps, this can't be achieved out-of-the-box, so this package can help.

It's best to be used with short text, like a symbol, number, or one word

<img width="300px" src="https://github.com/SharbelOkzan/label_google_maps_marker/blob/main/media/google_maps_labeled_marker_screenshot.jpg"/>> 

## Getting started

Add it in *pubspec.yaml*
```
dependencies:
  label_google_maps_marker: ^0.0.1
```
## Usage

`LabelMarker` extends `Marker` and exposes all it params.
Additionally, it has `label` param where you can pass the text you want to show on the label.
Other params `layout`, `backgroundColor` and `textStyle` are for styling.

```dart
LabelMarker(
    position: _randomLocations[i],
    label: "SomeText",
    backgroundColor: Colors.purple,
    layout: MarkerLayout.pinPoint(),
    markerId: MarkerId("$i"))
```

See ./example for a ready-to-paste example 

## Additional information

Supporting SVG markers is planned, PRs are welcome. 
