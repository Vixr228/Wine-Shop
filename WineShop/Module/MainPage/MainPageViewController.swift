import UIKit

protocol MainPageViewInput: AnyObject {
    
}

class MainPageViewController: BaseViewController<MainPageView> {
    
    var output: MainPageViewOutput!
    var dataProvider = DataProvider()
    var wineData = [WineInfo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewDidLoad()
        
        mainView.collectionViewStatic.delegate = self
        mainView.collectionViewStatic.dataSource = self
        mainView.collectionViewStatic.register(WineCell.self, forCellWithReuseIdentifier: WineCell.description())
    }
    
   
    
}

extension MainPageViewController: MainPageViewInput {
    
}

extension MainPageViewController: UICollectionViewDelegate {
    
}

extension MainPageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 109, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
}

extension MainPageViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 3 : 5 //chage num 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        wineData = dataProvider.getWines()
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WineCell.description(), for: indexPath) as! WineCell
        if indexPath.section == 0 {
            cell.wineLabel.text = wineData[indexPath.row].name
            cell.fromLabel.text = wineData[indexPath.row].country
        }
        return cell
        
    }
    
    
}
