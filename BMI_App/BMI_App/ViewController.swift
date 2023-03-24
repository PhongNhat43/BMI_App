//
//  ViewController.swift
//  BMI_App
//
//  Created by devsenior on 15/03/2023.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var WeightTf: UITextField!
    @IBOutlet weak var heightTf: UITextField!
    
    
    @IBOutlet weak var clickBtn: UIButton!
    @IBOutlet weak var lbResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setupButton(){
        clickBtn.layer.cornerRadius = 10
        clickBtn.layer.masksToBounds = true
    }
    
    func calculateBMI(weight: Double, height: Double) -> Double {
        var result: Double
        result = (weight/pow(Double((height/100)), 2))
        print(result)
        return result
    }
    
    


    @IBAction func calculateBtn(_ sender: Any) {
        view.endEditing(true)
        
        if heightTf.text == ""{
          print("Enter your Height !!!!!")
            let alert = UIAlertController(title: "Error", message:"Enter your Height" , preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
                // Xử lý khi người dùng chọn "OK"
            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }

        if WeightTf.text == ""{
          print("Enter your Weight !!!!!")
            let alert = UIAlertController(title: "Error", message:"Enter your Height" , preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
                // Xử lý khi người dùng chọn "OK"
            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        
        
        let x : Double? = Double(WeightTf.text!)
        let y : Double? = Double(heightTf.text!)
        
        let result = calculateBMI(weight: x!, height: y!)
        
        switch result {
        case ..<16:
              lbResult.text = ("BMI của bạn là \(result) -> tức là bạn thiếu cân.")
              lbResult.backgroundColor = .orange
           
        case 16..<17:
            lbResult.text = ("BMI của bạn là \(result) -> tức là bạn thiếu cân.")
            lbResult.backgroundColor = .orange
           
        case 17..<18.5:
            lbResult.text = ("BMI của bạn là \(result) -> tức là bạn thiếu cân.")
            lbResult.backgroundColor = .orange
           
        case 18.5..<25:
            lbResult.text = ("BMI của bạn là \(result) -> tức là bạn có cân nặng bình thường.")
            lbResult.backgroundColor = .green
           
        case 25..<30:
            lbResult.text = ("BMI của bạn là \(result) -> tức là bạn thừa cân.")
            lbResult.backgroundColor = .red
           
        case 30..<35:
            lbResult.text = ("BMI của bạn là \(result) -> tức là bạn thừa cân.")
            lbResult.backgroundColor = .red
           
        case 35..<40:
            lbResult.text = ("BMI của bạn là \(result) -> tức là bạn thừa cân.")
            lbResult.backgroundColor = .red
           
        case 40...:
            
            lbResult.text = ("BMI của bạn là \(result) -> tức là bạn thừa cân.")
            lbResult.backgroundColor = .red
        default:
            fatalError()
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

