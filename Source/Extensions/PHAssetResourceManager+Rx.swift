//
//  PHAssetResourceManager+Rx.swift
//  RxPhotos
//
//  Created by Anton Romanov on 01/04/2018.
//  Copyright © 2018 Istered. All rights reserved.
//

import Foundation
import Photos
import RxSwift

extension Reactive where Base: PHAssetResourceManager {
    public func requestData(for resource: PHAssetResource, options: PHAssetResourceRequestOptions?)
        -> Observable<Data> {
        return Observable.create { [weak base] observable in

            let requestId = base?.requestData(
                for: resource,
                options: options,
                dataReceivedHandler: { data in
                    observable.onNext(data)
                },
                completionHandler: { error in
                    if let error = error {
                        observable.onError(error)
                    } else {
                        observable.onCompleted()
                    }
                })

            return Disposables.create {
                requestId.map { base?.cancelDataRequest($0) }
            }
        }
    }

    public func writeData(for resource: PHAssetResource,
                          toFile fileURL: URL,
                          options: PHAssetResourceRequestOptions?) -> Completable {
        return Completable.create { [weak base] completable in
            base?.writeData(for: resource, toFile: fileURL, options: options) { error in
                if let error = error {
                    completable(.error(error))
                } else {
                    completable(.completed)
                }
            }

            return Disposables.create()
        }
    }
}
