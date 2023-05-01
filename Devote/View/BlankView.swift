//
//  BlankView.swift
//  Devote
//
//  Created by Jared Infantino on 2023-05-01.
//

import SwiftUI

struct BlankView: View {
    // MARK: - PROPERTY
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
        } // this will be the layer between the main View and the NewTaskItemView
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center) // semi-transparent view that fills the whole screen
        .background(Color.black)
        .opacity(0.5)
        .edgesIgnoringSafeArea(.all)
    }
}

    // MARK: - PREVIEW
struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView()
    }
}
