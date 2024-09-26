import Foundation

var shoppingList: [String] = []

func addItem() {
    print("Enter item to add:")
    if let item = readLine(), !item.isEmpty {
        shoppingList.append(item)
        print("\(item) has been added to the list.")
    } else {
        print("Invalid input")
    }
}

func removeItem() {
    print("Enter item to remove:")
    if let item = readLine(), !item.isEmpty {
        if let index = shoppingList.firstIndex(of: item) {
            shoppingList.remove(at: index)
            print("\(item) has been removed from the list.")
        } else {
            print("\(item) is not in the list.")
        }
    } else {
        print("Invalid input. No item removed.")
    }
}

func displayList() {
    if shoppingList.isEmpty {
        print("Your shopping list is empty.")
    } else {
        print("Your shopping list:")
        for (index, item) in shoppingList.enumerated() {
            print("\(index + 1). \(item)")
        }
    }
}

func mainMenu() {
    while true {
        print("\nShopping List Manager")
        print("1. Add item")
        print("2. Remove item")
        print("3. Display list")
        print("4. Exit")
        print("Enter your choice:")
        
        if let choice = readLine() {
            switch choice {
            case "1":
                addItem()
            case "2":
                removeItem()
            case "3":
                displayList()
            case "4":
                print("Goodbye!")
                return
            default:
                print("Invalid choice. Please try again.")
            }
        }
    }
}

mainMenu()