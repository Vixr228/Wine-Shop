import UIKit
import ImageSlideshow
protocol MainPageViewInput: AnyObject {
    
}

class MainPageViewController: BaseViewController<MainPageView> {
    
    var output: MainPageViewOutput!
    var dataProvider = DataProvider()
    var wineData = [WineInfo]()
    var images = [UIImageView]()
    let simpleWineCardHeight = 150.0
    let wineCardHeight = 250.0
    let sliderHeight = 168.0
    let firstSectionHeader = "Новый вкус"
    let secondSectionHeader = "Народный выбор"
    let headerHeight = 49.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewDidLoad()
        
        mainView.collectionViewStatic.delegate = self
        mainView.collectionViewStatic.dataSource = self
        mainView.collectionViewStatic.register(SimpleWineCell.self, forCellWithReuseIdentifier: SimpleWineCell.description())
        mainView.collectionViewStatic.register(WineCell.self, forCellWithReuseIdentifier: WineCell.description())
        mainView.collectionViewStatic.register(SliderCell.self, forCellWithReuseIdentifier: SliderCell.description())
        mainView.collectionViewStatic.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifire)
        
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
        switch indexPath.section {
            case 0:
                return CGSize(width: width, height: sliderHeight)
            case 1:
                return CGSize(width: (width - CGFloat(space) * 2) / 3, height: simpleWineCardHeight)
            case 2:
                return CGSize(width: (width - CGFloat(space)) / 2, height: wineCardHeight)
            default:
                return CGSize(width: 0, height: 0)
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
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(section)
        
        wineData = dataProvider.getWines()
        switch section {
            case 0: return 1
            case 1: return 3
            case 2: return wineData.count
            default: return 0
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifire, for: indexPath) as! HeaderCollectionReusableView
            
            headerView.configure()
            
            if indexPath.section == 1 {
                headerView.label.text = firstSectionHeader
            } else if indexPath.section == 2 {
                headerView.label.text = secondSectionHeader
            }
            
            return headerView
            
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            //no header
            return CGSize(width: 0, height: 0)
        }
        return CGSize(width: view.frame.size.width, height: headerHeight)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        wineData = dataProvider.getWines()
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SliderCell.description(), for: indexPath) as! SliderCell
            
            cell.slider.setImageInputs([
                ImageSource(image: R.image.wineHouseImage()!),
                ImageSource(image: R.image.sliderImage()!),
                ImageSource(image: R.image.sliderImage()!)
                
            ])
            return cell
        } else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SimpleWineCell.description(), for: indexPath) as! SimpleWineCell
            
            let wine = wineData[indexPath.row]
            
            cell.wineLabel.text = wine.name
            cell.fromLabel.text = wine.country
            cell.wineImage.image = wine.image
            cell.priceLabel.text = "\(String(wine.price!)) ₽"
            
            return cell
        } else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WineCell.description(), for: indexPath) as! WineCell
            
            
            let wine = wineData[indexPath.row]
            
            cell.wineLabel.text = wine.name
            cell.fromLabel.text = wine.country
            cell.wineImage.image = wine.image
            cell.priceLabel.text = "\(String(wine.price!)) ₽"
            cell.desription.text = "\(wine.colour!) \(wine.sugar!) вино,\n\(wine.grapeType!), \(String(wine.alcoStrength!))%"
            
            return cell
        }
        
        //TODO что возвращать
        return UICollectionViewCell()
    }
    
}
