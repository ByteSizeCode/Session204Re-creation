//
//  RoomStore.swift
//  SwiftUISampleCode
//
//  Created by Isaac Raval on 6/6/19.
//  Copyright © 2019 Isaac Raval. All rights reserved.
//

import SwiftUI
import Combine

class RoomStore : BindableObject {
    var rooms: [Room] {
        didSet { didChange.send(testData.last!) }
        
    }
    
    init(rooms: [Room] = []) {
        self.rooms = rooms
    }
    
    var didChange = PassthroughSubject<Room, Never>()
}
