import UIKit

class TotalPreviewView: UIView {
    var numberOfItemsLabel: UILabel = {
        let label = UILabel()
        label.text = "0 Items"
        return label
    }()
    
    var checkButton: UIButton = {
        let btn = UIButton(frame: CGRect.init(x: 0, y: 0, width: 20, height: 20))
        btn.setTitle("Check", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI()  {
        addSubview(numberOfItemsLabel)
        numberOfItemsLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(16)
        }
        
        addSubview(checkButton)
        checkButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-16)
            $0.width.equalTo(80)
            $0.height.equalTo(60)
        }
    }
}

extension TotalPreviewView: View {
    func configure(with vm: ViewModel) {
        guard let viewModel = vm as? TotalPreviewViewModel else {
            return
        }
        
        numberOfItemsLabel.text = "\(viewModel.numberOfItems) Items"
    }
}

