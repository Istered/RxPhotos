//
//  RxPHPhotoLibraryObserver.swift
//  RxPhotos
//
//  Created by Anton Romanov on 01/04/2018.
//  Copyright © 2018 Istered. All rights reserved.
//

import Foundation
import Photos

internal final class RxPHPhotoLibraryObserver: NSObject, PHPhotoLibraryChangeObserver {
    var changeCallback: ((PHChange) -> Void)?

    func photoLibraryDidChange(_ changeInstance: PHChange) {
        changeCallback?(changeInstance)
    }
}
