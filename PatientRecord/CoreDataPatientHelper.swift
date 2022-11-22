//
//  CoreDataPatientHelper.swift
//  PatientRecord
//
//  Created by Harvin Shibu on 21/11/22.
//

import CoreData

class CoreDataPatientHelper{

    let context: NSManagedObjectContext
    
    init() {
        let container = CoreDataHelper()
        context = container.persistentContainer.newBackgroundContext()
    }
    
    func addToCore(pModel: PatientModel){
        do{
            try context.performAndWait {
                let newPatient = PatientData(context: context)
                newPatient.id = pModel.id
                newPatient.name = pModel.name
                newPatient.city = pModel.city
                newPatient.phone = pModel.phone
                try context.save()
            }
        }
        catch{
            context.rollback()
        }
        
    }
    
    func deleteDataFromCore(id: String){
        
        let fetchRequest: NSFetchRequest<PatientData> = PatientData.fetchRequest()
        let pred = NSPredicate(format: "id CONTAINS %@", id)
        fetchRequest.predicate = pred
        let objects = try! context.fetch(fetchRequest)
        for obj in objects {
            context.delete(obj)
        }

        do {
            try context.save()
        } catch {
            context.rollback()
        }
        
    }
    
    func upDateDataToCore(id: String,pModel: PatientModel){
        
        let fetchRequest: NSFetchRequest<PatientData> = PatientData.fetchRequest()
        let pred = NSPredicate(format: "id CONTAINS %@", id)
        fetchRequest.predicate = pred
        do{
            let objects = try! context.fetch(fetchRequest)
            
            if (objects.count > 0){
                let update = objects[0]
                update.id = pModel.id
                update.name = pModel.name
                update.city = pModel.city
                update.phone = pModel.phone
            }
            
            try context.save()
        }
        catch{
            
        }
    }
    

    
    func loadDataFromCore() -> [PatientModel]{
        var pModel = [PatientModel]()
        let fetchRequest = NSFetchRequest<PatientData>(entityName: "PatientData")
        
        do{
            try context.performAndWait {
                let arr = try context.fetch(fetchRequest)
                pModel = arr.map{ patient in
                    PatientModel(id: patient.id, name: patient.name,city: patient.city,phone: patient.phone)
                }
            }
        }
        catch{
            
        }
        return pModel
    }
    
    
}
