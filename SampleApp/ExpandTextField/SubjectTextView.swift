import UIKit
 
class SubjectTextView: UITextView {
    override var intrinsicContentSize: CGSize {
        if isFirstResponder {
            return sizeThatFits(CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude))
        } else {
            return CGSize(width: bounds.width, height: 30) // Single-line height when not focused
        }
    }
    override func didMoveToWindow() {
        super.didMoveToWindow()
        if window != nil {
            NotificationCenter.default.addObserver(self, selector: #selector(textDidChange), name: UITextView.textDidChangeNotification, object: self)
            NotificationCenter.default.addObserver(self, selector: #selector(editingDidBegin), name: UITextView.textDidBeginEditingNotification, object: self)
            NotificationCenter.default.addObserver(self, selector: #selector(editingDidEnd), name: UITextView.textDidEndEditingNotification, object: self)
        } else {
            NotificationCenter.default.removeObserver(self)
        }
    }
    @objc private func textDidChange() {
        invalidateIntrinsicContentSize()
        setNeedsLayout()
    }
    @objc private func editingDidBegin() {
        invalidateIntrinsicContentSize()
        setNeedsLayout()
    }
    @objc private func editingDidEnd() {
        invalidateIntrinsicContentSize()
        setNeedsLayout()
    }
}
