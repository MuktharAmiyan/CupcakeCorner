//
//  AddessView.swift
//  CupcakeCorner
//
//  Created by Mukthar Amiyan on 15/10/23.
//

import SwiftUI

struct AddessView: View {
    @ObservedObject var order : Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address" , text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            Section {
                NavigationLink{
                    CheckOutView(order: order)
                } label: {
                    Text("Check Out")
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationTitle("Delivery Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView{
        AddessView(order: Order())
    }
}
