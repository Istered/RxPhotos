//
//  PlayerItemRequestResult.swift
//  RxPhotos
//
//  Created by Anton Romanov on 01/04/2018.
//  Copyright © 2018 Istered. All rights reserved.
//

import Foundation
import AVFoundation

public struct PlayerItemRequestResult {
    public let playerItem: AVPlayerItem?
    public let info: [AnyHashable: Any]

    internal init(playerItem: AVPlayerItem?, info: [AnyHashable: Any]?) {
        self.playerItem = playerItem
        self.info = info ?? [:]
    }
}
