//
//  PHImageManagerError.swift
//  RxPhotos
//
//  Created by Anton Romanov on 01/04/2018.
//  Copyright © 2018 Istered. All rights reserved.
//

import Foundation

public enum PHImageManagerError: Error {
    case underlying(NSError, [AnyHashable: Any])
    case cancelled([AnyHashable: Any])
}
