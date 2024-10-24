//
//  Home.swift
//  GameStream
//
//  Created by Arnaldo Pedrero Varela on 24/10/24.
//

import SwiftUI
import AVKit

struct Home: View {
    @State var searchText = ""
    
    var body: some View {
        ZStack{
            Color("marine")
            
            VStack{
                Logo()
                
                HStack{
                    Button(action: search, label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(searchText.isEmpty ? Color(red: 174/255, green: 177/255, blue: 185/255,opacity: 1.0) : Color("dark-cian"))
                    })
                    
                    ZStack(alignment: .leading){
                        if(searchText.isEmpty){
                            Text("Buscar un video")
                                .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                        }
                        
                        TextField("", text: $searchText).foregroundColor(.white)
                    }
                }
                .padding([.top,.leading,.bottom] , 11)
                .background(Color("blue-gray"))
                .clipShape(Capsule())
                
            }.padding(.horizontal , 18)
            
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }}

func search(){
    
}

#Preview {
    Home()
}
