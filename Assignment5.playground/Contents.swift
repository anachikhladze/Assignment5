import UIKit

/*
 შექმენით enum-ი სახელით DayOfWeek შესაბამისი ქეისებით. დაწერეთ function რომელიც იღებს ამ ენამის ტიპს. function-მა უნდა და-print-ოს, გადაწოდებული დღე კვირის დღეა თუ დასვენების.
 */

enum DayOfWeek {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
}

func printWeekday(currentDay: DayOfWeek) {
    switch currentDay {
    case .monday, .tuesday, .wednesday, .thursday, .friday:
        print("\(currentDay) - It's a weekday!")
    case .saturday, .sunday:
        print("\(currentDay) - It's a weekend!")
    }
}

func firstProblem() {
    print("--------------- First Problem ---------------")
    printWeekday(currentDay: .sunday)
}

/*
 შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით.
 */

enum Weather {
    case sunny(temp: Double)
    case cloudy(temp: Double)
    case rainy(temp: Double)
    case snowy(temp: Double)
}

func getRecommendation(weather: Weather) -> String {
    switch weather {
    case let .sunny(temp):
        if temp > 30 {
            return "It's hot! Don't forget to wear sunglasses and SPF."
        } else if temp > 20 {
            return "It's warm! Wear a jeans and a t-shirt."
        } else {
            return "Wear a Hoodie or a jacket"
        }
    case let .cloudy(temp):
        if temp > 20 {
            return "It's cloudy but warm! Wear a jeans and a t-shirt."
        } else {
            return "It's cloudy! Wear a hoodie and a jeans."
        }
    case let .rainy(temp):
        if temp > 18 {
            return "It's rainy, but not too cold. Wear a waterproof jacket!"
        } else {
            return "It's rainy and cold! Wear a hoodie and a waterproof jacket!"
        }
    case let .snowy(temp):
        if temp > 10 {
            return "It's snowy, but not too cold. Wear a warm coat."
        } else {
            return "It's freezing! Wear everything you have..."
        }
    }
}

func secondProblem() {
    print()
    print("--------------- Second Problem ---------------")
    
    let advice = getRecommendation(weather: .snowy(temp: 3))
    print(advice)
}

/*
 შექმენით struct-ი Book, with properties როგორიცაა: title, author, publicationYear. ამის შემდეგ შექმენით array-ი Book-ის ტიპის, შექმენით რამოდენიმე Book-ის ობიექტი, და შეავსეთ array ამ წიგნებით. დაწერეთ function რომელიც მიიღებს ამ წიგნების array-ს და მიიღებს წელს. function-მა უნდა დაგვიბრუნოს ყველა წიგნი რომელიც გამოშვებულია ამ წლის შემდეგ. დავ-print-ოთ ეს წიგნები.
 */

struct Book {
    let title: String
    let author: String
    let publicationYear: Int
}

var arrayOfBooks: [Book] = []

let firstBook = Book(title: "The Unbearable Lightness of Being", author: "Milan Kundera", publicationYear: 1984)
let secondBook = Book(title: "The Dharma Bums", author: "Jack Kerouac", publicationYear: 1958)
let thirdBook = Book(title: "Kafka On The Shore", author: "Haruki Murakami", publicationYear: 2002)

arrayOfBooks.append(firstBook)
arrayOfBooks.append(secondBook)
arrayOfBooks.append(thirdBook)

func getFilteredBooks(_ books: [Book], _ year: Int) -> [Book] {
    return books.filter { $0.publicationYear > year }
}

let filteredBooks = getFilteredBooks(arrayOfBooks, 1980)

func thirdProblem() {
    print()
    print("--------------- Third Problem ---------------")
    
    for book in filteredBooks {
        print("\(book.title) was written by \(book.author) in \(book.publicationYear).")
    }
}

/*
 შექმენით struct BankAccount, with properties როგორიცაა: holderName, accountNumber, balance. ამ ობიექტში დაამატეთ methods, დეპოზიტისა და გატანის (withdraw), დაწერეთ შესაბამისი ლოგიკა და ეცადეთ გაითვალისწინოთ სხვადასხვა ეჯ-ქეისები (edge case). მაგ. თანხის გატანისას თუ თანხა იმაზე ნაკლებია ვიდრე გვაქვს, თანხას ვერ გავიტანთ და ასე შემდეგ. print-ის მეშვეობით გამოვიტანოთ შესაბამისი შეცდომები . ამის შემდეგ შექმენით BankAccount ობიექტი და გააკეთეთ ტრანზაქციების იმიტაცია თქვენს მიერ დაწერილი მეთოდებით.
 */

struct BankAccount{
    let holderName: String
    let accountNumber: Int
    var balance: Double
    
    mutating func withdrawMoney(_ amount: Double) {
        if amount > balance  {
            print("Insufficient Funds.")
        } else if amount > 10_000 {
            print("Daily Withdrawal Limit Exceeded.")
        } else {
            balance -= amount
            print("You have successfully withdrawn $\(amount) from your account. Your Current Balance is $\(balance).")
        }
    }
    
    mutating func depositMoney(_ amount: Double) {
        if amount > 50_000 {
            print("Daily Deposit Limit Exceeded.")
        } else {
            balance += amount
            print("You have successfully deposited $\(amount) into your account. Your Current Balance is $\(balance).")
        }
    }
}

func fourthProblem() {
    print()
    print("--------------- Fourth Problem ---------------")
    
    var firstBankAccount = BankAccount(holderName: "Ana", accountNumber: 001, balance: 50000.0)
    
    firstBankAccount.withdrawMoney(200)
    firstBankAccount.depositMoney(1000)
}

/*
 შექმენით enum-ი Genre მუსიკის ჟანრის ქეისებით. ამის შემდეგ შექმენით struct Song, with properties: title, artist, duration, genre, description (computied propertie უნდა იყოს description) და publisher (lazy propertie-ად შექმენით publisher). შემდეგ შექმენით თქვენი playlist array რომელსაც Song-ებით შეავსებთ (ზოგ song-ს ჰქონდეს publisher, ზოგს არა). შექმენით function რომელსაც გადააწვდით თქვენს playlist-ს და ჟანრს, function-ს დააბრუნებინეთ მხოლოდ იმ Song-ების array, რომელიც ამ ჟანრის იქნება და შემდეგ დაა-print-ინეთ ეს Song-ები.
 */

enum Genre {
    case hipHop
    case pop
    case rock
    case rnb
}

struct Song {
    let title: String
    let artist: String
    let duration: Double
    let genre: Genre
    var description: String {
        return "Song \(title) is by \(artist) and its duration is \(duration)"
    }
    lazy var publisher: String? = nil
}

var playlist: [Song] = []
playlist.append(Song(title: "Been Away", artist: "Brent Faiyaz", duration: 3.43, genre: .rnb, publisher: "Brent Faiyaz"))
playlist.append(Song(title: "White Ferrari", artist: "Frank Ocean", duration: 4.08, genre: .rnb))
playlist.append(Song(title: "Just", artist: "Radiohead", duration: 3.54, genre: .rock, publisher: "Emi Records"))

func filterSongs(songs: [Song], genre: Genre) -> [Song] {
    return songs.filter { $0.genre == genre }
}

let rnbSongs = filterSongs(songs: playlist, genre: .rnb)

func fifthProblem() {
    print()
    print("--------------- Fifth Problem ---------------")
    for song in rnbSongs {
        print(song.title)
    }
}

firstProblem()
secondProblem()
thirdProblem()
fourthProblem()
fifthProblem()
