//
//  RxPhotoError.swift
//  RxPhotos
//
//  Created by Anton Romanov on 01/04/2018.
//  Copyright © 2018 Istered. All rights reserved.
//

import Foundation
import Photos

public enum RxPhotoError: Error {
    case underlying(NSError, [AnyHashable: Any])
    case cancelled([AnyHashable: Any])

    init?(info: [AnyHashable: Any]) {
        if let error = info[PHImageErrorKey] as? NSError {
            self = .underlying(error, info)
        } else if let error = info[PHContentEditingInputErrorKey] as? NSError {
            self = .underlying(error, info)
        } else if let error = info[PHLivePhotoInfoErrorKey] as? NSError {
            self = .underlying(error, info)
        } else if let canceled = info[PHImageCancelledKey] as? Bool, canceled {
            self = .cancelled(info)
        } else if let canceled = info[PHContentEditingInputCancelledKey] as? Bool, canceled {
            self = .cancelled(info)
        } else if let canceled = info[PHLivePhotoInfoCancelledKey] as? Bool, canceled {
            self = .cancelled(info)
        } else {
            return nil
        }
    }
}
