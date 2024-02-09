    //
//  ViewController.swift
//  Calculatrice_polonaise_IOS
//
//  Created by Manuel Ramanitra on 06/02/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var info_saisie: UILabel!
    @IBOutlet weak var valeur_saisie: UITextField!
    
    @IBOutlet weak var operateur_plus: UIButton!
    @IBOutlet weak var operateur_moins: UIButton!
    @IBOutlet weak var operateur_diviser: UIButton!
    @IBOutlet weak var operateur_multiplier: UIButton!
    
    // Les différentes zones d'affichage
    @IBOutlet weak var pile5: UILabel!
    @IBOutlet weak var pile4: UILabel!
    @IBOutlet weak var pile3: UILabel!
    @IBOutlet weak var pile2: UILabel!
    @IBOutlet weak var pile1: UILabel!
    
    
    var ma_pile = GestionPile()
    
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
    
    // permet d'alimenter la pile et d'afficher les elements dans la calculatrice
    @IBAction func clickEnter(_ sender: Any) {
        if (valeur_saisie.text != nil) {
            ma_pile.empile_pile(nb_saisie: NSNumber(value:  Double(valeur_saisie.text!)!))
            pile1.text = ma_pile.getElementPile(position: 0)?.stringValue ?? "----"
            pile2.text = ma_pile.getElementPile(position: 1)?.stringValue ?? "----"
            pile3.text = ma_pile.getElementPile(position: 2)?.stringValue ?? "----"
            pile4.text = ma_pile.getElementPile(position: 3)?.stringValue ?? "----"
            pile5.text = ma_pile.getElementPile(position: 4)?.stringValue ?? "----"
            
            valeur_saisie.text = ""
        }
       
        
    }
    @IBAction func clickDrop(_ sender: Any) {
        
        
    }
    @IBAction func clickVirgule(_ sender: Any) {
        switch valeur_saisie.text! {
        case "" : // permet de rajouter une valeur si on commence par ecrire une virgule
            valeur_saisie.text = "0."
        case let value where value.contains("."): // si ca contient deja une virgule on ne fait rien
            print("Erreur de saisie")
        default : // par defaut on ajoute un point
            valeur_saisie.text! += "."
            
        }
    }
    
    // permet d'afficher la valeur saisie
    @IBAction func clickDigit(_ sender: UIButton) {
        let val = sender.tag
        valeur_saisie.text! += String(val)
    }
    
    // nettoie la valeur saisie
    @IBAction func clearSaisie(_ sender: Any) {
        valeur_saisie.text = ""
    }
    
    func saut_ligne() -> String{
        return "\r"
    }
}

