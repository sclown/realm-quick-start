import UIKit
import ChainLayout
import RealmSwift

final class TimeDetailsViewController: UIViewController {
    
    private let labelWhen = UILabel()
    private let labelLong = UILabel()
    private let inputWhen = UITextField()
    private let inputLong = UITextField()

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Time details"
        view.backgroundColor = .white
        
        labelWhen.text = "When:"
        inputWhen.placeholder = "Time of the event"
        inputWhen.borderStyle = .roundedRect
        labelLong.text = "How long:"
        inputLong.placeholder = "How long could it take"
        inputLong.borderStyle = .roundedRect
        let stack = UIStackView(arrangedSubviews: [labelWhen, inputWhen, labelLong, inputLong])
        stack.axis = .vertical
        stack.spacing = 16
        stack.add(into: view).leading(50).trailing(50).centerY().done()
    }
}
