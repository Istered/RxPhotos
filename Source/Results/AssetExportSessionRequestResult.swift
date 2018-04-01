//
//  AssetExportSessionRequestResult.swift
//  RxPhotos
//
//  Created by Anton Romanov on 01/04/2018.
//  Copyright © 2018 Istered. All rights reserved.
//

import AVFoundation

public struct AssetExportSessionRequestResult {
    public let session: AVAssetExportSession?
    public let info: [AnyHashable: Any]

    internal init(session: AVAssetExportSession?, info: [AnyHashable: Any]?) {
        self.session = session
        self.info = info ?? [:]
    }
}
