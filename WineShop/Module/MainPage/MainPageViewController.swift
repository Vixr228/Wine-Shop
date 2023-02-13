import UIKit
import ImageSlideshow
protocol MainPageViewInput: AnyObject {
    
}

class MainPageViewController: BaseViewController<MainPageView> {
    
    var output: MainPageViewOutput!
    var dataProvider = DataProvider()
    var wineData = [WineInfo]()
    var images = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewDidLoad()
        
        mainView.collectionViewStatic.delegate = self
        mainView.collectionViewStatic.dataSource = self
        mainView.collectionViewStatic.register(SimpleWineCell.self, forCellWithReuseIdentifier: SimpleWineCell.description())
        mainView.collectionViewStatic.register(WineCell.self, forCellWithReuseIdentifier: WineCell.description())
        mainView.collectionViewStatic.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifire)
        
        
        mainView.slider.setImageInputs([
            ImageSource(image: UIImage(named: "mainPageBackgroundCentral")!),
            ImageSource(image: UIImage(named: "mainPageBackgroundLeft")!),
            ImageSource(image: UIImage(named: "mainPageBackgroundLeft")!)
            
        ])
        
       
    }
    
}

extension MainPageViewController: MainPageViewInput {
    
}

extension MainPageViewController: UICollectionViewDelegate {
    
}

extension MainPageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.size.width
        let space = 8
        if indexPath.section == 0 {
            return CGSize(width: (width - CGFloat(space) * 2) / 3, height: 150.0)
        } else {
            print("section2")
            return CGSize(width: (width - CGFloat(space)) / 2, height: 250.0)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    
}

extension MainPageViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(section)
        return section == 0 ? 3 : 10 //chage num 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifire, for: indexPath) as! HeaderCollectionReusableView
            
            headerView.configure()
            
            headerView.label.text = indexPath.section == 0 ? "Новый вкус" : "Народный выбор"
            
            return headerView
            
        default:
            
            assert(false, "Unexpected element kind")
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 49)
    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    //
    //
    //        return UIEdgeInsets(top: 13, left: 8, bottom: 16, right: 8)
    //    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        wineData = dataProvider.getWines()
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SimpleWineCell.description(), for: indexPath) as! SimpleWineCell
            
            cell.wineLabel.text = wineData[indexPath.row].name
            cell.fromLabel.text = wineData[indexPath.row].country
            cell.wineImage.image = wineData[indexPath.row].image
            cell.priceLabel.text = String(wineData[indexPath.row].price!)
            
            return cell
        } else {
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
    
    
    
    
}

//Между заголовками и карточка = 12
//Между верхней картинкой и первым заголовком = 16
//картинки сверху - слайдер
//Слайдер уходиь при скроле
