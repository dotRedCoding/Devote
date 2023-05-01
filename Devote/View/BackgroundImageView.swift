//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Jared Infantino on 2023-05-01.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        Image("rocket")
            .antialiased(true) // keep edges smooth when it is scaled up or down
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
    }
}

struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}
