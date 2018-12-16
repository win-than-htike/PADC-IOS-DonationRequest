//
//  NewPostViewController.swift
//  PADC-IOS-DonationRequest
//
//  Created by Ye Ko Ko Htet on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import FirebaseDatabase

class NewPostViewController: UIViewController {
    
    var donationRef : DatabaseReference!
    
    @IBOutlet weak var tvDescription: CustomUITextView!
    @IBOutlet weak var tfDonationDate: UITextField!
    @IBOutlet weak var tfLoaction: UITextField!
    
    private var datePicker: UIDatePicker?
    private var location: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        donationRef = Database.database().reference()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(onClickDonationDate(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapGesture(tapGesture:)))
        
        view.addGestureRecognizer(tapGesture)
        
        tfDonationDate.inputView = datePicker
        
        location = ["Yangon", "Mandalay"]
        
        let locationPicker = UIPickerView()
        
        tfLoaction.inputView = locationPicker
        
        locationPicker.delegate = self
        locationPicker.dataSource = self
        
        let textFieldBorderColor: UIColor = UIColor.lightGray
        tfDonationDate.layer.borderColor = textFieldBorderColor.cgColor
        tfDonationDate.layer.borderWidth = 2
        tfLoaction.layer.borderColor = textFieldBorderColor.cgColor
        tfLoaction.layer.borderWidth = 2
    
    }
    
    @IBAction func btnPost(_ sender: Any) {
        let donationPost = DonationPostVO()
        donationPost.desc = tvDescription.text!
        donationPost.location = tfLoaction.text!
        donationPost.donationDate = tfDonationDate.text!
        
        DataModel.shared.addPost(donationPost: donationPost, success: {
            /*
             * TODO Go To Donation Post List View
             */
            
            let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.present(loginViewController, animated: true, completion: nil)
            
        }) {
            self.showAlertDialog(inputMessage: "New post failed, try again!")
        }
        
    }
    
    @objc func onClickDonationDate(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        tfDonationDate.text = dateFormatter.string(from: datePicker.date)
    }
    
    @objc func viewTapGesture(tapGesture: UITapGestureRecognizer) {
        view.endEditing(true)
    }

}

extension NewPostViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return location.count
    }
}

extension NewPostViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return location[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tfLoaction.text = location[row]
    }
}
