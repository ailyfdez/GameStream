//
//  PassInputText.swift
//  GameStream
//
//  Created by Arnaldo Pedrero Varela on 23/10/24.
//

import SwiftUI

struct PassInputText: View {
    @Binding var text: String
    @State var label: String = "Contraseña"
    @State var placeholder: String = "Escribe tu contraseña"
    
    var body: some View {
        VStack(alignment: .leading){
            Text(label).foregroundColor(.white)
            ZStack(alignment: .leading){
                if(text.isEmpty){
                    Text(placeholder)
                        .font(.caption)
                        .foregroundColor( .white)
                }
                SecureField("",text: $text).foregroundColor(.white)
                
            }
            Divider()
                .frame(height: 1)
                .background(.gray)
                .padding(.bottom)
        }
    }
}

#Preview {
    @Previewable @State var pass=""
    
    PassInputText(text: $pass)
}
