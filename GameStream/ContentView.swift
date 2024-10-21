//
//  ContentView.swift
//  GameStream
//
//  Created by Arnaldo Pedrero Varela on 21/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 19/255, green: 30/255, blue: 53/255,opacity: 1)
            
            VStack{
                Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom , 60)
                InitAndRegisterView()
            }
        }
    }
}
 

struct InitAndRegisterView:View {
    @State var initSessionType = true
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button("INICIA SESSION"){
                    initSessionType=true
                    print("inicio")
                }.foregroundColor(initSessionType ? .white : .gray)
                Spacer()
                Button("REGISTRATE"){
                    initSessionType=false
                    print("registro")
                }.foregroundColor(initSessionType ? .gray : .white)
                Spacer()
            }
            
            Spacer(minLength: 42)
            if(initSessionType==true){
                InitSessionView()
            }
            else{
                RegistryView()
            }
        }
    }
}

struct InitSessionView:View{
    var body: some View{
        Text("inicio de seccion")
    }
}

struct RegistryView:View{
    var body: some View{
        Text("Registro")
    }
}

#Preview {
    ContentView()
}
