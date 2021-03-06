import Cocoa

//var str = "Hello, playground"


// We begin by declaring a Struct

struct Book {
    
    var title: String
    var authorLastName: String
    var authorFirstName: String
    var readingAge: Int
    var pageCount: Int
    
}

// Then we create several Book instances

let book1 = Book.init(title: "The brain is the star", authorLastName: "Nordengen", authorFirstName: "Kaja", readingAge: 18, pageCount: 389)
let book2 = Book.init(title: "The little prince", authorLastName: "de Saint-Exupery", authorFirstName: "Antoine", readingAge: 10, pageCount: 96)
let book3 = Book.init(title: "Oh, the places you'll go", authorLastName: "Seuss", authorFirstName: "Dr", readingAge: 3, pageCount: 56)
let book4 = Book.init(title: "Goodnight Moon", authorLastName: "Wise Brown", authorFirstName: "Margaret", readingAge: 4, pageCount: 39)
let book5 = Book.init(title: "The Hobbit", authorLastName: "Tolkien", authorFirstName: "J.R.R", readingAge: 12, pageCount: 300)

// Now, create an array of book elements

let allBooks = [book1, book2, book3, book4, book5]


// Now, take it easy

// First, create a function that compares two books, and points to the book with lower reading age

// Here, the function accepts two parameters, of type Book (we have a new type, thanks to our initial structure) and returns a Bool

func compareBooks (firstBook: Book, secondBook: Book) -> Bool {

    if firstBook.readingAge <= secondBook.readingAge {
        //print ("First book reading age is smaller or equal than second book reading age")
        return true
    } else {
        //print ("Second book reading age is smaller than first book reading age.")
        return false
    }

}

/*
compareBooks(firstBook: book5, secondBook: book3) // this is one way of sorting books

 Another way --> a better way of sorting books is the following:

let sortedBooks = allBooks.sorted(by: compareBooks) // Here I am declaring a new constant that holds a copy of the array, sorted using the function which I have earlier declared
sortedBooks

 Now we have a new array, sorted by reading age

 Now, le't try a closure.
 First, I am going to copy the function bellow, and comment out the call of the function above
*/

func compareBooks (firstBook: Book, secondBook: Book) -> Bool {

    if firstBook.readingAge <= secondBook.readingAge {
        //print ("First book reading age is smaller or equal than second book reading age")
        return true
    } else {
        //print ("Second book reading age is smaller than first book reading age.")
        return false
    }

}

/*
 
 Step one: remove the function name and the keyword "func": func compareBooks
 Step two: move the parameters and return type, inside the {}
 Step three: separate the function parameters and return type, from the function code execution, by inserting the keyword "in":  { (firstBook: Book, secondBook: Book) -> Bool in ...}

*/

{ (firstBook: Book, secondBook: Book) -> Bool
    in
    if firstBook.readingAge <= secondBook.readingAge {
        //print ("First book reading age is smaller or equal than second book reading age")
        return true
    } else {
        //print ("Second book reading age is smaller than first book reading age.")
        return false
    }

}

/* Now, swift is complaining that, the Closure is unused. Written like this, the closure isn't doing anything

The point of writing a closure, is that you want to pass it.
 So what you need to do is, to cut the entire code between the { } and paste it into the field, where you were calling the initial sorting function:
 */

let sortedBooks = allBooks.sorted(by: { (firstBook: Book, secondBook: Book) -> Bool
    in
    if firstBook.readingAge <= secondBook.readingAge {
        return true
    } else {
        return false
    }
    
})
sortedBooks

//  This closure is now the argument, into the sorted(by ..) method!

// But this is way to verbose...way too much code going on here!


/*
 
 Because this closer is written in a context where, it must have certain parameters and a certain return type, you can just delete this line:
 (firstBook: Book, secondBook: Book) -> Bool , including the "in" keyword.
 
 
 Next, since you're using a piece of code that takes by default certain parameters, Swift has already given a name for those parameters...that means the "firstBook" and "secondBook" are redundand.
 
 So you can just replace the names with $0 and $1
 
 */

let sortedBooks = allBooks.sorted(by: { $0.readingAge <= $1.readingAge {
        return true
    } else {
        return false
    }
})

/*
 
 Because this sorting method takes as an argument of type :book, all the properties of the structure are included.
 
 Now, when a closure is the final or the only argument to a method call, (and this closure is the only argument to this method call) you can take the closure expression and place it outside of the following closed paranthesis, like you see in the case bellow:
 
 */

let sortedBooks = allBooks.sorted(by: ) { $0.readingAge <= $1.readingAge {
 return true
 } else {
 return false
 }
 }

/*
 
 This is called: trailing closure, and is basically a closure that it has been written outside of the paranthesis ( ) for ease of readability.
 
 Now if this trailing closure is the only argument to this method call, then these paranthesis are kind of redundand as well. You can just write the closure this way:
 
 allBooks.sorted{ $0.readingAge <= $1.readingAge { ... }}
 
 Now, since we are comparing 2 arguments, the entire "if / else" block of code is redundand because the comparison of the method itself will return true or false, if one argument is smaller than the other.
 
 So the entire if / else statement, can be deleted. And because the closure is down to a single line... the "return" keyword can be deleted as well, because the closure returns something, without me needing to type the keyword "return".
 
 */

// And here's the final version of the closure:
let sortedBooks2 = allBooks.sorted { $0.readingAge <= $1.readingAge }

// You can no sort the array based on other criterias
let sortedBooks3 = allBooks.sorted { $0.pageCount <= $1.pageCount }
let sortedBooks4 = allBooks.sorted { $0.authorLastName < $1.authorLastName }

