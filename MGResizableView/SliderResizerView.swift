import UIKit

final class SliderResizerView: UIView {
    private let viewToResize: UIView
    private lazy var viewToResizeHeight = viewToResize.heightAnchor.constraint(equalTo: heightAnchor)
    private lazy var viewToResizeWidth = viewToResize.widthAnchor.constraint(equalTo: widthAnchor)

    private let slider = UISlider()

    init(viewToResize: UIView) {
        self.viewToResize = viewToResize
        super.init(frame: .zero)
        
        viewToResize.clipsToBounds = true
        viewToResize.place(on: self).pin(.centerX, .centerY)
        viewToResizeHeight.isActive = true
        viewToResizeWidth.isActive = true
        
        slider.backgroundColor = UIColor(white: 0, alpha: 0.1)
        slider.layer.cornerRadius = 10
        slider.place(on: self).pin(.bottom(padding: 30), .horizontalEdges(padding: 20))
        slider.addTarget(self, action: #selector(didChangeHeight), for: .valueChanged)
        slider.minimumValue = 50
        slider.maximumValue = Float(UIScreen.currentHeight)
        slider.value = Float(UIScreen.currentHeight)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    @objc private func didChangeHeight() {
        let difference = Float(UIScreen.currentHeight) - Float(slider.value)
        viewToResizeHeight.constant = -CGFloat(difference)
        viewToResizeWidth.constant = -CGFloat(difference * UIScreen.currentAspectRatio)
    }
}

fileprivate extension UIScreen {
    static var currentHeight: CGFloat { main.bounds.height }
    static var currentWidth: CGFloat { main.bounds.width }
    static var currentAspectRatio: Float { Float(currentWidth / currentHeight) }
}
