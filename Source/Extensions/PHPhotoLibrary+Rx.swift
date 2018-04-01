//
//  PHPhotoLibrary+Rx.swift
//  RxPhotos
//
//  Created by Anton Romanov on 01/04/2018.
//  Copyright © 2018 Istered. All rights reserved.
//

import Foundation
import Photos
import RxSwift

extension Reactive where Base: PHPhotoLibrary {
    public static func requestAuthorization() -> Single<PHAuthorizationStatus> {
        return Single.create { single in
            PHPhotoLibrary.requestAuthorization { status in
                single(.success(status))
            }

            return Disposables.create()
        }
    }

    public func performChanges(_ changeBlock: @escaping () -> Void) -> Single<Bool> {
        return Single.create { [weak base] single in
            base?.performChanges(changeBlock) { result, error in
                if let error = error {
                    single(.error(error))
                } else {
                    single(.success(result))
                }
            }

            return Disposables.create()
        }
    }

    public var photoLibraryChange: Observable<PHChange> {
        let changeObserver = RxPHPhotoLibraryObserver()
        base.register(changeObserver)

        return Observable.create { [weak base] observable in
            changeObserver.changeCallback = observable.onNext

            return Disposables.create {
                base?.unregisterChangeObserver(changeObserver)
            }
        }
    }
}
