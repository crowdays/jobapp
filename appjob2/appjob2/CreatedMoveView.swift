//
//  CreatedMoveView.swift
//  appjob2
//
//  Created by Lorenzo Juarez on 7/28/23.
//

import SwiftUI


struct CreatedMoveView: View {
    let moveId: Int
    @State private var palletId: String = ""
    @State private var previousPalletId: String = ""
    @State private var navigateToLocation: Bool = false
    @StateObject private var bluetoothManager = BluetoothManager()

    var body: some View {
        VStack {
            Text("Move ID: \(moveId)")
                .font(.largeTitle)
                .padding()

            HStack {
                CustomTextField(text: $palletId, onCommit: {
                    // Dont know database so cant add search function to pallet
                    
                    
                    print("Search for pallet \(palletId)")
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color.gray.opacity(0.2))
                .padding()

                Button("Search") {
                    print("Search for pallet \(palletId)")
                    if !palletId.isEmpty {
                        navigateToLocation = true
                    }
                }
                .padding()
            }
            .onChange(of: palletId) { newValue in
                // check if change in text is greater than 5, which could indicate a scanner input
                if abs(newValue.count - previousPalletId.count) > 5 {
                    navigateToLocation = true
                }
                previousPalletId = newValue
            }

            NavigationLink(destination: PalletLocationView(moveId: moveId), isActive: $navigateToLocation) {
                EmptyView()
            }
            .navigationBarBackButtonHidden(true)
        }
        .onAppear {
            self.bluetoothManager.startScanning()
        }

        .onChange(of: bluetoothManager.scannedData) { scannedData in
            palletId = scannedData // update palletId whenever new data is scanned
        }
    }
}


