//
//  ListView.swift
//  Team0418Pokemon
//
//  Created by 차지용 on 5/2/24.
//

import SwiftUI

struct ListView: View {
    var id: Int = 1
    var body: some View {
        PkmImgView(idToSend: 1) // idToSend 값을 전달
        FirstDetailView(id: 1, idToSend: 1)
    }
}

#Preview {
    ListView()
}
