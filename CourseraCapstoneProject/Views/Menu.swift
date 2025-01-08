//
//  Menu.swift
//  CourseraCapstoneProject
//
//  Created by Erick Rocha on 07.01.25.
//

import SwiftUI
import CoreData

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var searchText: String = ""
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Header(showBackButton: false, showProfilePicture: true)
            
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(Color.llGrayDark)
                        .fontWeight(.bold)
                    TextField("", text: $searchText, prompt: Text("Search menu").foregroundStyle(Color.llGrayDark))
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color.llGrayLight)
                .foregroundColor(.black)
                .clipShape(RoundedRectangle(cornerRadius: 24))
            }
            .padding()
            .background(Color.llGreenDark)
            .foregroundStyle(.white)
            
            VStack {
                FetchedObjects(
                    predicate: buildPredicate(),
                    sortDescriptors: buildSortDescriptors()
                ) { (dishes: [Dish]) in
                    List {
                        ForEach(dishes, id: \.self) { dish in
                            ZStack {
                                HStack {
                                    Text("\(dish.title!) - \(dish.price!)")
                                    Spacer()
                                    AsyncImage(url: URL(string: dish.image!)) { image in
                                        image.resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 100)
                                            .clipped()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                }
                                NavigationLink(destination: DishDetails(dish: dish)) {
                                    EmptyView()
                                }.opacity(0)
                            }.padding(.vertical, 16)
                        }.listRowInsets(.init())
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                }.padding()
            }
        }
        .onAppear(perform: {
            getMenuData()
        })
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [
            NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))
        ]
    }
    
    func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true)
        }
        
        return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
    }
    
    func getMenuData() {
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let menuList = try decoder.decode(MenuList.self, from: data)
                    let menuItems = menuList.menu
                    
                    menuItems.forEach { menuItem in
                        let isSaved = isMenuItemAlreadySaved(menuItem, viewContext)
                        if !isSaved {
                            let dish = Dish(context: viewContext)
                            dish.title = menuItem.title
                            dish.price = menuItem.price
                            dish.image = menuItem.image
                            dish.desc = menuItem.description
                            dish.category = menuItem.category
                        }
                        
                        saveEntity(viewContext)
                    }
                } catch {
                    debugPrint(error.localizedDescription)
                }
            }
        }
        
        task.resume()
        
    }
    
    func isMenuItemAlreadySaved(_ dish:MenuItem, _ context: NSManagedObjectContext) -> Bool {
        let fetchRequest: NSFetchRequest<Dish> = Dish.fetchRequest()
        
        let pricePredicate = NSPredicate(format: "(desc == %@)", dish.description)
        let namePredicate = NSPredicate(format: "(title CONTAINS[cd] %@)", dish.title)
        let compoundPredicate = NSCompoundPredicate(type: .or, subpredicates: [pricePredicate, namePredicate])
        fetchRequest.predicate = compoundPredicate
        
        var results: [NSManagedObject] = []
        
        do {
            results = try context.fetch(fetchRequest)
        }
        catch {
            print("error executing fetch request: \(error)")
        }
        
        return results.count > 0
        
    }
    
    func saveEntity(_ context: NSManagedObjectContext) {
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch (let error) {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    Menu()
}
