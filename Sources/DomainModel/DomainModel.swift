struct DomainModel {
    var text = "Hello, World!"
        // Leave this here; this value is also tested in the tests,
        // and serves to make sure that everything is working correctly
        // in the testing harness and framework.
}

////////////////////////////////////
// Money
//
public struct Money {
    var amount: Int;
    var currency: String;
    let exchange = ["USD": 1.0, "GBP": 0.5, "EUR": 1.5, "CAN": 1.25 ];
    init(amount: Int, currency: String){
        self.amount = amount;
        self.currency = currency;
    }
    
    func convert(_ arg: String) -> Money {
        let converted = Int(Double(self.amount) / exchange[self.currency]! * exchange[arg]!);
        return Money(amount: converted, currency: arg);
    }
    
    func add(_ arg: Money) -> Money {
        let newAmount = arg.amount + convert(arg.currency).amount;
        return Money(amount: newAmount, currency: arg.currency);
    }
    
    func subtract(_ arg: Money) -> Money {
        let newAmount = convert(arg.currency).amount - arg.amount;
        return Money(amount: newAmount, currency: arg.currency);
    }
}

////////////////////////////////////
// Job
//
public class Job {
    public enum JobType {
        case Hourly(Double)
        case Salary(UInt)
    }
    var title: String;
    var type: JobType;
    init(title: String, type: JobType){
        self.title = title;
        self.type = type;
    }
    
    func calculateIncome(_ arg: Int) -> Int {
        switch self.type{
        case .Hourly(let money):
            return Int(money * Double(arg));
        case .Salary(let money):
            return Int(money)
        }
    }
    
    func raise(byAmount: Double) {
        switch self.type {
        case .Hourly(let money):
            self.type = JobType.Hourly(money + byAmount)
        case .Salary(let money):
            self.type = JobType.Salary(money + UInt(Double(byAmount)))
        }
    }
    
    func raise(byPercent: Double) {
        switch self.type {
        case .Hourly(let money):
            self.type = JobType.Hourly(money + (money * byPercent))
        case .Salary(let money):
            self.type = JobType.Salary(money + UInt(Double(money) * byPercent))
        }
    }
}

////////////////////////////////////
// Person
//
public class Person {
    var firstName: String
    var lastName: String
    var age: Int
    var job: Job
    var spouse: Person
}

////////////////////////////////////
// Family
//
public class Family {
}
