//
//  Duck.swift
//  DesignPatterns
//
//  Created by Andres Kwan on 11/9/16.
//  Copyright © 2016 Andres Kwan. All rights reserved.
//

import Foundation

class Duck {
    var flyBehavior: FlyBehavior!
    var quackBehavior: QuackBehavior!
    
    func performFly() -> Void {
        flyBehavior?.fly()
    }
    
    func performQuack() -> Void {
        quackBehavior?.quak()
    }
}
