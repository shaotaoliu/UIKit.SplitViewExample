import UIKit

class LandmarksViewController: UITableViewController {

    private let vm = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.landmarks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        var config = cell.defaultContentConfiguration()
        config.text = vm.landmarks[indexPath.row].name

        cell.contentConfiguration = config
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let navController = splitViewController?.viewControllers.last as? UINavigationController else {
            return
        }
        
        navController.popToRootViewController(animated: false)
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "LandmarkDetailViewController") as! LandmarkDetailViewController
        controller.landmark = vm.landmarks[indexPath.row]
        
        navController.pushViewController(controller, animated: true)
        
        //splitViewController?.showDetailViewController(controller, sender: self)
    }
}
