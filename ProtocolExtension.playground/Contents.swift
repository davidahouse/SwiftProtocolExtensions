//: Playground - noun: a place where people can play

import Cocoa

//: ## Protocol Extensions

//: ### First let's create a simple protocol
//:
//: This FancyDescription protocol is just a single function that will
//: return a string similar to how description works in Objective-C. The idea
//: is that an object should just return a string representation of itself, but fancy like!
protocol FancyDescription {
    func fancyDescription() -> String
}

//: ### And a simple struct to use the protocol with
//:
//: How about a struct that describes an Awesome Sauce, with a name and 
//: level of awesomeness.
struct AwesomeSauce {

    var name: String
    var awesomeLevel:String
    
    init(name:String,awesomeLevel:String) {
        self.name = name
        self.awesomeLevel = awesomeLevel
    }
}

//: ### And we can use an extension to implement this protocol on that struct! How cool.
//:
//: Here the extension will implement the protocol FancyDescription on the struct AwesomeSauce. This
//: will ensure that AwesomeSauce conforms to this protocol. We could have added this to the struct
//: above directly, but using an extension for this is a nice way to separate out our code.
extension AwesomeSauce : FancyDescription {
    
    func fancyDescription() -> String {
        return "<<< SAUCE: \(self.name) is \(self.awesomeLevel) >>>"
    }
}

//: ### Now lets try it out.

let spicySauce = AwesomeSauce(name: "Hot Pig Sauce", awesomeLevel: "Pretty Amazing!")
spicySauce.fancyDescription()

//: ### OK, this works, but we can make it more awesome
//:
//: What if we want a function that will get automatically added to any object that conforms
//: to FancyDescription, but is the SAME for all those objects? In other words, we don't want to
//: implement a common function in each class, we just want it to live somewhere once. Extensions
//: can help!
//:
//: The extension below extends the FancyDescription protocol! You can think of this adding a common
//: function to anything that conforms to the FancyDescription protocol. Now we can add some common
//: behaviors without having to implement them on all the things that implement FancyDescription.
extension FancyDescription {
    
    func imSoFancy() -> String {
        return "EVEN MORE FANCY ---> \(self.fancyDescription()) <---"
    }
}

//: ### Done
//:
//: Now we have this imSoFancy function that can be called on anything that conforms to the protocol
//: FancyDescription.
spicySauce.imSoFancy()



