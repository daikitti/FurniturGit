//
//  DetailView.swift
//  furniture
//
//  Created by Have Dope on 07.04.2023.
//

import SwiftUI

struct DetailView: View {
    var item: Product
    @State var count = 1
    @State var inCard = false
    
    var body: some View {
        
        ZStack {
            VStack {
                Spacer()
                Image(item.imgeName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                detail()
            }
        }
    }
    
    @ViewBuilder
    private func detail() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(.white)
                .shadow(radius: 9, y: -10)
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.bold)
                        VStack(alignment: .leading){
                            Text("Size 120/80/120")
                            Text("Weight: 45kg ")
                        }
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        
                        
                    }
                    .padding(24)
                    .frame(maxWidth: .infinity, maxHeight: 230, alignment: .topLeading)
                    Spacer()
                    VStack{
                        HStack{
                            ForEach(1..<5) { _ in
                                Image(systemName: "star.fill")
                            }
                            
                            Image(systemName: "star")
                            
                        }
                        Text("143 reviews")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.top, 3)
                        
                    }.padding(.horizontal,10)
                }
                HStack {
                    Text("₽\(item.price)")
                        .font(.system(.title2,design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .overlay{
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.gray, lineWidth: 2)
                                    .foregroundColor(.green)
                                    .background(.white)
                                
                            }
                        
                            HStack{
                                Button {
                                    ///-=1
                                    if count > 1{
                                        count -= 1
                                        
                                    }else {
                                        print("Мало")
                                    }
                                } label: {
                                    Text("-")
                                }
                                Spacer()
                                
                                Text(String(count))
                                
                                Spacer()
                                
                                
                                Button {
                                    count += 1
                                } label: {
                                    Text("+")
                                }
                                
                                
                            }.font(.title3)
                                .foregroundColor(.gray)
                                .background(.white)
                                .padding([.leading, .trailing])
                        }.padding()
                            .frame(height: 90)
                        
                        
                        Spacer()
                        Button {
                            print("Added to you cart" )
                            let position = Product(title: item.title, price: item.price, imgeName: item.imgeName, count: self.count, shadowColor: item.shadowColor)
                            CorsinaModel.shared.addPosition(position)
                            if !inCard {
                                inCard.toggle()
                            }
                            
                        } label: {
                            ZStack {
                                
                                
                                if inCard == true{
                                    Image(systemName: "cart.circle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 80, height: 80)
                                        .foregroundColor(.green)
                                        .background(.clear)
                                    
                                }else{
                                    RoundedRectangle(cornerRadius: 40)
                                        .foregroundColor(.black)
                                        .frame(width: 150, height: 75)
                                    
                                    Text("Cart")
                                        .foregroundColor(.white)
                                        .font(.system(.title,design: .rounded))
                                        .fontWeight(.heavy)
                                    
                                }
                            }
                        }
                    }.padding([.leading, .trailing])
                    // .padding()
                
                }
                
            }.frame(height: 230)
            .animation(.easeIn(duration: 0), value: inCard)
        }
    }
    
    struct DetailView_Previews: PreviewProvider {
        static var previews: some View {
            DetailView(item: Product(title: "Emerald Sofa", price: 2500, imgeName: "emeraldSofa", count: 1, shadowColor: .gray))
        }
    }
