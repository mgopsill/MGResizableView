import UIKit

final class ResizableViewViewController: UIViewController {
    
    private let widthSlider = UISlider()
    private let heightSlider = UISlider()
    private let resizableView = UIView()
    
    private lazy var widthConstraint = resizableView.widthAnchor.constraint(equalToConstant: view.bounds.width)
    private lazy var heightConstraint = resizableView.heightAnchor.constraint(equalToConstant: view.bounds.height - 62)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        
        resizableView.translatesAutoresizingMaskIntoConstraints = false
        resizableView.backgroundColor = .red
        
        view.addSubview(resizableView)
        resizableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        resizableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        widthConstraint.isActive = true
        heightConstraint.isActive = true
        
        widthSlider.translatesAutoresizingMaskIntoConstraints = false
        widthSlider.backgroundColor = .systemBlue
        view.addSubview(widthSlider)
        widthSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        widthSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        widthSlider.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        widthSlider.minimumValue = 40
        widthSlider.maximumValue = Float(view.bounds.width)
        widthSlider.addTarget(self, action: #selector(widthDidChange), for: .valueChanged)
        widthSlider.value = Float(view.bounds.width)
        
        heightSlider.translatesAutoresizingMaskIntoConstraints = false
        heightSlider.backgroundColor = .systemCyan
        view.addSubview(heightSlider)
        heightSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        heightSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        heightSlider.bottomAnchor.constraint(equalTo: widthSlider.topAnchor).isActive = true
        heightSlider.minimumValue = 40
        heightSlider.maximumValue = Float(view.bounds.height - 62)
        heightSlider.addTarget(self, action: #selector(heightDidChange), for: .valueChanged)
        heightSlider.value = Float(view.bounds.height - 62)
    }
    
    @objc func widthDidChange() {
        print("width \(widthSlider.value)")
        widthConstraint.constant = CGFloat(widthSlider.value)
    }
    
    @objc func heightDidChange() {
        print("heightSlider \(heightSlider.value)")
        heightConstraint.constant = CGFloat(heightSlider.value)
    }
}
