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
    
    @IBOutlet weak var error_saisie: UILabel!
    
    var ma_pile = GestionPile()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // additonne les deux derniers elemetns de la pile
    @IBAction func clickAdd(_ sender: Any) {
        if ma_pile.nbElementPile() > 1 {
            error_saisie.isHidden = true
            let value1 = ma_pile.getElementPile(position: 0)!.doubleValue
            let value2 = ma_pile.getElementPile(position: 1)!.doubleValue
            let somme = value1 + value2
            ma_pile.depile()
            ma_pile.depile()
            ma_pile.empile_pile(nb_saisie: somme as NSNumber)
            affichage_pile()
        }
        else {
            error_saisie_calculette()
        }
            
    }
    
    // permemt de multiplier deux nombres
    @IBAction func clickMinus(_ sender: Any) {
        if ma_pile.nbElementPile() > 1 {
            error_saisie.isHidden = true
            let value1 = ma_pile.getElementPile(position: 0)!.doubleValue
            let value2 = ma_pile.getElementPile(position: 1)!.doubleValue
            let soustraction = value2 - value1
            ma_pile.depile()
            ma_pile.depile()
            ma_pile.empile_pile(nb_saisie: soustraction as NSNumber)
            affichage_pile()
        }
        else {
            error_saisie_calculette()
        }
    }
    
    // permet de faire la divison
    @IBAction func clickDiv(_ sender: Any) {
        if ma_pile.nbElementPile() > 1 {
            error_saisie.isHidden = true
            let value1 = ma_pile.getElementPile(position: 0)!.doubleValue
            let value2 = ma_pile.getElementPile(position: 1)!.doubleValue
            
            var division : NSNumber = 0
            if value1 != 0.0 {
                division = value2 / value1 as NSNumber
            }
           
            ma_pile.depile()
            ma_pile.depile()
            ma_pile.empile_pile(nb_saisie: division as NSNumber)
            affichage_pile()
        }
        else {
            error_saisie_calculette()
        }
    }
    
    // multiplication
    @IBAction func clickMulti(_ sender: Any) {
        if ma_pile.nbElementPile() > 1 {
            error_saisie.isHidden = true
            let value1 = ma_pile.getElementPile(position: 0)!.doubleValue
            let value2 = ma_pile.getElementPile(position: 1)!.doubleValue
            let multi = value1 * value2
            ma_pile.depile()
            ma_pile.depile()
            ma_pile.empile_pile(nb_saisie: multi as NSNumber)
            affichage_pile()
        }
        else {
            error_saisie_calculette()
        }
            
    }
    
    // permet d'alimenter la pile et d'afficher les elements dans la calculatrice
    @IBAction func clickEnter(_ sender: Any) {
        error_saisie.isHidden = true
        if (valeur_saisie.text != nil) {
            ma_pile.empile_pile(nb_saisie: NSNumber(value:  Double(valeur_saisie.text!)!))
            affichage_pile()
            
            valeur_saisie.text = ""
        }
    }
    
    // supprime la derniere element de la pile
    @IBAction func clickDrop(_ sender: Any) {
        ma_pile.depile()
        affichage_pile()
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
    
    // fait le cosinus
    @IBAction func clickCos(_ sender: Any) {
        if ma_pile.nbElementPile() != 0 {
            let cos = cos(ma_pile.getElementPile(position: 0)!.doubleValue)
            ma_pile.depile()
            ma_pile.empile_pile(nb_saisie: cos as NSNumber)
            affichage_pile()
        }
        else {
            error_saisie_calculette()
        }
    }
    
    // fait le sinus
    @IBAction func clickSin(_ sender: Any) {
        if ma_pile.nbElementPile() != 0 {
            error_saisie.isHidden = true
            let sin = sin(ma_pile.getElementPile(position: 0)!.doubleValue)
            ma_pile.depile()
            ma_pile.empile_pile(nb_saisie: sin as NSNumber)
            affichage_pile()
        }
        else {
            error_saisie_calculette()
        }
    }
    
    // fait la racine carré
    @IBAction func clickRacine(_ sender: Any) {
        if ma_pile.nbElementPile() != 0 {
            error_saisie.isHidden = true
            let racine = sqrt(ma_pile.getElementPile(position: 0)!.doubleValue)
            ma_pile.depile()
            ma_pile.empile_pile(nb_saisie: racine as NSNumber)
            affichage_pile()
        }
        else {
            error_saisie_calculette()
        }
        
    }
    
    // fait la puissance
    @IBAction func clickPuisssance(_ sender: Any) {
        if ma_pile.nbElementPile() > 1 {
            error_saisie.isHidden = true
            let value1 = ma_pile.getElementPile(position: 0)!.doubleValue
            let value2 = ma_pile.getElementPile(position: 1)!.doubleValue
            let puissance = pow(value2,value1)
            ma_pile.depile()
            ma_pile.depile()
            ma_pile.empile_pile(nb_saisie: puissance as NSNumber)
            affichage_pile()
        }
        else {
            error_saisie_calculette()
        }
        
    }
    
    // nettoie la valeur saisie
    @IBAction func clearSaisie(_ sender: Any) {
        valeur_saisie.text = ""
    }
    
    func saut_ligne() -> String{
        return "\r"
    }
    
    // affiche les elements de pile
    func affichage_pile() {
        pile1.text = ma_pile.getElementPile(position: 0)?.stringValue ?? "----"
        pile2.text = ma_pile.getElementPile(position: 1)?.stringValue ?? "----"
        pile3.text = ma_pile.getElementPile(position: 2)?.stringValue ?? "----"
        pile4.text = ma_pile.getElementPile(position: 3)?.stringValue ?? "----"
        pile5.text = ma_pile.getElementPile(position: 4)?.stringValue ?? "----"
    }
    
    // message en cas d'erreur
    func error_saisie_calculette() {
        error_saisie.isHidden = false
        error_saisie.text = "Erreur !!!"
    }
}

