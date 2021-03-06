# RxPhotos

[![CI Status](http://img.shields.io/travis/istered/RxPhotos.svg?style=flat)](https://travis-ci.org/istered/RxPhotos)
[![Version](https://img.shields.io/cocoapods/v/RxPhotos.svg?style=flat)](https://cocoapods.org/pods/RxPhotos)
[![License](https://img.shields.io/cocoapods/l/RxPhotos.svg?style=flat)](https://cocoapods.org/pods/RxPhotos)
[![Platform](https://img.shields.io/cocoapods/p/RxPhotos.svg?style=flat)](https://cocoapods.org/pods/RxPhotos)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

This library is a tiny wrapper around some callback-based Photos' framework functions.

## Usage

Request image:
```swift
PHImageManager.default().rx.requestImage(
            for: asset,
            targetSize: CGSize(width: 120, height: 200),
            contentMode: PHImageContentMode.aspectFit,
            options: nil
            ).subscribe(onNext: { image in
                //
            }).disposed(by: disposeBag)
```

Watch PHPhotoLibrary changes:
```swift
PHPhotoLibrary.shared().rx.photoLibraryChange
            .subscribe(onNext: { change in
                //
            }).disposed(by: disposeBag)
```

Request authorization:
```swift
PHPhotoLibrary.rx.requestAuthorization()
            .subscribe(onSuccess: { status in
                //
            }).disposed(by: disposeBag)
```

Perform changes on photo library:
```swift
PHPhotoLibrary.shared().rx.performChanges({ /**/ })
            .subscribe(onSuccess: { result in
                //
            }).disposed(by: disposeBag)
```

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate RxPhotos into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
use_frameworks!

pod 'RxPhotos'
```

Then, run the following command:

```bash
$ pod install
```


### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate RxPhotos into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "istered/RxPhotos"
```

Run `carthage update` to build the framework and drag the built `RxPhotos`.framework into your Xcode project.


## Dependencies
* [RxSwift](https://github.com/ReactiveX/RxSwift) ~> 4.0

## Requirements
* iOS 10+
* Swift 4.0+ 

## Author

Anton Romanov


## License

RxPhotos is available under the MIT license. See the LICENSE file for more info.
