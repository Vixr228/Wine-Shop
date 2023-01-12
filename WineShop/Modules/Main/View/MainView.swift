import UIKit
import SnapKit

class MainView: BaseView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Palette.Fonts.semibold.withSize(20.0)
        label.text = "Привет, моя королева"
        label.textColor = R.color.textPrimary()
        
        return label
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setImage(.init(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = R.color.buttonSelected()
        button.layer.cornerRadius = 16.0
        
        return button
    }()
    
    let typePicker = TypePicker(items: [
        ReceiptType.salad,
        ReceiptType.warm,
        ReceiptType.snack,
        ReceiptType.dessert
    ])
    
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.alwaysBounceVertical = true
        
        return collectionView
    }()
    
    override func initSetup() {
        super.initSetup()
        
        backgroundColor = R.color.backgroundMain()
        
        addSubview(titleLabel)
        addSubview(addButton)
        addSubview(typePicker)
        addSubview(collectionView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20.0)
            make.left.equalToSuperview().offset(16.0)
        }
        
        addButton.snp.makeConstraints { make in
            make.top.right.equalTo(safeAreaLayoutGuide).inset(16.0)
            make.size.equalTo(32.0)
        }
        
        typePicker.snp.makeConstraints { make in
            make.top.equalTo(addButton.snp.bottom).offset(20.0)
            make.left.right.equalToSuperview().inset(16.0)
            make.height.equalTo(28.0)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(typePicker.snp.bottom).offset(16.0)
            make.left.right.bottom.equalToSuperview()
        }
    }

}
