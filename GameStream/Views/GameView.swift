//
//  GameView.swift
//  GameStream
//
//  Created by Arnaldo Pedrero Varela on 6/11/24.
//

import SwiftUI
import AVKit
import Kingfisher

struct GameView: View {
    
    var url:String
    var titulo:String
    var studio:String
    var calificacion: String
    var anoPublicacion: String
    var descripcion:String
    var tags:[String]
    var imgsUrl: [String]
    
    var body: some View {
        ZStack {
            
            Color("marine").ignoresSafeArea()
            
            VStack {
                video(url: url).frame(height:300)
                
                ScrollView {
                    
                    //Informacion Video
                    videoInfo(titulo:titulo,studio:studio,calificacion:calificacion,anoPublicacion:anoPublicacion,descripcion:descripcion,tags:tags)
                        .padding(.bottom)
                    
                    Galery(imgsUrl:imgsUrl)
                }.frame( maxWidth: .infinity)
            }
        }
    }
}

struct video:View {
    var url:String
    
    var body: some View{
        if let url = URL(string: url) {
            VideoPlayer(player: AVPlayer(url: url)).ignoresSafeArea()
        } else {
            Text("Invalid URL")
        }
    }
}

struct videoInfo:View {
    
    var titulo:String
    var studio:String
    var calificacion:String
    var anoPublicacion:String
    var descripcion:String
    var tags:[String]
    
    var body: some View{
        VStack(alignment:.leading ){
            
            Text("\(titulo)")
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding(.leading)
            
            HStack{
                Text("\(studio)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top,5)
                    .padding(.leading)
                
                Text("\(calificacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top,5)
                
                Text("\(anoPublicacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top,5)
            }
            
            Text("\(descripcion)")
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top,5)
                .padding(.leading)
            
            
            HStack{
                ForEach(tags, id:\.self){
                    tag in
                    Text("#\(tag)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.top,4)
                        .padding(.leading)
                }
            }
        }.frame( maxWidth: .infinity,  alignment: .leading)
    }
}


struct Galery:View {
    
    var imgsUrl:[String]
    let formaGrid = [
        GridItem(.flexible())
    ]
    
    var body: some View{
        VStack(alignment: .leading){
            Text("GALERÍA").foregroundColor(.white).font(.title).padding(.leading)
            ScrollView(.horizontal) {
                LazyHGrid(rows: formaGrid, spacing: 8) {
                    ForEach(imgsUrl, id: \.self) {
                        imgUrl in
                        
                        KFImage(URL(string: imgUrl)).resizable()
                            .aspectRatio(contentMode: .fill)
                        
                        
                    }
                    
                }
            }.frame( height: 180)
            
            extraViews()
            
            
        }.frame( maxWidth: .infinity,alignment: .leading)
        
    }
}

struct extraViews:View {
    var body: some View{
        
        VStack(alignment: .leading){
            Text("COMENTARIOS").foregroundColor(.white).font(.title).padding(.leading)
            
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("blue-gray"))
                        .padding(.horizontal, 8.0)
                    
                    VStack(alignment: .leading) {
                        HStack{
                            Image( "perfil-ejemplo").resizable().aspectRatio(contentMode: .fit).frame(width: 64, height: 64).accentColor(.white).padding([.top, .leading])
                            
                            VStack(alignment: .leading) {
                                Text("Lorem").bold().foregroundColor(Color.white)
                                
                                Text("Hace 18 horas").foregroundColor(Color.white)
                            }
                        }
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum auctor, mauris lorem.  ").foregroundColor(.white).padding(.leading,8)
                            .frame( height: 80)
                    }
                }
                
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("Blue-Gray"))
                        .padding(.horizontal, 8.0)
                    
                    VStack(alignment: .leading) {
                        HStack{
                            
                            Image( "perfil-ejemplo").resizable().aspectRatio(contentMode: .fit).frame(width: 64, height: 64).accentColor(.white).padding([.top, .leading])
                            
                            VStack(alignment: .leading) {
                                Text("Ipsum").bold().foregroundColor(Color.white)
                                
                                Text("Hace 8 horas").foregroundColor(Color.white)
                            }
                        }
                        
                        Text("Vestibulum auctor, mauris lorem molestie nibh.Lorem ipsum consectetur adipiscing elit.    ").foregroundColor(.white)
                            .padding(.horizontal, 8.0)
                            .frame( height: 80)
                    }
                }
            }
            
            
            Text("JUEGOS SIMILARES").foregroundColor(.white).font(.title).padding(.leading)
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    Image("abzu").resizable().scaledToFit().frame(width: 240, height: 135)
                    
                    Image("crash-bandicoot").resizable().scaledToFit().frame(width: 240, height: 135)
                    
                    Image("death-stranding").resizable().scaledToFit().frame(width: 240, height: 135)
                }
            }
        }
    }
}

#Preview {
    GameView(url: "Ejemplo.com", titulo: "Sonic", studio: "Sega", calificacion: "E+", anoPublicacion: "1991", descripcion: "Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente", tags: ["plataformas","mascota"], imgsUrl: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"])
}

