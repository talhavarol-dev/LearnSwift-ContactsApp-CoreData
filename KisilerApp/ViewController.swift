//
//  ViewController.swift
//  KisilerApp
//
//  Created by Talha Varol on 28.03.2022.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate

class ViewController: UIViewController {
    
    let context = appDelegate.persistentContainer.viewContext

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var kisilerTableView: UITableView!
    var rehberListe = [Rehber]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tumKisilerAl()
        kisilerTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = sender as? Int
        
        if segue.identifier == "toDetay"{
            let gidilecekVC = segue.destination as! KisiDetayVC
            gidilecekVC.kisi = rehberListe[index!]
        }
        if segue.identifier == "toGuncelle"{
            let gidilecekVC = segue.destination as! KisiGuncelleVC
            gidilecekVC.kisi = rehberListe[index!]
        }
        
    }
    
    
    func tumKisilerAl() {
        do {
            rehberListe = try context.fetch(Rehber.fetchRequest())
        } catch{
            print(error)
        }
    }
    func aramaYap(kisi_ad:String) {
        
        let fetchRequest: NSFetchRequest<Rehber> = Rehber.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "kisi_ad CONTAINS %@", kisi_ad)
        do {
            rehberListe = try context.fetch(fetchRequest)
        } catch{
            print(error)
        }
    }

} 

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rehberListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let kisi = rehberListe[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "KisiHucre", for: indexPath) as! KisiTableViewCell
        cell.kisiLabel.text = "\(kisi.kisi_ad!) - \(kisi.kisi_tel!)"
        return cell
    }
   
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { contextualAction, view, boolValue in
            let kisi = self.rehberListe[indexPath.row]
            self.context.delete(kisi)
            
            appDelegate.saveContext()
            self.tumKisilerAl()
            self.kisilerTableView.reloadData()
        
        }
        let guncelleAction = UIContextualAction(style: .normal, title: "Güncelle") { contextualAction, view, boolValue in
            print("Güncelle tıklandı \(self.rehberListe[indexPath.row])")
            self.performSegue(withIdentifier: "toGuncelle", sender: indexPath.row)
        }
        return UISwipeActionsConfiguration(actions: [silAction,guncelleAction])
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetay", sender: indexPath.row)
        
    }
}

extension ViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      
       
        if searchText == ""{
            tumKisilerAl()
        }else{
            aramaYap(kisi_ad: searchText)
        }
        kisilerTableView.reloadData()
        
    }
    
}

