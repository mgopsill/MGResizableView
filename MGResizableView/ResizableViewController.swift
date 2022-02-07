import UIKit

final class ResizableViewController: UIViewController {
    private lazy var containerView = SliderResizerView(viewToResize: viewControllerToResize.view)
    
    private let viewControllerToResize: UIViewController
    
    init(viewControllerToResize: UIViewController) {
        self.viewControllerToResize = viewControllerToResize
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(viewControllerToResize)
        viewControllerToResize.didMove(toParent: viewControllerToResize)
        
        containerView.backgroundColor = .blue
        containerView.place(on: view).pin(.allEdges)
    }
    
    deinit {
        print("deinit")
    }
}

extension ResizableViewController {
    func removeChild() -> UIViewController {
        viewControllerToResize.willMove(toParent: nil)
        viewControllerToResize.removeFromParent()
        viewControllerToResize.view.removeFromSuperview()
        return viewControllerToResize
    }
}
