import UIKit

final class DeviceSizeListViewController: UITableViewController {
    private let deviceSizes = Device.allCases
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
    }
}

extension DeviceSizeListViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.identifier, for: indexPath)
        cell.textLabel?.text = indexPath.section == 0 ? deviceSizes[indexPath.row].title : "Reset"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? deviceSizes.count : 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let size = deviceSizes[indexPath.row].size
            presentingViewController?.view.frame = try! makeNewFrame(for: size)
        } else {
            presentingViewController?.view.frame = UIScreen.main.bounds
        }
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        section == 0 ? "Select Device Size" : "Reset"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    private func makeNewFrame(for size: CGSize) throws -> CGRect {
        let fullScreen = UIScreen.main.bounds
        let x = makeOffset(current: fullScreen.width, new: size.width)
        let y = makeOffset(current: fullScreen.height, new: size.height)
        let origin = CGPoint(x: x, y: y)
        return CGRect(origin: origin, size: size)
    }
    
    private func makeOffset(current: CGFloat, new: CGFloat) -> CGFloat {
        (current - new) / 2
    }
}

extension UITableViewCell {
    static let identifier = "cell"
}
