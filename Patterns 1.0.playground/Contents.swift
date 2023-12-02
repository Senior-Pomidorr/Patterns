import UIKit

//MARK: - Factory. Порождающий паттерн.

enum ClothesType {
    case head
    case shoes
    case jeans
}

protocol Clothes {
    var title: String { get }
    var type: ClothesType { get }
    var color: String { get }
    
    func putOn()
}

final class Hat: Clothes {
    var title: String
    var type: ClothesType = .head
    var color: String
    
    init(title: String = .init(), color: String = .init()) {
        self.title = "Шляпа"
        self.color = "Черная"
    }
    
    func putOn() {
        print("Надета \(color) \(title)")
    }
}

final class Shoes: Clothes {
    var title: String = "Ботинки"
    var type: ClothesType = .shoes
    var color: String = "белые"
    
    func putOn() {
        print("Надета \(color) \(title)")
    }
}

final class Jeans: Clothes {
    var title: String = "Джинсы"
    var type: ClothesType = .jeans
    var color: String = "Синие"
    func putOn() {
        print("Надета \(color) \(title)")
    }
    
    
}

//Создаем фабрику
final class ClothesFactory {
    static let shared = ClothesFactory()
    private init() {}
    
    func makeClothes(type: ClothesType) -> Clothes {
        switch type {
        case .head:
            return Hat()
        case .shoes:
            return Shoes()
        case .jeans:
            return Jeans()
        }
    }
}

private let hat = ClothesFactory.shared.makeClothes(type: .head)
private let shoes = ClothesFactory.shared.makeClothes(type: .shoes)
private let hat2 = ClothesFactory.shared.makeClothes(type: .head)
private let jeans = ClothesFactory.shared.makeClothes(type: .jeans)

private var clothes: [Clothes] = [hat, shoes, hat, jeans]

clothes.forEach({$0.putOn()})

//==================================================================


