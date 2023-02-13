import UIKit
import ImageSlideshow
import SnapKit

class MainPageView: BaseView {
    
    private let newTasteLabel: UILabel = {
        let label = UILabel()
        label.text = "Новый вкус"
        label.font = R.font.montserratRegular(size: 16)
        
        return label
    }()
    
    private let peopleChoiceLabel: UILabel = {
        let label = UILabel()
        label.text = "Народный выбор"
        label.font = R.font.montserratRegular(size: 16)
        
        return label
    }()
    
    private let wineLabel: UILabel = {
        let label = UILabel()
        label.text = "Wine House"
        label.font = R.font.philosopherRegular(size: 40)
        
        return label
    }()
    
    private let smalLabel: UILabel = {
        let label = UILabel()
        label.text = "est. 1920"
        label.font = R.font.montserratRegular(size: 12)
        
        return label
        
    }()
    
    let centralImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.mainPageBackgroundCentral()
        imageView.alpha = 0.5
        
        return imageView
    }()
    
    let rightImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.mainPageBackgroundRight()
        
        return imageView
    }()
    
    let leftImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.mainPageBackgroundLeft()
        
        return imageView
    }()
    
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
    
    public var slider: ImageSlideshow = {
        let slider = ImageSlideshow()
        slider.backgroundColor = R.color.background()
        
        return slider
    }()
    
    override func initSetup() {
        super.initSetup()
        
        backgroundColor = R.color.background()
        addSubview(searchBar)
        
        addSubview(collectionViewStatic)
        
        addSubview(slider)
        
        
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        slider.snp.makeConstraints { make in
            make.height.equalTo(168)
            make.top.equalTo(searchBar.snp.bottom).offset(16)
            make.right.left.equalToSuperview()
        }
        
        collectionViewStatic.snp.makeConstraints { make in
            make.top.equalTo(slider.snp.bottom).offset(16)
            //make.height.equalTo(150)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        searchBar.searchTextField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        searchBar.snp.makeConstraints { make in
            //  make.width.equalTo(343)
            make.height.equalTo(44)
            make.top.equalToSuperview().offset(60)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
    }
    
}
