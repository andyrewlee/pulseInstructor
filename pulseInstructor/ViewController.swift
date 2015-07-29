//
//  ViewController.swift
//  pulseInstructor
//
//  Created by Jae Hoon Lee on 7/28/15.
//  Copyright © 2015 Jae Hoon Lee. All rights reserved.
//

import Cocoa
import QuartzCore

class ViewController: NSViewController {
    
    let socket = SocketIOClient(socketURL: "https://pacific-lake-4955.herokuapp.com")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true

        socket.connect()
        
        socket.on("connect") { data, ack in
            print("OSX::WE ARE USING SOCKETS")
        }
        
        socket.on("green") {data, ack in
            print(data)
            self.view.layer?.backgroundColor = CGColorCreateGenericRGB(0.314, 0.725, 0.282, 1.0)
        }
        
        socket.on("yellow") {data, ack in
            print(data)
            self.view.layer?.backgroundColor = CGColorCreateGenericRGB(0.996, 0.937, 0.000, 1.0)
        }
        
        socket.on("orange") {data, ack in
            print(data)
            self.view.layer?.backgroundColor = CGColorCreateGenericRGB(1.000, 0.498, 0.000, 1.0)
        }
        
        socket.on("red") {data, ack in
            print(data)
            self.view.layer?.backgroundColor = CGColorCreateGenericRGB(1.000, 0.000, 0.000, 1.0)
        }
        
        socket.on("check") {data, ack in
            print(data)
            print("checking")
        }
        
        socket.on("lastFiveResponses") {data, ack in
            print(data)
        }

    }

}

