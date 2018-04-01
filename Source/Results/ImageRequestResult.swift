//
//  ImageRequestResult.swift
//  RxPhotos
//
//  Created by Anton Romanov on 01/04/2018.
//  Copyright © 2018 Istered. All rights reserved.
//

import Foundation

public struct ImageRequestResult {
    public let image: UIImage?
    public let info: [AnyHashable: Any]

    internal init(image: UIImage?, info: [AnyHashable: Any]?) {
        self.image = image
        self.info = info ?? [:]
    }
}
