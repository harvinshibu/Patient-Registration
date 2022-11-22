//
//  AddRecViewController.swift
//  PatientRecord
//
//  Created by Harvin Shibu on 21/11/22.
//

import UIKit

class AddRecViewController: UIViewController {
    @IBOutlet weak var pId: UITextField!
    @IBOutlet weak var pPhone: UITextField!
    @IBOutlet weak var pCity: UITextField!
    @IBOutlet weak var pName: UITextField!
    var vModel: PatientViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func genRandom(_ sender: Any) {
        pId.text = vModel?.generateRandom()
    }
    
    @IBAction func savePressed(_ sender: Any) {
        let pModel = PatientModel(id: pId.text,name: pName.text,city: pCity.text,phone: pPhone.text)
        vModel?.addData(pModel: pModel)
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
