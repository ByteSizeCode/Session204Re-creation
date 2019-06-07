//
//  ContentView.swift
//  SwiftUISampleCode
//
//  Created by Isaac Raval on 6/6/19.
//  Copyright © 2019 Isaac Raval. All rights reserved.
//

import SwiftUI
struct ContentView : View {
    @ObjectBinding var store = RoomStore()
    
    var body: some View {
        
        NavigationView {
            List {
                Section {
                    Button(action: addRoom) {
                        Text("Add Room")
                    }
                }

                Section {

                    ForEach(store.rooms) { room in
                        RoomCell(room: room)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
            }
            .navigationBarTitle(Text("Rooms") )
            .navigationBarItems(trailing: EditButton())
            .listStyle(.grouped)
        }
    }

    func addRoom() {
        store.rooms.append(Room(name: "Hall 2", capacity: 2000))
    }
    func delete(at offsets: IndexSet) {
        store.rooms.remove(at: offsets.count)
    }
    func move(from source: IndexSet, to destination: Int) {
//        store.rooms.move(fromOffsets: source, toOffset: destination)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(store: RoomStore(rooms: testData))
            ContentView(store: RoomStore(rooms: testData))
            .environment(\.sizeCategory, .extraExtraExtraLarge)
            ContentView(store: RoomStore(rooms: testData))
            .environment(\.colorScheme, .dark)
            ContentView(store: RoomStore(rooms: testData))
            .environment(\.layoutDirection, .rightToLeft)
            .environment(\.locale, Locale(identifier: "ar"))
        }
    }
}
#endif
struct RoomCell : View {
    let room: Room
    var body: some View {
        return NavigationButton(destination: RoomDetail(room: room) )
        {
            Image(room.thumbnailName)
            .cornerRadius(8)
            .relativeSize(width: 1/30, height: 1/30)
            .aspectRatio(contentMode: .fit)
            
            VStack(alignment: .leading) {
                Text (room.name)
                Text ("\(room.capacity) people")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
