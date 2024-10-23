//
//  LoginButton.swift
//  GameStream
//
//  Created by Arnaldo Pedrero Varela on 23/10/24.
//

import SwiftUI

struct LoginButton: View {
    @State var label: String = ""
    @State var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(label)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth:.infinity,alignment:.center)
                .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("dark-cian"),lineWidth: 1.0).shadow(color:.white, radius: 6.0))
        })
    }
}

#Preview {
    LoginButton(action: {print("hola")})
}
