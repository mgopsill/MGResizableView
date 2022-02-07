import UIKit

final class DeviceSizeListViewController: UITableViewController {
    enum Section: Int, CaseIterable {
        case devices
        case resizable
        case reset
    }
    
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
        guard let section = Section.init(rawValue: indexPath.section) else { return cell }
        switch section {
        case .devices:
            cell.textLabel?.text = deviceSizes[indexPath.row].title
        case .resizable:
            cell.textLabel?.text = "Resize"
        case .reset:
            cell.textLabel?.text = "Reset"
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section.init(rawValue: section) else { return 0 }
        switch section {
        case .devices: return deviceSizes.count
        case .resizable, .reset: return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let section = Section.init(rawValue: indexPath.section),
              let presentingViewController = presentingViewController else { return }
        switch section {
        case .devices:
            let size = deviceSizes[indexPath.row].size
            presentingViewController.view.frame = try! makeNewFrame(for: size)
        case .resizable:
            presentingViewController.view.addResizer()
        case .reset:
            presentingViewController.view.frame = UIScreen.main.bounds
            presentingViewController.view.removeResizer()
        }
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = Section.init(rawValue: section) else { return nil }
        switch section {
        case .devices: return "Select Device Size"
        case .resizable: return "Resize"
        case .reset: return "Reset"
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        Section.allCases.count
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
