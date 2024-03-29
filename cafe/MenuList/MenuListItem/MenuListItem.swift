import UIKit
import SimpleCheckbox

class MenuListItem: UITableViewCell {
    static let ident = "menu.list.item"

    var onSelected: ((_ value: Bool) -> Void)?

    private lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "PlaceHolder"
        return label
    }()

    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .init(white: 0, alpha: 0.06)
        view.layer.cornerRadius = 10
        return view
    }()

    private lazy var checkbox: Checkbox = {
        let cb = Checkbox(frame: CGRect(x: 50, y: 50, width: 25, height: 25))
        cb.uncheckedBorderColor = .lightGray
        cb.checkedBorderColor = .lightGray
        cb.checkmarkColor = .gray
        cb.checkmarkSize = 0.6
        cb.checkmarkStyle = .tick
        return cb
    }()

    private lazy var priceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "$ 0"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.addSubview(cardView)
        cardView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.bottom.equalToSuperview().offset(-16)
            $0.height.equalTo(80)
        }

        setUpCardContent()
    }

    private func setUpCardContent() {
        cardView.addSubview(checkbox)
        checkbox.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(16)
            $0.width.equalTo(checkbox.snp.height)
            $0.width.equalTo(22)
        }

        cardView.addSubview(label)
        label.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(checkbox.snp.right).offset(16)
            $0.right.equalToSuperview().offset(-10)

        }

        cardView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-16)
            $0.centerY.equalToSuperview()
        }

        checkbox.valueChanged = { [weak self] (val: Bool) in
            self?.onSelected?(val)
        }
    }
}

extension MenuListItem: ConfigurableView {
    func configure(with vm: ViewModel, router: RouterProtocol? = nil) {
        guard
            let viewModel = vm as? MenuListItemViewModel
            else { return }
        
        label.text = viewModel.title
        priceLabel.text = viewModel.price
        checkbox.isChecked = viewModel.isChecked
    }
}
