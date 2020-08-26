//
//  ViewController.swift
//  WeeklyDayFinder
//
//  Created by jekaterina.livcane on 24/08/2020.
//  Copyright © 2020 jekaterina.livcane. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBOutlet weak var findButton: UIButton!
    
override func viewDidLoad() {
       super.viewDidLoad()
}
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
}
func handleCalculation(){
       let calendar = Calendar.current
       
       var dateComponent = DateComponents()
       guard let day = Int(dayTextField.text!), let month = Int(monthTextField.text!), let year = Int(yearTextField.text!) else {
        warningPopup(withTitle: "Input error!", withMessage: "Date text fields can't be empty!")
           return
       }
   
       dateComponent.day = Int(day)
       dateComponent.month = Int(month)
       dateComponent.year = Int(year)
       
       
       guard let date = calendar.date(from: dateComponent) else {
           print("calendar.date err")
           return
       }
let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_EN")
    dateFormatter.dateFormat = "EEEE"
    
    switch findButton.titleLabel?.text {
    case "Find":
        findButton.setTitle("Clear", for: .normal)
        if day >= 1 && day <= 31 && month >= 1 && month <= 12 {
        
            let weekday = dateFormatter.string(from: date)
            let capitalizedWeekday = weekday.capitalized
            resultLabel.text = capitalizedWeekday
    }else{
            warningPopup(withTitle: "Wrong Date!", withMessage: "Please enter correct date.")
    }
    default:
        findButton.setTitle("Find", for: .normal)
        clearTextField()
        }
    }
    
    func clearTextField(){
        dayTextField.text = ""
        monthTextField.text = ""
        yearTextField.text = ""
        resultLabel.text = "Find a weekday"
    }
    
    
    func warningPopup(withTitle title:String?, withMessage message:String?){
        
DispatchQueue.main.async {
            
    let popUp = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        popUp.addAction(okButton)
    self.present(popUp, animated: true, completion: nil)
    
    }
    }
        
        
    @IBAction func findTapped(_ sender: Any) {
        handleCalculation()
    }
        // MARK: - Navigation

       // In a storyboard-based application, you will often want to do a little preparation before navigation
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "infoSegue" {
           // Get the new view controller using segue.destination.
            let vc = segue.destination as! InfoViewController
           // Pass the selected object to the new view controller.
            vc.infoText = "Day finder helps you to find\n your weekday for given date."
       }
    }


}




