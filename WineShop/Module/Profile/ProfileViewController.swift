import UIKit

protocol ProfileViewInput: AnyObject {
    
}

class ProfileViewController: BaseViewController<ProfileView> {
    
    var output: ProfileViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewDidLoad()
    }
    
}

extension ProfileViewController: ProfileViewInput {
    
}
