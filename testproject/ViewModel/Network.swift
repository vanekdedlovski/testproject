//
//  Network.swift
//  testproject
//
//  Created by bnkwsr4 on 05.02.2022.
//

import Foundation
import Network

class Network : ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkCheck")
    @Published var IsConnect = true
    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.IsConnect = path.status == .satisfied
            }
            
        }
        monitor.start(queue: queue)
    }
}
