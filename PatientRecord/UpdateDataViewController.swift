//
//  UpdateDataViewController.swift
//  PatientRecord
//
//  Created by Harvin Shibu on 22/11/22.
//

import UIKit

class UpdateDataViewController: UIViewController {

    var vModel: PatientViewModel?
    var pModel: PatientModel?
    
    @IBOutlet weak var pUpPhone: UITextField!
    @IBOutlet weak var pUpCity: UITextField!
    @IBOutlet weak var pUpName: UITextField!
    @IBOutlet weak var pUpId: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pUpId.text = pModel?.id
        pUpName.text = pModel?.name
        pUpCity.text = pModel?.city
        pUpPhone.text = pModel?.phone

        // Do any additional setup after loading the view.
    }
    
    @IBAction func genUpPressed(_ sender: Any) {
        pUpId.text = vModel?.generateRandom()
    }
    
    @IBAction func updatePressed(_ sender: Any) {
        let pUpModel = PatientModel(id: pUpId.text,name: pUpName.text,city: pUpCity.text,phone: pUpPhone.text)
        vModel?.updateData(id: (pModel?.id)!, pModel: pUpModel)
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
