import UIKit

protocol TotalPreviewViewOutput: class {
    func onPayClick()
}

class TotalPreviewView: UIView {
    weak var output: TotalPreviewViewOutput?

    private lazy var numberOfItemsLabel: UILabel = {
        let label = UILabel()
        label.text = "0 Items"
        return label
    }()

    private lazy var payButton: UIButton = {
        let btn = UIButton(frame: CGRect.init(x: 0, y: 0, width: 20, height: 20))
        btn.backgroundColor = .darkGray
        btn.layer.cornerRadius = 6
        btn.setTitle("Pay", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(payButtonClicked), for: .touchUpInside)
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        addSubview(numberOfItemsLabel)
        numberOfItemsLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(16)
        }

        addSubview(payButton)
        payButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-16)
            $0.width.equalTo(100)
            $0.height.equalTo(40)
        }
    }
}

extension TotalPreviewView {
    @objc func payButtonClicked() {
        output?.onPayClick()
    }
}

extension TotalPreviewView: View {
    func configure(with vm: ViewModel, router: RouterProtocol? = nil) {
        guard let viewModel = vm as? TotalPreviewViewModel else {
            return
        }

        numberOfItemsLabel.text = "\(viewModel.numberOfItems) Items"
    }
}

