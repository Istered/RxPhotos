//
//  ContentEditRequestResult.swift
//  RxPhotos
//
//  Created by Anton Romanov on 01/04/2018.
//  Copyright © 2018 Istered. All rights reserved.
//

import Foundation
import Photos

public struct ContentEditRequestResult {
    public let editingInput: PHContentEditingInput?
    public let info: [AnyHashable: Any]

    internal init(editingInput: PHContentEditingInput?, info: [AnyHashable: Any]?) {
        self.editingInput = editingInput
        self.info = info ?? [:]
    }
}
