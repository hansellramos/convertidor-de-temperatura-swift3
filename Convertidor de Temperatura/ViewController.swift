//
//  ViewController.swift
//  Convertidor de Temperatura
//
//  Created by Hansel Ramos Osorio on 9/26/16.
//  Copyright © 2016 Hansel Ramos Osorio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var temp : Temperature?

    @IBOutlet weak var txtTempC: UITextField!
    @IBOutlet weak var txtTempF: UITextField!
    @IBOutlet weak var txtTempK: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        temp = Temperature()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func convertFromCelcius(_ sender: AnyObject) {
        txtTempC.text = txtTempC.text == "" ? "0" : txtTempC.text
        self.temp?.temperature = Double(txtTempC.text!)!
        self.showValues()
    }
    
    @IBAction func convertFromFarenheit(_ sender: AnyObject) {
        txtTempF.text = txtTempF.text == "" ? "0" : txtTempF.text
        self.temp?.fromFarenheit(farenheit: Double(txtTempF.text!)!)
        self.showValues()
    }
    
    @IBAction func convertFromKelvin(_ sender: AnyObject) {
        txtTempK.text = txtTempK.text == "" ? "0" : txtTempK.text
        self.temp?.fromKelvin(kelvin: Double(txtTempK.text!)!)
        self.showValues()
    }
    
    func showValues() -> Void{
        txtTempC.text = "\(self.temp!.temperature)"
        txtTempF.text = "\(self.temp!.toFarenheit())"
        txtTempK.text = "\(self.temp!.toKelvin())"
    }

}

class Temperature{
    
    open var temperature : Double
    
    init(){
        temperature = 0
    }
    
    convenience init(fromCelcius celcius:Double){
        self.init()
        self.temperature = celcius
    }
    
    convenience init(fromFarenheit farenheit:Double){
        self.init()
        self.fromFarenheit(farenheit: farenheit)
    }
    
    convenience init(fromKelvin kelvin:Double){
        self.init()
        self.fromKelvin(kelvin: kelvin)
    }
    
    public func fromKelvin(kelvin: Double) -> Void{
        self.temperature = kelvin - 273.15
    }
    
    public func fromFarenheit(farenheit: Double) -> Void{
        self.temperature = (farenheit-32) * 5 / 9
    }
    
    public func toKelvin() -> Double{
        return self.temperature + 275.15
    }
    
    public func toFarenheit() -> Double{
        return (self.temperature * 9 / 5) + 32
    }
    
}

