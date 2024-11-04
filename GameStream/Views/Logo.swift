//
//  Logo.swift
//  GameStream
//
//  Created by Arnaldo Pedrero Varela on 24/10/24.
//

import SwiftUI

struct Logo: View {
    var body: some View {
        Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom , 60)
    }
}

#Preview {
    Logo()
}
