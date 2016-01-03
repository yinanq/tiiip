//
//  ViewController.swift
//  tiiip
//
//  Created by Yinan iMac on 12/31/15.
//  Copyright © 2015 YinanLearningSwift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var paidby2priceLabel: UILabel!
    @IBOutlet weak var paidby3priceLabel: UILabel!
    @IBOutlet weak var paidby4priceLabel: UILabel!
    @IBOutlet weak var paidby5priceLabel: UILabel!
    @IBOutlet weak var paidby6priceLabel: UILabel!
    
    @IBOutlet weak var groupayView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        billField.becomeFirstResponder()
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        paidby2priceLabel.text = "$0.00"
        paidby3priceLabel.text = "$0.00"
        paidby4priceLabel.text = "$0.00"
        paidby5priceLabel.text = "$0.00"
        paidby6priceLabel.text = "$0.00"
        
        self.groupayView.alpha = 0
//        self.groupayView.center = CGPoint(x:187.5, y:1000)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//tapped billField:
    @IBAction func onEditingDidBegin(sender: AnyObject) {
        print("tapped billField")
        //animate:
//        self.groupayView.center = CGPoint(x:187.5, y:482)
        UIView.animateWithDuration(0.5, animations: {
            self.groupayView.alpha = 0
//            self.groupayView.center = CGPoint(x:187.5, y:1000)
        })
        
    }
//editing billField:
    @IBAction func onEditingChanged(sender: AnyObject) {
        print("someone's touching the keyboard!")
        
        let billInput = NSString(string: billField.text!).doubleValue
        
        let tipInputChoices = [0.15, 0.2, 0.25]
        let tipInput = tipInputChoices[tipControl.selectedSegmentIndex]
        let tipOutput = billInput * tipInput
        
        let totalOutput = billInput + tipOutput
        
        let paidby2priceOutput = totalOutput/2
        let paidby3priceOutput = totalOutput/3
        let paidby4priceOutput = totalOutput/4
        let paidby5priceOutput = totalOutput/5
        let paidby6priceOutput = totalOutput/6
        
//        tipLabel.text = "$\(tipOutput)"
//        totalLabel.text = "$\(totalOutput)"
        tipLabel.text = String(format: "$%.2f", tipOutput)
        totalLabel.text = String(format: "$%.2f", totalOutput)
        
        paidby2priceLabel.text = String(format: "$%.2f", paidby2priceOutput)
        paidby3priceLabel.text = String(format: "$%.2f", paidby3priceOutput)
        paidby4priceLabel.text = String(format: "$%.2f", paidby4priceOutput)
        paidby5priceLabel.text = String(format: "$%.2f", paidby5priceOutput)
        paidby6priceLabel.text = String(format: "$%.2f", paidby6priceOutput)
    }
    
//tapped empty area:
    @IBAction func onTap(sender: AnyObject) {
        //deactivate billField & hide keyboard:
        view.endEditing(true)
        
        //animate:
        self.groupayView.alpha = 0
        self.groupayView.center = CGPoint(x:187.5, y:1000)
        UIView.animateWithDuration(1, animations: {
            self.groupayView.alpha = 1
            self.groupayView.center = CGPoint(x:187.5,y:482)
        })
    }
}

