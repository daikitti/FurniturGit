//
//  MainView.swift
//  furniture
//
//  Created by Have Dope on 06.04.2023.
//

import SwiftUI

struct MainView: View {
    @State private var text = ""
    
    var body: some View {
        VStack{
            
            NavigationView {
                
                ScrollView {
                    
                    
                    Text("Chair")
                        .font(.system(.title))
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .padding()
                    
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false){
                            
                            HStack {
                                ForEach(Product.chairs) { item in
                                    
                                    NavigationLink {
                                        DetailView(item: item)
                                    } label: {
                                        GeometryReader {geometry in
                                            CardView(item: item)
                                                .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -20), axis: (x: 0, y: 10, z: 0))
                                        }.frame(width: 300 , height:  screen.height/3)
                                    }
                                }
                            }.padding(.leading)
                                .frame(height: screen.height/2.4, alignment: .top)
                        }
                        Text("Sofa")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .padding(.vertical, -70)
                            .padding()
                        
                    }
                    
                  
                    
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(Product.sofa) { item in
                                NavigationLink {
                                    DetailView(item: item)
                                } label: {
                                    GeometryReader { geomety in
                                        CardView(item: item)
                                            .rotation3DEffect(Angle(degrees: geomety.frame(in: .global).minX - 30) / -20, axis: (x: 0, y: 10, z: 0))
                                            .padding(.horizontal)
                                        
                                    }.frame(width: 300 , height:  screen.height/3, alignment: .top)
                                }
                            }
                        }.padding(.leading)
                            .frame(height: screen.height/1.8, alignment: .top)
                    }.padding(.vertical, -20)
                }
                
            }
        }
    }
    
    
    @ViewBuilder
    private func header() -> some View {
        VStack(spacing: 18) {
            
            HStack{
                
                Image(systemName: "magnifyingglass")
                TextField("Search...", text: $text)
                
                Button {
                    print("filter")
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                        
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }.padding(10)
                .background(Color.white)
                .cornerRadius(10)
            
        }.padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
