//
//  RoomDetail.swift
//  SwiftUISampleCode
//
//  Created by Isaac Raval on 6/6/19.
//  Copyright © 2019 Isaac Raval. All rights reserved.
//

import SwiftUI
struct RoomDetail : View {
    let room: Room
    @State private var zoomed = false
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(room.imageName )
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .navigationBarTitle(Text(room.name), displayMode:
                    .inline)
                .tapAction { withAnimation(.basic(duration: 0.5)) {
                    self.zoomed.toggle() }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight:
                0, maxHeight: .infinity)
        }
    }
}

#if DEBUG
struct RoomDetail_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView { RoomDetail(room: testData[0]) }
            NavigationView { RoomDetail(room: testData[1]) }
        }
    }
}
#endif

