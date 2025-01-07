//
//  MenuIte,.swift
//  CourseraCapstoneProject
//
//  Created by Erick Rocha on 07.01.25.
//

struct MenuItem: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let price: String
    let image: String
    let category: String
}
