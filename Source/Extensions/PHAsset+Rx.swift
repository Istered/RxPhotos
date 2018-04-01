//
//  PHAsset+Rx.swift
//  RxPhotos
//
//  Created by Anton Romanov on 01/04/2018.
//  Copyright © 2018 Istered. All rights reserved.
//

import Foundation
import Photos
import RxSwift

extension Reactive where Base: PHAsset {
    public func requestContentEditingInput(with options: PHContentEditingInputRequestOptions?)
        -> Single<ContentEditRequestResult> {
        return Single.create { [weak base] single in

            let requestId = base?.requestContentEditingInput(
                with: options,
                completionHandler: { input, info in
                    if let error = RxPhotoError(info: info) {
                        single(.error(error))
                    } else {
                        single(.success(ContentEditRequestResult(editingInput: input, info: info)))
                    }
            })

            return Disposables.create {
                requestId.map { base?.cancelContentEditingInputRequest($0) }
            }
        }
    }
}
