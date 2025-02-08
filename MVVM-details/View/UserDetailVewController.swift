//
//  UserDetailVewController.swift
//  MVVM-details
//
//  Created by Ahmet Cemil on 8.02.2025.
//
import UIKit

class UserDetailViewController: UIViewController {
    
    
//MARK: Outlets
    
    // Card outlets
    @IBOutlet weak var contactInfoView: UIView!
    @IBOutlet weak var addressInfoView: UIView!
    @IBOutlet weak var companyInfoView: UIView!
    
    
    //Contact outlets
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    
    //Address outlets
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var suiteLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var zipcodeLabel: UILabel!
    
    //Company outlets
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyCatchPhraseLabel: UILabel!
    @IBOutlet weak var companyBsLabel: UILabel!
    
    // Data passed from the previous view controller
    var selectedUser: UserData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        // Apply the corner radius and shadow
        applyCardStyle(view: contactInfoView)
        applyCardStyle(view: addressInfoView)
        applyCardStyle(view: companyInfoView)

        // Update UI elements with data
        if let user = selectedUser {
            self.navigationItem.title = user.name
            emailLabel.text = "E-Mail \(user.email)"
            phoneLabel.text = "Phone: \(user.phone)"
            websiteLabel.text = "Website: \(user.website)"
            
            streetLabel.text = "Street: \(user.address.street)"
            suiteLabel.text = "Suite: \(user.address.suite)"
            cityLabel.text = "City: \(user.address.city)"
            zipcodeLabel.text = "Zipcode: \(user.address.zipcode)"

            companyNameLabel.text = "Company Name: \(user.company.name)"
            companyCatchPhraseLabel.text = "Company Catch Phrase: \(user.company.catchPhrase)"
            companyBsLabel.text = "Company BS: \(user.company.bs)"
        }
    }

    
    // Custom shadow function to add shadow on specific UIView
    private func applyCardStyle(view: UIView) {
        let cornerRadius: CGFloat = 10
        let shadowOffset = CGSize(width: 0, height: 5)
        let shadowOpacity: Float = 0.2
        let shadowRadius: CGFloat = 10
        
        view.layer.cornerRadius = cornerRadius
        view.layer.masksToBounds = false
        view.layer.shadowOffset = shadowOffset
        view.layer.shadowOpacity = shadowOpacity
        view.layer.shadowRadius = shadowRadius
        view.layer.shadowColor = UIColor.black.cgColor
    }
    
    // Setting text colors and fonts
    func setupUI(){
        emailLabel.textColor = .white
        phoneLabel.textColor = .white
        websiteLabel.textColor = .white
        
        emailLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        phoneLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        websiteLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        streetLabel.textColor = .white
        suiteLabel.textColor = .white
        cityLabel.textColor = .white
        zipcodeLabel.textColor = .white
        
        streetLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        suiteLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        cityLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        zipcodeLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        companyNameLabel.textColor = .white
        companyCatchPhraseLabel.textColor = .white
        companyBsLabel.textColor = .white
        
        companyNameLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        companyCatchPhraseLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        companyBsLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
    }

}
