//
//  Corsina.swift
//  furniture
//
//  Created by Have Dope on 09.04.2023.
//

import SwiftUI

struct Corsina: View {
    
    @StateObject  var viewModel: CorsinaModel
    @State private var isAlertShow = false
    var body: some View {
        VStack{
            
            Text("Корзина").font(.system(size: 35, weight: .light, design: .rounded)).foregroundColor(.gray)
             if viewModel.positions.count == 0{
                
                Text("Вы пока ничего не выбрали...")
                     .font(.system(size: 20, weight: .bold, design: .rounded))
                     .foregroundColor(.gray)
                
            }
            List(viewModel.positions) { position in
               CorsinaCell(position: position)
                    .swipeActions {
                        Button {
                            viewModel.positions.removeAll() { pos in
                                pos.id == position.id
                            }
                        } label: {
                            Text("Отменить")
                        }.tint(.gray)

                    }
                
               
            }
            
            HStack{
                Spacer()
                Text("\(self.viewModel.cost)")
                    .font(.system(size: 24, weight:.light, design: .rounded))
                    .padding(.horizontal, 14)
                    .padding(2)
                    .overlay {
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.gray, lineWidth: 2)
                    }
                
            }.padding(.horizontal, 10)
            ZStack{
                
               
                HStack{
                    Button {
                        print("Отменить ")
                        isAlertShow.toggle()
                    } label: {
                        Text("Отменить")
                            .font(.system(.title2, design: .rounded))
                            .foregroundColor(.red)
                    }
                    .padding(10)
                    .background(.white)
                    .cornerRadius(149)
//                    .overlay(
//                                    RoundedRectangle(cornerRadius: 25)
//                                        .stroke(Color.red, lineWidth: 2)
//                    )
                    
                    
                    
                    Spacer()
                    Button {
                        print("Заказать ")
                    } label: {
                        Text("Заказать")
                        
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(3)
                    }
                    .padding(10)
                    .background(.green)
                    .cornerRadius(149)
                    .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.green, lineWidth: 2)
                    ).shadow(color: .green, radius: 10, y: 5)
                    
                    
                }.padding(40)
            }
        }
        .alert(isPresented: $isAlertShow) {
            Alert(title: Text("Отменить"), message: Text("Вы дейтсивтельно хотите отменить заказ ?"), primaryButton: .cancel(Text("Нет")), secondaryButton: .destructive(Text("Да"), action: {
                viewModel.positions.removeAll()

            }))
        }
        
        
    }
}

struct Corsina_Previews: PreviewProvider {
    static var previews: some View {
        Corsina(viewModel: CorsinaModel.shared)
    }
}
