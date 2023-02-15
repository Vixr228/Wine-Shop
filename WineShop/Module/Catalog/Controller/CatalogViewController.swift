import UIKit

protocol CatalogViewInput: AnyObject {
    
}

class CatalogViewController: BaseViewController<CatalogView> {
    
    var output: CatalogViewOutput!
    var dataProvider = DataProvider()
    var wineData = [WineInfo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewDidLoad()
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        
        mainView.collectionView.register(WineCell.self, forCellWithReuseIdentifier: WineCell.description())
    }
    
}

extension CatalogViewController: CatalogViewInput {
    
}

extension CatalogViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        wineData = dataProvider.getWines()
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WineCell.description(), for: indexPath) as! WineCell
        
        
        let wine = wineData[indexPath.row]
        
        cell.wineLabel.text = wine.name
        cell.fromLabel.text = wine.country
        cell.wineImage.image = wine.image
        cell.priceLabel.text = "\(String(wine.price!)) ₽"
        cell.desription.text = "\(wine.colour!) \(wine.sugar!) вино,\n\(wine.grapeType!), \(String(wine.alcoStrength!))%"
        
        return cell
    }
}


extension CatalogViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("ASDDDD")
    }
    
}

extension CatalogViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.size.width
        let space = 8
        return CGSize(width: (width - CGFloat(space)) / 2, height: 250.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
}
