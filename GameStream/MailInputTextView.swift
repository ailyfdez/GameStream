//
//  MailInputTextView.swift
//  GameStream
//
//  Created by Arnaldo Pedrero Varela on 23/10/24.
//

import SwiftUI

struct MailInputTextView: View {
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Correo Electrónico").foregroundColor(Color("dark-cian"))
            ZStack(alignment: .leading){
                if(text.isEmpty){
                    Text("Escribe tu correo")
                        .font(.caption)
                        .foregroundColor( .gray)
                }
                
                TextField("",text: $text).foregroundColor(.white)
                
            }
            Divider()
                .frame(height: 1)
                .background(Color("dark-cian"))
                .padding(.bottom)
        }
    }
}

#Preview {
    @Previewable @State var mail=""
    
    MailInputTextView(text:$mail)
}
