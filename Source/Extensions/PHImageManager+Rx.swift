//
//  PHImageManager+Rx.swift
//  RxPhotos
//
//  Created by Anton Romanov on 01/04/2018.
//  Copyright © 2018 Istered. All rights reserved.
//

import Foundation
import Photos
import RxSwift

public extension Reactive where Base: PHImageManager {
    public func requestImage(for asset: PHAsset,
                             targetSize: CGSize,
                             contentMode: PHImageContentMode,
                             options: PHImageRequestOptions?) -> Observable<ImageRequestResult> {
        return Observable.create { [weak base] observable in

            let requestId = base?.requestImage(
                for: asset,
                targetSize: targetSize,
                contentMode: contentMode,
                options: options,
                resultHandler: { image, info in
                    if let info = info, let error = RxPhotoError(info: info) {
                        observable.onError(error)
                    } else {
                        observable.onNext(ImageRequestResult(image: image, info: info))

                        if options?.isSynchronous == true || info?[PHImageResultIsDegradedKey] == nil {
                            observable.onCompleted()
                        }
                    }
            })

            return Disposables.create {
                requestId.map { base?.cancelImageRequest($0) }
            }
        }
    }

    public func requestAVAsset(forVideo asset: PHAsset,
                               options: PHVideoRequestOptions?) -> Single<AssetRequestResult> {
        return Single.create { [weak base] single in

            let requestId = base?.requestAVAsset(
                forVideo: asset,
                options: options,
                resultHandler: { asset, mix, info in
                    if let info = info, let error = RxPhotoError(info: info) {
                        single(.error(error))
                    } else {
                        single(.success(AssetRequestResult(asset: asset, audioMix: mix, info: info)))
                    }
            })

            return Disposables.create {
                requestId.map { base?.cancelImageRequest($0) }
            }
        }
    }

    public func requestImageData(for asset: PHAsset,
                                 options: PHImageRequestOptions?) -> Single<ImageDataRequestResult> {
        return Single.create { [weak base] single in

            let requestId = base?.requestImageData(
                for: asset,
                options: options,
                resultHandler: { data, UTI, orientation, info in
                    if let info = info, let error = RxPhotoError(info: info) {
                        single(.error(error))
                    } else {
                        let result = ImageDataRequestResult(data: data, UTI: UTI, orientation: orientation, info: info)
                        single(.success(result))
                    }
            })

            return Disposables.create {
                requestId.map { base?.cancelImageRequest($0) }
            }
        }
    }

    public func requestPlayerItem(forVideo asset: PHAsset,
                                  options: PHVideoRequestOptions?) -> Single<PlayerItemRequestResult> {
        return Single.create { [weak base] single in

            let requestId = base?.requestPlayerItem(
                forVideo: asset,
                options: options,
                resultHandler: { playerItem, info in
                    if let info = info, let error = RxPhotoError(info: info) {
                        single(.error(error))
                    } else {
                        single(.success(PlayerItemRequestResult(playerItem: playerItem, info: info)))
                    }
            })

            return Disposables.create {
                requestId.map { base?.cancelImageRequest($0) }
            }
        }
    }

    public func requestExportSession(forVideo asset: PHAsset,
                                     options: PHVideoRequestOptions?,
                                     exportPreset: String) -> Single<AssetExportSessionRequestResult> {
        return Single.create { [weak base] single in

            let requestId = base?.requestExportSession(
                forVideo: asset,
                options: options,
                exportPreset: exportPreset,
                resultHandler: { session, info in
                    if let info = info, let error = RxPhotoError(info: info) {
                        single(.error(error))
                    } else {
                        single(.success(AssetExportSessionRequestResult(session: session, info: info)))
                    }
            })

            return Disposables.create {
                requestId.map { base?.cancelImageRequest($0) }
            }
        }
    }

    public func requestLivePhoto(for asset: PHAsset,
                                 targetSize: CGSize,
                                 contentMode: PHImageContentMode,
                                 options: PHLivePhotoRequestOptions?) -> Observable<LivePhotoRequestResult> {
        return Observable.create { [weak base] observable in

            let requestId = base?.requestLivePhoto(
                for: asset,
                targetSize: targetSize,
                contentMode: contentMode,
                options: options,
                resultHandler: { livePhoto, info in
                    if let info = info, let error = RxPhotoError(info: info) {
                        observable.onError(error)
                    } else {
                        observable.onNext(LivePhotoRequestResult(livePhoto: livePhoto, info: info))

                        if info?[PHImageResultIsDegradedKey] == nil {
                            observable.onCompleted()
                        }
                    }
            })

            return Disposables.create {
                requestId.map { base?.cancelImageRequest($0) }
            }
        }
    }
}
