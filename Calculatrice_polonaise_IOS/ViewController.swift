//
//  ViewController.swift
//  Calculatrice_polonaise_IOS
//
//  Created by Manuel Ramanitra on 06/02/2024.
//

import UIKit

class ViewController: UIViewController {
    
    var maPile : [Double] = []
    var compteur_pile = 4
    var compteur_valeur_saisie = 1
    @IBOutlet weak var info_saisie: UILabel!
    @IBOutlet weak var valeur_saisie: UITextField!
        
    @IBOutlet weak var operateur_plus: UIButton!
    @IBOutlet weak var operateur_moins: UIButton!
    @IBOutlet weak var operateur_diviser: UIButton!
    @IBOutlet weak var operateur_multiplier: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickAdd(_ sender: Any) {
    }
    @IBAction func clickMinus(_ sender: Any) {
    }
    @IBAction func clickDiv(_ sender: Any) {
    }
    @IBAction func clickMulti(_ sender: Any) {
    }
    @IBAction func clickEnter(_ sender: Any) {
    }
    @IBAction func clickDrop(_ sender: Any) {
    }
    
    @IBAction func clickDigit(_ sender: Any) {
        
    }
    
    
    @IBAction func valide_click(_ sender: Any) {
        let valeur_saisie = Double(valeur_saisie.text!) ?? 0
        compteur_pile -= 1
        compteur_valeur_saisie += 1
        info_saisie.text = "Saisissez la \(compteur_valeur_saisie) ieme valeur de la pile"
        
        //  ajout des valeurs saisies dans la pile
        maPile.append(valeur_saisie)
        
        //  affichage du contenu de la pile
        affichage_pile(valeur: String(valeur_saisie))
    }
    
    func affichage_pile(valeur : String){
        return ""
    }
    
    func saut_ligne() -> String{
        return "\r"
    }
}

