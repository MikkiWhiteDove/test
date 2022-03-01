import Foundation

/**
 The task is to implement the Shop protocol (you can do that in this file directly).
 - No database or any other storage is required, just store data in memory
 - No any smart search, use String method contains (case sensitive/insensitive - does not matter)
 – Performance optimizations for listProductsByName and listProductsByProducer are optional
 */

//struct Product: Hashable {
//    let id: String; // unique identifier
//    let name: String;
//    let producer: String;
//}

protocol Shop {
    /**
     Adds a new product object to the Shop.
     - Parameter product: product to add to the Shop
     - Returns: false if the product with same id already exists in the Shop, true – otherwise.
     */
    func addNewProduct(product: Product) -> Bool
    
    /**
     Deletes the product with the specified id from the Shop.
     - Returns: true if the product with same id existed in the Shop, false – otherwise.
     */
    func deleteProduct(id: String) -> Bool
//
//    /**
//     - Returns: 10 product names containing the specified string.
//     If there are several products with the same name, producer's name is added to product's name in the format "<producer> - <product>",
//     otherwise returns simply "<product>".
//     */
//    func listProductsByName(searchString: String) -> Set<String>
////
////    /**
////     - Returns: 10 product names whose producer contains the specified string,
////     result is ordered by producers.
////     */
//    func listProductsByProducer(searchString: String) -> [String]
}



struct Product: Hashable {
    let id: String; // unique identifier
    let name: String;
    let producer: String;
}
// TODO: your implementation goes here
class ShopImpl: Shop {
    
//    var myProd: [Product] = []
    var mySetProd: Set<Product> = []
    var mySet: Set<String> = Set()
    
    
    func addNewProduct(product: Product) -> Bool {
        if mySet.contains(product.id) {
            return false
        }
//        myProd.append(product)
        mySetProd.insert(product)
        print("Set \(mySetProd.count): \(mySetProd)")
        mySet.insert(product.id)
        return true
        
    }
    
    func deleteProduct(id: String) -> Bool {
//        print("mySetProd1:\(mySetProd.description)")
        var mySetProd: Set<Product> = []
        let i: Set<Product> = mySetProd.filter{ $0.id == id }
        if mySetProd == i && (mySetProd.count != 0) {
            mySet.remove(id)
            mySetProd.remove(i)
            return true
        }
        //            for indx in 0..<myProd.count {
        //                if (myProd[indx].id == id){
        //                    myProd.remove(at: indx)
        //                    mySet.remove(String(id))
        //                    return true
        //                }
        //            }
        return false
        
    }

//    func listProductsByName(searchString: String) -> Set<String> {
//        var myProdName: Set<String> = []
//        let name = searchString
//        var indx = 0
//        while (indx < myProd.count && myProdName.count < 10)  {
//            if myProd[indx].name.contains(name){
//                var i = 0
//                while i < myProd.count {
//                    if (myProd[indx].name == myProd[i].name && i != indx) {
//                        myProdName.insert("\(myProd[indx].producer) - \(myProd[indx].name)")
//                        break
//                    }
//                    else if (i + 1 == myProd.count && myProd[indx].name != myProd[i].name && i != indx) {
//                        myProdName.insert("\(myProd[indx].name)")
//
//                    }
//                    i += 1
//                }
//            }
//
//            indx += 1
//        }
//        return myProdName
//    }
//
//    func listProductsByProducer(searchString: String) -> [String] {
//        var myProducerName: [String] = []
//        let name = searchString
//        var indx = 0
//        var newMyProd = myProd.sorted(by: {$0.producer < $1.producer})
//        while (indx < newMyProd.count && myProducerName.count < 10)  {
//            if newMyProd[indx].producer.contains(name){
//                myProducerName.append("\(newMyProd[indx].name)")
//            }
//
//            indx += 1
//        }
//        return myProducerName
//
//
//    }
}

func test(lib: Shop) {
    assert(!lib.deleteProduct(id: "1"))
    
    assert(lib.addNewProduct(product: Product(id: "1", name: "1", producer: "Lex")))
    assert(lib.addNewProduct(product: Product(id: "2", name: "any name because we check id only", producer: "any producer")))
    assert(lib.deleteProduct(id: "1"))
    assert(lib.deleteProduct(id: "2"))
//    assert(lib.addNewProduct(product: Product(id: "3", name: "Some Product3", producer: "Some Producer2")))
//    assert(lib.addNewProduct(product: Product(id: "4", name: "Some Product1", producer: "Some Producer3")))
//    assert(lib.addNewProduct(product: Product(id: "2", name: "Some Product2", producer: "Some Producer2")))
//    assert(lib.addNewProduct(product: Product(id: "1", name: "Some Product1", producer: "Some Producer1")))
//    assert(lib.addNewProduct(product: Product(id: "5", name: "Other Product5", producer: "Other Producer4")))
//    assert(lib.addNewProduct(product: Product(id: "6", name: "Other Product6", producer: "Other Producer4")))
//    assert(lib.addNewProduct(product: Product(id: "7", name: "Other Product7", producer: "Other Producer4")))
//    assert(lib.addNewProduct(product: Product(id: "8", name: "Other Product8", producer: "Other Producer4")))
//    assert(lib.addNewProduct(product: Product(id: "9", name: "Other Product9", producer: "Other Producer4")))
//    assert(lib.addNewProduct(product: Product(id: "10", name: "Other Product10", producer: "Other Producer4")))
//    assert(lib.addNewProduct(product: Product(id: "11", name: "Other Product11", producer: "Other Producer4")))
//
//    var byNames: Set<String> = lib.listProductsByName(searchString: "Product")
//    assert(byNames.count == 10)
//
//    byNames = lib.listProductsByName(searchString: "Some Product")
//    assert(byNames.count == 4)
//    assert(byNames.contains("Some Producer3 - Some Product1"))
//    assert(byNames.contains("Some Product2"))
//    assert(byNames.contains("Some Product3"))
//    assert(!byNames.contains("Some Product1"))
//    assert(byNames.contains("Some Producer1 - Some Product1"))
//
//    var byProducer: [String] = lib.listProductsByProducer(searchString: "Producer")
//    assert(byProducer.count == 10)
//
//    byProducer = lib.listProductsByProducer(searchString: "Some Producer")
//    assert(byProducer.count == 4)
//
//    assert(byProducer[0] == "Some Product1")
//    assert(byProducer[1] == "Some Product2" || byProducer[1] == "Some Product3")
//    assert(byProducer[2] == "Some Product2" || byProducer[2] == "Some Product3")
//    assert(byProducer[3] == "Some Product1")
}
test(lib: ShopImpl())
