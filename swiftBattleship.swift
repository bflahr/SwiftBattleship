var header = [" ", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
var rowA = ["A", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*"]
var rowB = ["B", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*"]
var rowC = ["C", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*"]
var rowD = ["D", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*"]
var rowE = ["E", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*"]
var rowF = ["F", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*"]
var rowG = ["G", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*"]
var rowH = ["H", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*"]
var rowI = ["I", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*"]
var rowJ = ["J", "*", "*", "*", "*", "*", "*", "*", "*", "*", "*"]


public class Ship 
{
  public var size : Int
  public var symbol : String
  public var spots : [String] = []
  public var hits : Int
  public var type : String

  public init(size: Int, symbol : String, spots : [String], hits : Int, type : String) {
          self.size = size
          self.symbol = symbol
          self.spots = spots
          self.hits = hits
          self.type = type
  } 
}

public class Tugboat : Ship
{
  public override init(size: Int, symbol : String, spots : [String], hits : Int, type : String) {
          super.init( size : size, symbol : symbol, spots : spots, hits : hits, type : type)
  }  
}

public class Submarine : Ship
{
  public override init(size: Int, symbol : String, spots : [String], hits : Int, type: String) {
          super.init( size : size, symbol : symbol, spots : spots, hits : hits, type : type)
  }
}

public class AircraftCarrier : Ship
{
  public override init(size: Int, symbol : String, spots : [String], hits : Int, type : String) {
          super.init( size : size, symbol : symbol, spots : spots, hits : hits, type : type)
  }
}


var tugboat1 : Tugboat = Tugboat(size : 2, symbol : "\u{04DC}", spots : ["a1", "a2"],  hits : 0, type : "tugboat")

var tugboat2 : Tugboat = Tugboat(size : 2, symbol : "\u{04DC}", spots : ["a5", "b5"],  hits : 0, type : "tugboat")

var tugboat3 : Tugboat = Tugboat(size : 2, symbol : "\u{04DC}", spots : ["e8", "e9"],  hits : 0, type : "tugboat")

var sub1 : Submarine = Submarine(size : 3, symbol : "\u{04E8}", spots : ["g2", "g3", "g4"],  hits : 0, type : "submarine")

var air1 : AircraftCarrier = AircraftCarrier(size : 4, symbol : "\u{0428}", spots : ["f8", "g8", "h8", "i8"],  hits : 0, type : "aircraftCarrier")

var rGuess : String = ""
var cGuess : String = ""
var isRowUpdated : Bool = false
var userGuess : String = ""
var totalHits : Int = 0
var dupGuess : Bool = false

public func printBoard() {
  print(header.joined(separator: " "))
  print(rowA.joined(separator: " "))
  print(rowB.joined(separator: " "))
  print(rowC.joined(separator: " "))
  print(rowD.joined(separator: " "))
  print(rowE.joined(separator: " "))
  print(rowF.joined(separator: " "))
  print(rowG.joined(separator: " "))
  print(rowH.joined(separator: " "))
  print(rowI.joined(separator: " "))
  print(rowJ.joined(separator: " "))

  rowGuess()
}

public func rowGuess() {
  isRowUpdated = false
print("Please guess a row (A-J):")
  rGuess = readLine() ?? ""

        switch(rGuess) {
            case "a","A" : colGuess()
            case "b","B" : colGuess()
            case "c", "C" : colGuess()
            case "d", "D" : colGuess()
            case "e", "E" : colGuess()
            case "f", "F" : colGuess()
            case "g", "G" : colGuess()
            case "h", "H" : colGuess()
            case "i", "I" : colGuess()
            case "j", "J" : colGuess()
    default : print("Guess must be between A and J");
            rowGuess();       
  }
  
}

public func colGuess() {
print("Please guess a column (1-10):")
  cGuess = readLine() ?? ""
    
  switch(cGuess) {
    case "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" : checkGuess()
    default: print("Guess must be between 1 and 10");
    colGuess();
  }
}

public func sameGuess() -> Bool
{
  dupGuess = false
	switch(rGuess)
	{
		case "a", "A":
		if(rowA[Int(cGuess)!] != "*")
		{
			dupGuess = true
		}
		case "b", "B":
		if(rowB[Int(cGuess)!] != "*")
		{
			dupGuess = true
		}
		case "c", "C":
		if(rowC[Int(cGuess)!] != "*")
		{
			dupGuess = true
		}
		case "d", "D":
		if(rowD[Int(cGuess)!] != "*")
		{
			dupGuess = true
		}
		case "e", "E":
		if(rowE[Int(cGuess)!] != "*")
		{
			dupGuess = true
		}
		case "f", "F":
		if(rowF[Int(cGuess)!] != "*")
		{
			dupGuess = true
		}
		case "g", "G":
		if(rowG[Int(cGuess)!] != "*")
		{
			dupGuess = true
		}
		case "h", "H":
		if(rowH[Int(cGuess)!] != "*")
		{
			dupGuess = true
		}
		case "i", "I":
		if(rowI[Int(cGuess)!] != "*")
		{
			dupGuess = true
		}
		case "j", "hJ":
		if(rowJ[Int(cGuess)!] != "*")
		{
			dupGuess = true
		}
		default : break
	}

  return dupGuess
}

public func checkGuess() {
userGuess = rGuess.lowercased() + cGuess

  if(sameGuess())
  {
   print("You already made that guess")
    rowGuess()
  }
else
  {
    for spots in tugboat1.spots 
    {
              if(userGuess == spots) 
              {
                totalHits+=1
                tugboat1.hits+=1
                if(tugboat1.hits == 2) 
		{
			print("\n")
			print("Sank tugboat 1!")
                } 
		else
		{
			print("\n")
			print("Direct Hit!")
                 }
		isRowUpdated = true
		updateRow(type: tugboat1.type)       
              } 
    }

   for spots in tugboat2.spots 
    {
              if(userGuess == spots) 
              {
		totalHits+=1
		tugboat2.hits+=1
		if(tugboat2.hits == 2) 
		{
			print("\n")
			print("Sank tugboat 2!")
                 } 
		else 
		{
			print("\n")
			print("Direct Hit!")
                 }
		isRowUpdated = true
		updateRow(type: tugboat2.type)             
              } 
    }

   for spots in tugboat3.spots 
    {
              if(userGuess == spots) 
              {
		totalHits+=1
		tugboat3.hits+=1
		if(tugboat3.hits == 2) 
		{
			print("\n")
			print("Sank tugboat 3!")
                  } 
		else 
		{
			print("\n")
			print("Direct Hit!")
		}
		isRowUpdated = true
		updateRow(type: tugboat3.type)             
              } 
    }

   for spots in sub1.spots 
    {
              if(userGuess == spots) 
              {
		totalHits+=1
		sub1.hits+=1
		if(sub1.hits == 3) 
		{
			print("\n")
			print("Sank the submarine!")
                  } 
		else 
		{
			print("\n")
			print("Direct Hit!")
		}
		isRowUpdated = true
		updateRow(type: sub1.type)             
              } 
    }

   for spots in air1.spots 
    {
              if(userGuess == spots) 
              {
		totalHits+=1
		air1.hits+=1
		if(air1.hits == 4) 
		{
			print("\n")
			print("Sank the aircraft!")
		} 
		else 
		{
			print("\n")
			print("Direct Hit!")
                  }
		isRowUpdated = true
		updateRow(type: air1.type)             
              } 
    }
  userGuess = ""
    if(!isRowUpdated)
    	{
  	  print("\n")
  	  print("You missed!")
  	  updateRow(type: "miss")      
  	}
  }
}

public func updateRow(type: String) 
{
	let intCol = Int(cGuess)
	switch(rGuess) {
            case "a","A" : 
		if(type == "tugboat")
		{
               		rowA[intCol!] = tugboat1.symbol
		}
		if(type == "submarine")
              	{
               		rowA[intCol!] = sub1.symbol
              	}
   		if(type == "air")
              	{
               		rowA[intCol!] = air1.symbol
              	}
   		if(type == "miss")
              	{
               		rowA[intCol!] = " "
              	}
            case "b","B" :
                if(type == "tugboat")
              	{
               		rowB[intCol!] = tugboat1.symbol
              	}
   		if(type == "submarine")
             	 {
               		rowB[intCol!] = sub1.symbol
             	 }
   		if(type == "aircraftCarrier")
              	{
               		rowB[intCol!] = air1.symbol
              	}
   		if(type == "miss")
              	{
              		 rowB[intCol!] = " "
              	}
            case "c", "C" :   
		if(type == "tugboat")
              	{
               		rowC[intCol!] = tugboat1.symbol
              	}
   		if(type == "submarine")
              	{
               		rowC[intCol!] = sub1.symbol
              	}
   		if(type == "aircraftCarrier")
              	{
              		 rowC[intCol!] = air1.symbol
              	}
   		if(type == "miss")
              	{
               		rowC[intCol!] = " "
              	}
            case "d", "D" : 
		if(type == "tugboat")
              	{
               		rowD[intCol!] = tugboat1.symbol
              	}
   		if(type == "submarine")
              	{
               		rowD[intCol!] = sub1.symbol
              	}
  		 if(type == "aircraftCarrier")
             	 {
               		rowD[intCol!] = air1.symbol
              	}
   		if(type == "miss")
              	{
               		rowD[intCol!] = " "
              	} 
            case "e", "E" : 
		if(type == "tugboat")
              	{
               		rowE[intCol!] = tugboat1.symbol
              	}
  		 if(type == "submarine")
             	 {
               		rowE[intCol!] = sub1.symbol
              	}
  		 if(type == "aircraftCarrier")
              	{
               		rowE[intCol!] = air1.symbol
              	}
   		if(type == "miss")
              	{
               		rowE[intCol!] = " "
              	}
            case "f", "F" : 
		if(type == "tugboat")
              	{
               		rowF[intCol!] = tugboat1.symbol
              	}
   		if(type == "submarine")
              	{
               		rowF[intCol!] = sub1.symbol
              	}
   		if(type == "aircraftCarrier")
              	{
               		rowF[intCol!] = air1.symbol
              	}
   		if(type == "miss")
             	 {
               		rowF[intCol!] = " "
              		}
            case "g", "G" : 
		if(type == "tugboat")
              	{
               		rowG[intCol!] = tugboat1.symbol
              	}
   		if(type == "submarine")
              	{
              		rowG[intCol!] = sub1.symbol
              	}
   		if(type == "aircraftCarrier")
             	{
               		rowG[intCol!] = air1.symbol
              	}
   		if(type == "miss")
              	{
               		rowG[intCol!] = " "
              	}
            case "h", "H" : 
		if(type == "tugboat")
              	{
               		rowH[intCol!] = tugboat1.symbol
              	}
   		if(type == "submarine")
              	{
               		rowH[intCol!] = sub1.symbol
              	}
   		if(type == "aircraftCarrier")
              	{
               		rowH[intCol!] = air1.symbol
              	}
   		if(type == "miss")
              	{
               		rowH[intCol!] = " "
              	}
            case "i", "I" : 
		if(type == "tugboat")
              	{
               		rowI[intCol!] = tugboat1.symbol
              	}
   		if(type == "submarine")
              	{
               		rowI[intCol!] = sub1.symbol
              	}
   		if(type == "aircraftCarrier")
              	{
               		rowI[intCol!] = air1.symbol
              	}
   		if(type == "miss")
              	{
               		rowI[intCol!] = " "
              	}	
            case "j", "J" : 
		if(type == "tugboat")
              	{
               		rowJ[intCol!] = tugboat1.symbol
              	}
   		if(type == "submarine")
              	{
               		rowJ[intCol!] = sub1.symbol
              	}
   		if(type == "aircraftCarrier")
              	{
               		rowJ[intCol!] = air1.symbol
              	}
   		if(type == "miss")
              	{
               		rowJ[intCol!] = " "
              	}
            default : break        
  }

totalHits == 13 ? endGame() : printBoard()

  
}

public func endGame() {
  print("\n")
  print("YOU WON")
  print("Would you like to play again? (Yes/No)")
  var playAgain = readLine() ?? ""
  
  playAgain = playAgain.lowercased()
  if playAgain == "yes" {

         resetGame()              
  }
  if playAgain == "no" {
        print("Thanks for playing!")
  }
  else {
        print("Please enter Yes or No only")
        endGame()
  }
}

public func resetGame() {
  totalHits = 0
  tugboat1.hits = 0
  tugboat2.hits = 0
  tugboat3.hits = 0
  air1.hits = 0
  sub1.hits = 0
    rowA = ["A", "*", "*", "*", "*", "*", "*", "*", "*", "*"]
    rowB = ["B", "*", "*", "*", "*", "*", "*", "*", "*", "*"]
    rowC = ["C", "*", "*", "*", "*", "*", "*", "*", "*", "*"]
    rowD = ["D", "*", "*", "*", "*", "*", "*", "*", "*", "*"]
    rowE = ["E", "*", "*", "*", "*", "*", "*", "*", "*", "*"]
    rowF = ["F", "*", "*", "*", "*", "*", "*", "*", "*", "*"]
    rowG = ["G", "*", "*", "*", "*", "*", "*", "*", "*", "*"]
    rowH = ["H", "*", "*", "*", "*", "*", "*", "*", "*", "*"]
    rowI = ["I", "*", "*", "*", "*", "*", "*", "*", "*", "*"]
    rowJ = ["J", "*", "*", "*", "*", "*", "*", "*", "*", "*"]
  printBoard()
}

print("Welcome to Battle Ship")
print(printBoard())

