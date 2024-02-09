//
//  ClassStackRPN.swift
//  Calculatrice_polonaise_IOS
//
//  Created by Manuel Ramanitra on 09/02/2024.
//

import Foundation


class GestionPile {
    
    private var maPile : [NSNumber] = []
    
    // empile un element dans la liste en le rajoutant à la fin
    func empile_pile(nb_saisie: NSNumber) {
        maPile.append(nb_saisie)
    }
    
    // depile le dernier élémént entré par l'utilisateur et retourne
    func depile() {
        maPile.removeLast()
    }
    
    func nbElementPile() -> Int{
        return maPile.count
    }
    
    
    // vide toute la pile
    func clear() {
        maPile.removeAll()
    }
    
    // recupère le n ieme element dans la pile
    func getElementPile(position: Int) -> NSNumber? {
        // permet de ne pas faire un out of range lors de l'affichage
        if maPile.count - 1 < position {
            return nil
        }
        else {
            return maPile[maPile.count - 1 - position]
        }
    }
}
