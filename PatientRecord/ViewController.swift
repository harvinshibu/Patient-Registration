//
//  ViewController.swift
//  PatientRecord
//
//  Created by Harvin Shibu on 21/11/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
       
    @IBOutlet weak var pTable: UITableView!
    let pVModel = PatientViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pTable.delegate = self
        pTable.dataSource = self
        
        pVModel.reloadData = { [self] in
            self.pTable.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPressed(_ sender: Any) {
        performSegue(withIdentifier: "add", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pVModel.rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pTable.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath) as! RecordTableViewCell
        let patient = pVModel.getPatientAt(index: indexPath.row)
        cell.setCellText(pModel: patient)
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete"){(action, view, completionHandler) in
            let pRemove = self.pVModel.getPatientAt(index: indexPath.row).id
            self.pVModel.delData(id: pRemove!)
        }
    
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cPatient = pVModel.getPatientAt(index: indexPath.row)
        performSegue(withIdentifier: "update", sender: cPatient)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
            case "add":
                if let vc = segue.destination as? AddRecViewController{
                    vc.vModel = self.pVModel
                }
            case "update":
                if let vc = segue.destination as? UpdateDataViewController{
                    vc.vModel = self.pVModel
                    vc.pModel = sender as? PatientModel
                }
                
            default:
                break
            
        }
    }



}
