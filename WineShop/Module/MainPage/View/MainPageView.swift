import UIKit
import SnapKit

class MainPageView: BaseView {
    
    var collectionViewStatic: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = R.color.background()
        return collectionView
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
    
    
    override func initSetup() {
        super.initSetup()
        
        backgroundColor = R.color.background()
        addSubview(searchBar)
        
        addSubview(collectionViewStatic)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        collectionViewStatic.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(16)
            //make.height.equalTo(150)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        searchBar.searchTextField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        searchBar.snp.makeConstraints { make in           
            make.height.equalTo(44)
            make.top.equalToSuperview().offset(60)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
    }
    
}
