//: Playground - noun: a place where people can play

protocol QuackBehavior {
    func quak() -> Void
}

class Quack: QuackBehavior {
    func quak() {
        print("Quack")
    }
}

class MuteQuack: QuackBehavior {
    func quak() {
        print("<< Silence, can't make a sound >>")
    }
}

class Squeak: QuackBehavior {
    func quak() {
        print("Squeak")
    }
}

protocol FlyBehavior {
    func fly() -> Void
}

class FlyWithWings:FlyBehavior {
    func fly() {
        print("Fly with wings!")
    }
}

class FlyNoWay:FlyBehavior {
    func fly() {
        print("I can't fly!")
    }
}

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

class MallarDuck: Duck {
    override init() {
        super.init()
        //Programming to an implementation - what should be avoided. 
        //this hardcode assignation also should be avoided
        //this behaviors should be flexible, could be asigned at runtime.
        //example: sefl.flyBehavior = getFlyingBehavior()
        self.flyBehavior = FlyWithWings()
        self.quackBehavior = MuteQuack()
    }
}

class MiniDuckSimulator {
    init() {
        let mallard: Duck = MallarDuck()
        mallard.performFly()
        mallard.performQuack()
    }
}

let miniDuck = MiniDuckSimulator()

