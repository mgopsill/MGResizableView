import UIKit

final class ResizerView: UIView {
    private let viewToResize: UIView
    private let startingFrame: CGRect
    private let slider = UISlider()

    init(viewToResize: UIView) {
        self.viewToResize = viewToResize
        self.startingFrame = viewToResize.frame
        super.init(frame: .zero)
                
        slider.backgroundColor = UIColor(white: 0, alpha: 0.1)
        slider.layer.cornerRadius = 10
        slider.place(on: self).pin(.allEdges)
        slider.addTarget(self, action: #selector(didChangeHeight), for: .valueChanged)
        slider.minimumValue = 50
        slider.maximumValue = Float(startingFrame.height)
        slider.value = Float(startingFrame.height)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    @objc private func didChangeHeight() {
        let height = CGFloat(slider.value)
        let width = height * CGFloat(startingFrame.width / startingFrame.height)
        let newX = (startingFrame.width - width) / 2
        let newY = (startingFrame.height - height) / 2
        viewToResize.frame = CGRect(origin: CGPoint(x: newX, y: newY),
                                    size: CGSize(width: width, height: height))
    }
}

extension UIView {
    func addResizer() {
        let slider = ResizerView(viewToResize: self)
        addSubview(slider)
        slider.place(on: self).pin(.centerX, .centerY, .fixedWidth(200))
    }
    
    func removeResizer() {
        subviews.compactMap { $0 as? ResizerView }.forEach { $0.removeFromSuperview() }
    }
}
