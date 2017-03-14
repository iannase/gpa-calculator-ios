//
//  SecondViewController.swift
//  GPA Calculator
//
//  Created by Ian on 2/6/17.
//  Copyright © 2017 IanAnnase. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var pastGPAfield: UITextField!
    @IBOutlet weak var pastSemesterHours: UITextField!
    @IBOutlet weak var currentSemesterHours: UITextField!
    @IBOutlet weak var semesterGPAfield: UITextField!
    @IBOutlet weak var gpaLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var calcButton: UIButton!
    
    @IBAction func colorChange(_ sender: Any) {
        calcButton.backgroundColor  = UIColor.green
    }
    
    
    @IBAction func calculation(_ sender: Any) {
        if pastGPAfield.text == "" || pastSemesterHours.text == "" || currentSemesterHours.text == "" || semesterGPAfield.text == ""
        {
            gpaLabel.text = "?"
            return
        }

        let pastGPA1 = Double(pastGPAfield.text!)!
        let currentSemester1 = Double(currentSemesterHours.text!)!
        let pastSemester1 = Double(pastSemesterHours.text!)!
        let semesterGPA1 = Double(semesterGPAfield.text!)!
        let total = (semesterGPA1 * currentSemester1 + pastGPA1 * pastSemester1) / (pastSemester1 + currentSemester1)
        
        gpaLabel.text = String(format: "%.2f", total)
        
        dismissKeyboard()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pastGPAfield.delegate = self
        currentSemesterHours.delegate = self
        pastSemesterHours.delegate = self
        semesterGPAfield.delegate = self
        
        let contentInsets = UIEdgeInsetsMake(0.0, 0.0, 100, 0.0);
        scrollView.contentInset = contentInsets;
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func dismissKeyboard() {
        pastGPAfield.resignFirstResponder()
        currentSemesterHours.resignFirstResponder()
        pastSemesterHours.resignFirstResponder()
        semesterGPAfield.resignFirstResponder()
    }
    
    func text11(textField: UITextField) -> Bool {
        pastGPAfield.resignFirstResponder()
        currentSemesterHours.resignFirstResponder()
        pastSemesterHours.resignFirstResponder()
        semesterGPAfield.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

