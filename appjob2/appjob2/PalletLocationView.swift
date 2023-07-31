//
//  PalletLocationView.swift
//  appjob2
//
//  Created by Lorenzo Juarez on 7/28/23.
//

import SwiftUI

func getRandomPalletInfo() -> [String: String] {
    return ["LOT": UUID().uuidString,
            "Expiry": Date().description,
            "Status": "QA Release",
            "Quantity": String(Int.random(in: 1...1000)),
            "TO": UUID().uuidString,
            "Location": UUID().uuidString]
}

struct PalletLocationView: View {
    let moveId: Int
    @State private var locationId: String = ""
    @State private var previousLocationId: String = ""
    @State private var navigateBackToCreatedMove: Bool = false
    @State private var palletInfo = getRandomPalletInfo()

    var body: some View {
        VStack {
            VStack {
                List {
                    ForEach(palletInfo.sorted(by: <), id: \.key) { key, value in
                        HStack {
                            Text(key)
                            Spacer()
                            Text(value)
                        }
                    }
                }
                .navigationTitle("Move ID: \(moveId)")

                HStack {
                    CustomTextField(text: $locationId, onCommit: {
                        print("Location scanned \(locationId)")
                    })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color.gray.opacity(0.2))

                    Button("Search") {
                        print("Search for location \(locationId)")
                    }
                    .padding()
                }
                .onChange(of: locationId) { newValue in
                    // check if change in text is greater than 5, which could indicate a scanner input
                    if abs(newValue.count - previousLocationId.count) > 5 {
                        navigateBackToCreatedMove = true
                    }
                    previousLocationId = newValue // save the last value
                }

                HStack {
                    Button(action: { navigateBackToCreatedMove = true }) {
                        Text("Move")
                            .foregroundColor(.white)
                            .frame(width: 100, height: 50)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding()

                    Button(action: { navigateBackToCreatedMove = true }) {
                        Text("Clear")
                            .foregroundColor(.white)
                            .frame(width: 100, height: 50)
                            .background(Color.black)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding()
                }
            }

            NavigationLink(destination: CreatedMoveView(moveId: moveId), isActive: $navigateBackToCreatedMove) {
                EmptyView()
            }
        }
    }
}





