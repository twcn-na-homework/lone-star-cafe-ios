
import UIKit
import SnapKit

class MenuListViewController: UIViewController {
    
    var didUpdateConstrains = false
    
    var fixedView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .red
        tableView.register(MenuListItem.self, forCellReuseIdentifier: MenuListItem.ident)
        return tableView
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    override func updateViewConstraints() {
        if (!didUpdateConstrains) {
            didUpdateConstrains = true
            fixedView.snp.makeConstraints {
                $0.height.equalTo(70)
                $0.left.equalToSuperview()
                $0.right.equalToSuperview()
                $0.bottom.equalToSuperview()
            }
                
            tableView.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.left.equalToSuperview()
                $0.right.equalToSuperview()
                $0.bottom.equalTo(fixedView.snp.top).offset(-20)
            }
        }
        
        super.updateViewConstraints()
    }

    func setupUI() {
        view.addSubview(tableView)
        view.addSubview(fixedView)
        view.setNeedsUpdateConstraints()
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets.init(top: 20, left: 0, bottom: 0, right: 0)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
}

extension MenuListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: MenuListItem.ident, for: indexPath)
    }
}

// Update View Modal
extension MenuListViewController {
    
}

