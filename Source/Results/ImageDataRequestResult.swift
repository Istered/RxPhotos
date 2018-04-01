//
//  ImageDataRequestResult.swift
//  RxPhotos
//
//  Created by Anton Romanov on 01/04/2018.
//  Copyright © 2018 Istered. All rights reserved.
//

import Foundation

public struct ImageDataRequestResult {
    public let data: Data?
    public let UTI: String?
    public let orientation: UIImageOrientation
    public let info: [AnyHashable: Any]

    internal init(data: Data?, UTI: String?, orientation: UIImageOrientation, info: [AnyHashable: Any]?) {
        self.data = data
        self.UTI = UTI
        self.orientation = orientation
        self.info = info ?? [:]
    }
}
