import UIKit
import SwiftUI
import Combine

final class DiscountListController: UIViewController {
    weak var delegate: DiscountTypeSelectOutput? = nil
    private var viewModel: DiscountCodeListViewModel
    private var bag: Set<AnyCancellable> = []

    init(viewModel: DiscountCodeListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let controller = UIHostingController(rootView: DiscountCodeList(viewModel: self.viewModel))
        addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controller.view)
        controller.didMove(toParent: self)
        
        controller.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        viewModel.$selectedType.sink { [weak self] newValue in
            self?.delegate?.onSelectChanged(
                discount: self?.viewModel.code,
                type: newValue
            )
            
        }.store(in: &bag)
    }
}

extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}
