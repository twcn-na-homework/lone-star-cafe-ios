import UIKit

class MenuListModule {
   static func entry () -> UIViewController {
       let viewModel = MenuListViewModel()
       let vc = MenuListViewController()
       let router = MenuListRouter(host: vc)

       vc.configure(with: viewModel, router: router)
       return vc
   }
}