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
                
                FavoriteGameView()
                
            }.padding(.horizontal , 18)
            
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }}

func search(){
    
}

struct FavoriteGameView: View{
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    @State var isPlayerActive = false
    
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    var body: some View{
        ScrollView{
            VStack{
                Text("LOS MÁS POPULARES")
                    .font(.title3)
                    .foregroundColor(.white)
                    .bold()
                    .frame(minWidth: 0, maxHeight: .infinity,alignment: .leading)
                    .padding(.top)
                
                ZStack{
                    Button(action:{
                        url = urlVideos[0]
                        print("URL: \(url)")
                        isPlayerActive = true
                    }, label: {
                        VStack(spacing: 0){
                            Image("the-witcher")
                                .resizable()
                                .scaledToFill()
                            Text("The witcher 3: Wild Hunt")
                                .frame(minWidth: 0, maxHeight: .infinity,alignment: .center)
                                .background(Color("bue-gray"))
                        }
                    })
                    
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 42, height: 42)
                    
                    NavigationLink(
                               destination: VideoPlayer(player:
                                       AVPlayer(url:  URL(string: url)!))
                                       .frame(width: 400, height: 300)
                                   ,
                               isActive: $isPlayerActive,
                               label: {
                                  
                                   
                                   EmptyView()
                               })
                }
                .frame(minWidth: 0, maxHeight: .infinity,alignment: .center)
            }
        }
    }
}

#Preview {
    Home()
}
