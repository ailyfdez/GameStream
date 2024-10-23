//
//  SocialMedia.swift
//  GameStream
//
//  Created by Arnaldo Pedrero Varela on 23/10/24.
//

import SwiftUI

struct SocialMedia: View {
    @State var headerText: String = ""
    
    var body: some View {
        Text(headerText).foregroundColor(.white).frame(maxWidth:.infinity, alignment: .center)
        
        HStack{
            Button(action: initSession, label: {
                Text("Facebook")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth:.infinity,alignment:.center)
                    .padding(.vertical,3.0)
                    .background(Color("blue-gray"))
                    .clipShape(RoundedRectangle(cornerRadius: 4.0))
            }).padding()
            
            Button(action: initSession, label: {
                Text("Twitter")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth:.infinity,alignment:.center)
                    .padding(.vertical,3.0)
                    .background(Color("blue-gray"))
                    .clipShape(RoundedRectangle(cornerRadius: 4.0))
            }).padding()
        }
    }
}

#Preview {
    SocialMedia()
}
