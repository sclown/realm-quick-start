import UIKit
import ChainLayout
import RealmSwift

final class TimeDetailsViewController: UIViewController {
    
    private let info: RealmItemTime
    private let formatter = DateFormatter()
    private let labelWhen = UILabel()
    private let labelLong = UILabel()
    private let inputWhen = UITextField()
    private let inputLong = UITextField()

    init(with info: RealmItemTime) {
        self.info = info
        formatter.dateFormat = "HH:mm"
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
        inputWhen.text = formatter.string(from: info.start)
        labelLong.text = "How long:"
        inputLong.placeholder = "How long could it take"
        inputLong.borderStyle = .roundedRect
        inputLong.text = "\(info.long)"
        let stack = UIStackView(arrangedSubviews: [labelWhen, inputWhen, labelLong, inputLong])
        stack.axis = .vertical
        stack.spacing = 16
        stack.add(into: view).leading(50).trailing(50).centerY().done()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let start = formatter.date(from: inputWhen.text ?? ""),
           let long = Int(inputLong.text ?? "") {
            let realm = try! Realm()
            try! realm.write {
                info.start = start
                info.long = long
            }
        }
    }
}
