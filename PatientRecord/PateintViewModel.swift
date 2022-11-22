//
//  PateintViewModel.swift
//  PatientRecord
//
//  Created by Harvin Shibu on 21/11/22.
//

import Foundation

class PatientViewModel{
    var patientList = [PatientModel]()
    let pUserHelper = CoreDataPatientHelper()
    var reloadData: (() -> Void)?
    
    var rowCount: Int{
        patientList.count
    }
    
    init(){
        loadData()
    }
    
    func getPatientAt(index: Int) -> PatientModel{
        patientList[index]
    }
    
    func addData(pModel: PatientModel){
        pUserHelper.addToCore(pModel: pModel)
        loadData()
    }
    
    
    func updateData(id: String,pModel: PatientModel){
        pUserHelper.upDateDataToCore(id: id, pModel: pModel)
        loadData()
    }
    
    func delData(id: String){
        pUserHelper.deleteDataFromCore(id: id)
        loadData()
    }
    
    private func loadData(){
        patientList = pUserHelper.loadDataFromCore()
        reloadData?()
        
    }
    
    func generateRandom() -> String{
        let randomInt = Int.random(in: 0...1000)
        return String(randomInt)
    }
    
    
}
