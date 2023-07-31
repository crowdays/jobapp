//
//  movesview.swift
//  appjob2
//
//  Created by Lorenzo Juarez on 7/28/23.


import SwiftUI

struct MovesView: View {
    @State private var moveId: String = ""
    @State private var job: String = ""
    @State private var shipment: String = ""

    var body: some View {
            NavigationView {
                HStack {
                    VStack {
                        NavigationLink(destination: CreatedMoveView(moveId: Int.random(in: 1000...9999))) {
                            Text("+ Create Moves")
                                .foregroundColor(.white)
                                .frame(width: 200, height: 60)
                                .background(Color.green)
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 10)
                    
                    Text("Search for moves by specifying at least one search option")
                        .frame(width: 250, height: 80)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.bottom, 10)
                    
                    Spacer()
                }
                
                Spacer()

                VStack(alignment: .trailing) {
                    Text("Search Moves")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    TextField("MoveID", text: $moveId)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5)
                        .frame(width: 200)
                    TextField("Job", text: $job)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5)
                        .frame(width: 200)
                    TextField("Shipment", text: $shipment)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(5)
                        .frame(width: 200)
                    HStack {
                        Button(action: {}) {
                            Text("Search")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(5)
                        }
                        Button(action: {}) {
                            Text("Clear")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.red)
                                .cornerRadius(5)
                        }
                    }
                }
                .padding([.leading, .bottom, .top])
                .background(Color.black.ignoresSafeArea())
            }
            .padding([.top, .bottom])
        }
        .navigationBarTitle("Moves", displayMode: .inline)
        .navigationBarItems(leading:
            Button(action: {}) {
                Text("Menu")
            }, trailing:
            Button(action: {}) {
                Text("Search Moves")
            }
        )
    }
}

struct MovesView_Previews: PreviewProvider {
    static var previews: some View {
        MovesView()
    }
}







