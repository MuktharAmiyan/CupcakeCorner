//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Mukthar Amiyan on 08/10/23.
//

import SwiftUI


struct ContentView: View {
    @StateObject var order = Order()
    var body: some View {
        NavigationView {
            Form{
                Section{
                    Picker("Select youe cake type", selection: $order.type) {
                        ForEach(Order.types.indices){
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes : \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section{
                    Toggle("Any special requests? ", isOn: $order.specialRequestEnabled.animation())
                    if order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section{
                    NavigationLink {
                        AddessView(order: order)
                    } label: {
                        Text("Delivery Detail")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

#Preview {
    NavigationView{
        ContentView()
    }
}
