//
//  FirstViewController.swift
//  GPA Calculator
//
//  Created by Ian on 2/6/17.
//  Copyright © 2017 IanAnnase. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var grade1: UITextField!
    @IBOutlet weak var grade2: UITextField!
    @IBOutlet weak var grade3: UITextField!
    @IBOutlet weak var grade4: UITextField!
    @IBOutlet weak var grade5: UITextField!
    @IBOutlet weak var grade6: UITextField!
    
    @IBOutlet weak var credit1: UITextField!
    @IBOutlet weak var credit2: UITextField!
    @IBOutlet weak var credit3: UITextField!
    @IBOutlet weak var credit4: UITextField!
    @IBOutlet weak var credit5: UITextField!
    @IBOutlet weak var credit6: UITextField!
    
    @IBOutlet weak var calcButton: UIButton!
    @IBOutlet weak var gpaLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        grade1.delegate = self
        grade2.delegate = self
        grade3.delegate = self
        grade4.delegate = self
        grade5.delegate = self
        grade6.delegate = self
        credit1.delegate = self
        credit2.delegate = self
        credit3.delegate = self
        credit4.delegate = self
        credit5.delegate = self
        credit6.delegate = self
        
        let contentInsets = UIEdgeInsetsMake(0.0, 0.0, 100, 0.0);
        scrollView.contentInset = contentInsets;
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func dismissKeyboard() {
        grade1.resignFirstResponder()
        grade2.resignFirstResponder()
        grade3.resignFirstResponder()
        grade4.resignFirstResponder()
        grade5.resignFirstResponder()
        grade6.resignFirstResponder()
        credit1.resignFirstResponder()
        credit2.resignFirstResponder()
        credit3.resignFirstResponder()
        credit4.resignFirstResponder()
        credit5.resignFirstResponder()
        credit6.resignFirstResponder()
    }
    
    func text11(textField: UITextField) -> Bool {
        grade1.resignFirstResponder()
        grade2.resignFirstResponder()
        grade3.resignFirstResponder()
        grade4.resignFirstResponder()
        grade5.resignFirstResponder()
        grade6.resignFirstResponder()
        credit1.resignFirstResponder()
        credit2.resignFirstResponder()
        credit3.resignFirstResponder()
        credit4.resignFirstResponder()
        credit5.resignFirstResponder()
        credit6.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func userTappedBackground(sender: AnyObject) {
        grade1.resignFirstResponder()
        grade2.resignFirstResponder()
        grade3.resignFirstResponder()
        grade4.resignFirstResponder()
        grade5.resignFirstResponder()
        grade6.resignFirstResponder()
        credit1.resignFirstResponder()
        credit2.resignFirstResponder()
        credit3.resignFirstResponder()
        credit4.resignFirstResponder()
        credit5.resignFirstResponder()
        credit6.resignFirstResponder()
    }
 
    @IBAction func colorChange(_ sender: Any) {
        calcButton.backgroundColor  = UIColor.green
    }
    
    @IBAction func calculate(_ sender: Any) {
        let grades = [grade1.text, grade2.text, grade3.text, grade4.text, grade5.text, grade6.text]
        var gpas = [Double]()
        var credits = [credit1.text, credit2.text, credit3.text, credit4.text, credit5.text, credit6.text]
        var doubleCredits = [Double]()
        var totalGPA = 0.0
        var totalCredits = 0.0
        var total = 0.0

        if credits[0]!.isEmpty || grades[0]!.isEmpty
        {
            gpaLabel.text = "?"
            return
        }

        for i in 0 ... 5
        {
            if !credits[i]!.isEmpty
            {
            doubleCredits.append(Double(credits[i]!)!)
            }
        }
        
        for i in 0 ... 5
        {
            if !grades[i]!.isEmpty
            {
            if grades[i]! == "A"
            {
                gpas.append(4.0)
            }
            if grades[i]! == "A-"
            {
                gpas.append(3.75)
            }
            if grades[i]! == "B+"
            {
                gpas.append(3.25)
            }
            if grades[i]! == "B"
            {
                gpas.append(3.0)
            }
            if grades[i]! == "B-"
            {
                gpas.append(2.75)
            }
            if grades[i]! == "C+"
            {
                gpas.append(2.25)
            }
            if grades[i]! == "C"
            {
                gpas.append(2.0)
            }
            if grades[i]! == "C-"
            {
                gpas.append(1.75)
            }
            if grades[i]! == "D+"
            {
                gpas.append(1.25)
            }
            if grades[i]! == "D"
            {
                gpas.append(1.0)
            }
            if grades[i]! == "D-"
            {
                gpas.append(0.75)
            }
            if grades[i]! == "F"
            {
                gpas.append(0.0)
            }
            }
            dismissKeyboard()
        }
        
        for i in 0 ... (gpas.count-1)
        {
            totalCredits += doubleCredits[i]
            totalGPA = totalGPA + (gpas[i] * doubleCredits[i])
        }
        
        total = totalGPA / totalCredits
        
        gpaLabel.text = String(format: "%.2f", total)
        
        
    }

    

}

