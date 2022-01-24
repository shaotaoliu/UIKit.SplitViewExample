import UIKit

class LandmarkDetailViewController: UIViewController {
    
    @IBOutlet weak var imageLandmark: UIImageView!
    @IBOutlet weak var textLandmark: UITextView!
    var landmark: Landmark!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let landmark = landmark {
            title = landmark.name
            imageLandmark.image = UIImage(named: landmark.imageName)
            textLandmark.text = landmark.description
        }
    }

}
