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

class FlyRocketPower: FlyBehavior {
    func fly() {
        print("I'm flying with a rocket!")
    }
}

class Duck {
    var flyBehavior: FlyBehavior? {
        didSet {
            if let flyBehavior = flyBehavior {
                print("flyBehavior is set to: \(type(of:flyBehavior))")
            } else {
                print("flyBehavior is nil")
            }
        }
    }
    var quackBehavior: QuackBehavior?
    
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
        //In swift already do this 
        //because flyBehavior = is already setFlyBehavior() is not needed
        self.flyBehavior = FlyWithWings()
        self.quackBehavior = MuteQuack()
    }
}

class ModelDuck: Duck {
    override init () {
        super.init()
        self.flyBehavior = FlyNoWay()
        self.quackBehavior = Quack()
    }
    
    func display() -> Void {
        print("I'm a model duck")
    }
}

class MiniDuckSimulator {
    init() {
        let mallard: Duck = MallarDuck()
        // first call to performFly delegates the flyBehavior object set in the ModelDuck's constructor
        mallard.performFly()
        mallard.performQuack()
        
        let model: Duck = ModelDuck()
        model.performFly()
        // the model duck dynamically changed its flying behavior! 
        // can't be done if the implementation lives inside the duck class
        // - invokes the model's inherited bahavior setter method, now it can fly!
        model.flyBehavior = FlyRocketPower()
        model.performFly()
    }
}

let miniDuck = MiniDuckSimulator()



