//
//  KisiGuncelleVC.swift
//  KisilerApp
//
//  Created by Talha Varol on 28.03.2022.
//

import UIKit

class KisiGuncelleVC: UIViewController {

    var kisi: Rehber?
    @IBOutlet weak var kisiAdText: UITextField!
    @IBOutlet weak var kisiTelText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let k = kisi{
            kisiAdText.text = k.kisi_ad
            kisiTelText.text = k.kisi_tel
        }
    }
    

    @IBAction func ekleButton(_ sender: Any) {
        
        if let k = kisi,let ad = kisiAdText.text, let tel = kisiTelText.text{
            k.kisi_ad = ad
            k.kisi_tel = tel
             appDelegate.saveContext()
        }
        
    }
    
}
