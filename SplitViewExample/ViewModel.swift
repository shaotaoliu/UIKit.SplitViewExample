import UIKit

class ViewModel {
    
    var landmarks: [Landmark] = []
    
    init() {
        load()
    }
    
    func load() {
        let file = Bundle.main.url(forResource: "landmarks", withExtension: "json")!
        let data = try! Data(contentsOf: file)
        
        landmarks = try! JSONDecoder().decode([Landmark].self, from: data)
    }
    
}

struct Landmark: Codable {
    var name: String
    var park: String
    var state: String
    var description: String
    var imageName: String
}
