//
//  SecondViewController.swift
//  GPA Calculator
//
//  Created by Ian on 2/6/17.
//  Copyright © 2017 IanAnnase. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var currentGPAfield: UITextField!
    @IBOutlet weak var currentHoursField: UITextField!
    @IBOutlet weak var totalHoursField: UITextField!
    @IBOutlet weak var remainderGPAfield: UITextField!
    @IBOutlet weak var gpaLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var calcButton: UIButton!
    
    @IBAction func colorChange(_ sender: Any) {
        calcButton.backgroundColor  = UIColor.green
    }
    
    
    @IBAction func calculate(_ sender: Any) {
        if currentGPAfield.text == "" || currentHoursField.text == "" || totalHoursField.text == "" || remainderGPAfield.text == ""
        {
            gpaLabel.text = "?"
            return
        }
        
        let currentGPA = Double(currentGPAfield.text!)!
        let currentHours = Double(currentHoursField.text!)!
        let totalHours = Double(totalHoursField.text!)!
        let remainderGPA = Double(remainderGPAfield.text!)!
        
        let total = (currentGPA * currentHours + remainderGPA * (totalHours - currentHours)) / totalHours
        
        gpaLabel.text = String(format: "%.2f", total)
        
        dismissKeyboard()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentGPAfield.delegate = self
        currentHoursField.delegate = self
        totalHoursField.delegate = self
        remainderGPAfield.delegate = self
        
        let contentInsets = UIEdgeInsetsMake(0.0, 0.0, 100, 0.0);
        scrollView.contentInset = contentInsets;
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func dismissKeyboard() {
        currentGPAfield.resignFirstResponder()
        totalHoursField.resignFirstResponder()
        currentHoursField.resignFirstResponder()
        remainderGPAfield.resignFirstResponder()
    }
    
    func text11(textField: UITextField) -> Bool {
        currentGPAfield.resignFirstResponder()
        totalHoursField.resignFirstResponder()
        currentHoursField.resignFirstResponder()
        remainderGPAfield.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
