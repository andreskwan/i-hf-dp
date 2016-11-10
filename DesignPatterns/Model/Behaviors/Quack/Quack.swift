//
//  File.swift
//  DesignPatterns
//
//  Created by Andres Kwan on 11/9/16.
//  Copyright © 2016 Andres Kwan. All rights reserved.
//

class Quack: QuackBehavior {
    func quak() {
        print("Quack")
    }
}

class MuteQuack: QuackBehavior {
    func quak() {
        print("<< Silence >>")
    }
}

class Squeak: QuackBehavior {
    func quak() {
        print("Squeak")
    }
}
