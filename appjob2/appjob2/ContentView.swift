import SwiftUI

struct ContentView: View {
    @State private var selectedView: String?

    var body: some View {
        NavigationView {
            HStack {
                VStack {
                    NavigationLink(
                        destination: MovesView(),
                        label: {
                            Text("Moves")
                                .frame(width: 100, height: 100)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .shadow(color: .black, radius: 10, x: 0, y: 0)
                                .padding()
                        })
                        .offset(x: -160, y: 0)

                    NavigationLink(
                        destination: ReceivingView(),
                        label: {
                            Text("Receiving")
                                .frame(width: 200, height: 80)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .shadow(color: .black, radius: 10, x: 0, y: 0)
                                .padding()
                        })
                        .offset(x: -120, y: 0)

                    NavigationLink(
                        destination: ScanMaterialsToVipView(),
                        label: {
                            Text("Scan Materials to VIP")
                                .frame(width: 200, height: 80)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .shadow(color: .black, radius: 10, x: 0, y: 0)
                                .padding()
                        })
                        .offset(x: -120, y: 0)

                    Spacer()
                }
                
                VStack {
                    NavigationLink(
                        destination: PickListView(),
                        label: {
                            Text("Pick List")
                                .frame(width: 100, height: 100)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .shadow(color: .black, radius: 10, x: 0, y: 0)
                                .padding()
                        })
                        .offset(x: 160, y: 0)
                    
                    NavigationLink(
                        destination: ShippingView(),
                        label: {
                            Text("Shipping")
                                .frame(width: 200, height: 80)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .shadow(color: .black, radius: 10, x: 0, y: 0)
                                .padding()
                        })
                        .offset(x: 120, y: 0)
                    
                    NavigationLink(
                        destination: InspectionView(),
                        label: {
                            Text("Inspection")
                                .frame(width: 200, height: 80)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .shadow(color: .black, radius: 10, x: 0, y: 0)
                                .padding()
                        })
                        .offset(x: 120, y: 0)
                    
                    Spacer()
                }
            }
            .navigationBarTitle("Nulogy Mobile Home", displayMode: .inline)
            .navigationBarItems(leading:
                Button(action: {}) {
                    Image(systemName: "list.bullet")
                }
                .contextMenu {
                    Button("Moves") { selectedView = "Moves" }
                    Button("Receiving") { selectedView = "Receiving" }
                    Button("Scan Materials to VIP") { selectedView = "Scan Materials to VIP" }
                    Button("Pick List") { selectedView = "Pick List" }
                    Button("Shipping") { selectedView = "Shipping" }
                    Button("Inspection") { selectedView = "Inspection" }
                }
            )
        }
    }
}






struct ReceivingView: View {
    var body: some View {
        Text("Receiving View")
            .padding()
    }
}

struct ScanMaterialsToVipView: View {
    var body: some View {
        Text("Scan Materials to VIP View")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

