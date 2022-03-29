//
//  KisiEkleVC.swift
//  KisilerApp
//
//  Created by Talha Varol on 28.03.2022.
//

import UIKit

class KisiEkleVC: UIViewController {
    
    let context = appDelegate.persistentContainer.viewContext
    
    @IBOutlet weak var kisiAdText: UITextField!
    @IBOutlet weak var kisiTelText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    
    @IBAction func ekleButton(_ sender: Any) {
        
        if let ad = kisiAdText.text, let tel = kisiTelText.text{
            
            let kisi = Rehber(context: context)
            kisi.kisi_ad = ad
            kisi.kisi_tel = tel
            
            appDelegate.saveContext()
        }
        
        
      
        
    }
    
}
