//
//  ListRowItemView.swift
//  Devote
//
//  Created by Jared Infantino on 2023-05-01.
//

import SwiftUI

struct ListRowItemView: View {
    // MARK: - PROPERTY
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item // we need to observe item changes for our checkbox functionality
    
    // MARK: - BODY
    var body: some View {
        Toggle(isOn: $item.completion) {
            Text(item.task ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(item.completion ? Color.pink : Color.primary)
                .padding(.vertical, 12)
                .animation(.default)
        } // End of Toggle
        // objectWillChange is a publisher to subscribe too if there is a change it will perform an action
        .onReceive(item.objectWillChange, perform: { _ in
            if self.viewContext.hasChanges { // if there are changes, we try and save the new data
                try? self.viewContext.save()
            }
        })
    }
}
