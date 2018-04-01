//
//  AssetRequestResult.swift
//  RxPhotos
//
//  Created by Anton Romanov on 01/04/2018.
//  Copyright © 2018 Istered. All rights reserved.
//

import Foundation
import AVFoundation

public struct AssetRequestResult {
    public let asset: AVAsset?
    public let audioMix: AVAudioMix?
    public let info: [AnyHashable: Any]

    internal init(asset: AVAsset?, audioMix: AVAudioMix?, info: [AnyHashable: Any]?) {
        self.asset = asset
        self.audioMix = audioMix
        self.info = info ?? [:]
    }
}
