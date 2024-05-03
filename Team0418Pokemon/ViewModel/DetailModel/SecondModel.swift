//
//  SecondModel.swift
//  Team0418Pokemon
//
//  Created by 차지용 on 5/2/24.
//

import Foundation

private var detailModel = DetailModel(service: DetailMockService())

func getWidt(for index: Int) ->CGFloat {

    
    switch (index) {
    case 0:
        return CGFloat(detailModel.pokeDtail.stat.hp)
    case 1:
        return CGFloat(detailModel.pokeDtail.stat.attack)
    case 2:
        return CGFloat(detailModel.pokeDtail.stat.defense)
    case 3:
        return CGFloat(detailModel.pokeDtail.stat.specialAttack)
    case 4:
        return CGFloat(detailModel.pokeDtail.stat.specialDefense)
    case 5:
        return CGFloat(detailModel.pokeDtail.stat.speed)
    default :
        return 50
    }
}
