//
//  LivePhotoRequestResult.swift
//  RxPhotos
//
//  Created by Anton Romanov on 01/04/2018.
//  Copyright © 2018 Istered. All rights reserved.
//

import Foundation
import Photos

public struct LivePhotoRequestResult {
    public let livePhoto: PHLivePhoto?
    public let info: [AnyHashable: Any]

    internal init(livePhoto: PHLivePhoto?, info: [AnyHashable: Any]?) {
        self.livePhoto = livePhoto
        self.info = info ?? [:]
    }
}
