import UIKit
import SnapKit

class CatalogView: BaseView {
    
    let navBar: NavBarView = {
        let view = NavBarView()
        view.backgroundColor = R.color.background()
        let configuration = NavBarConfiguration(title: "Каталог",
                                                subtitle: nil,
                                                leftButtonImage: R.image.navigationArrow(),
                                                rightButtonImage: nil,
                                                rightButtonTitleText: nil)
        view.configure(with: configuration)
        
        return view
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .default
        searchBar.placeholder = "Найти вино"
        searchBar.searchTextField.borderStyle = UITextField.BorderStyle.none
        searchBar.searchTextField.backgroundColor = R.color.footer()
        searchBar.searchTextField.font = R.font.montserratRegular(size: 12)
        
        return searchBar
    }()
    
    let filtersView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.771, green: 0.771, blue: 0.771, alpha: 0.5).cgColor
        return view
    }()
    
    var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = R.color.background()
        return collectionView
    }()
    
    override func initSetup() {
        super.initSetup()
        
        backgroundColor = R.color.background()
        
        addSubview(searchBar)
        addSubview(filtersView)
        addSubview(collectionView)
        addSubview(navBar)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        navBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.height.equalTo(44)
        }
        
        searchBar.searchTextField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        searchBar.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.top.equalTo(navBar.snp.bottom).offset(23)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        filtersView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(24)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(filtersView.snp.bottom).offset(16)
            //make.height.equalTo(150)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
    }
    
}
