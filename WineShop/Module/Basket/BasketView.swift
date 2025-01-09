import UIKit
import SnapKit

class BasketView: BaseView {
    
    let navBar: NavBarView = {
        let view = NavBarView()
        view.backgroundColor = R.color.background()
        let configuration = NavBarConfiguration(title: "Корзина",
                                                subtitle: nil,
                                                leftButtonImage: R.image.navigationArrow(),
                                                rightButtonImage: nil,
                                                rightButtonTitleText: "Выбрать")
        view.configure(with: configuration)
        
        return view
    }()
    
    var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = R.color.background()
        return collectionView
    }()

    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = R.color.background()
        tableView.separatorStyle = .none
//        tableView.separatorInset = UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 11);
        return tableView
    }()
    
    override func initSetup() {
        super.initSetup()
        
        backgroundColor = R.color.background()
        addSubview(navBar)
        addSubview(tableView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        navBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.height.equalTo(44)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navBar.snp.bottom).offset(23)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
    }

}
