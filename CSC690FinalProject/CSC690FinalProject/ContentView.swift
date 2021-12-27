//
//  ContentView.swift
//  TabBar2
//
//  Created by JPL-ST-SPRING2021 on 12/26/21.
//  Copyright © 2021 JPL-LT-013. All rights reserved.
//

import SwiftUI

struct Item: Hashable {
    let name: String
}

struct HabitBuilderView: View {
    @State var items = [Item]()
    @State var addItemName: String = ""
    @State var addItem = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.self) { item in
                    Text(item.name)
                }
            }
            .navigationBarTitle("Habit Builder")
            .navigationBarItems(trailing: Button(action: {
                self.addItem.toggle()
            }){
                Image(systemName: "plus")
            })
        }.sheet(isPresented: $addItem){
            HStack{
                Text("Item: ")
                TextField("Add in an entry", text: self.$addItemName)
            }
            Button(action: {
                self.items.append(Item(name: self.addItemName))
                self.addItem.toggle()
                
                self.addItemName = ""
                
            }, label: {
                Text("Add")
            })
        }
    }
}

struct ToDoView: View {
    @State var items = [Item]()
    @State var addItemName: String = ""
    @State var addItem = false
    
    var body: some View {
        NavigationView {
            List {
                    ForEach(items, id: \.self) { item in
                        Text(item.name)
                    }
                }
                .navigationBarTitle("To-Do")
                .navigationBarItems(trailing: Button(action: {
                    self.addItem.toggle()
                }){
                    Image(systemName: "plus")
                })
            }.sheet(isPresented: $addItem){
                HStack{
                    Text("Item: ")
                    TextField("Add in an entry", text: self.$addItemName)
                }
                Button(action: {
                    self.items.append(Item(name: self.addItemName))
                    self.addItem.toggle()
                    
                    self.addItemName = ""
                    
                }, label: {
                    Text("Add")
                })
            }
        }
}

struct HabitBreakerView: View {
    @State var items = [Item]()
    @State var addItemName: String = ""
    @State var addItem = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.self) { item in
                    Text(item.name)
                }
            }
            .navigationBarTitle("Habit Breaker")
            .navigationBarItems(trailing: Button(action: {
                self.addItem.toggle()
            }){
                Image(systemName: "plus")
            })
        }.sheet(isPresented: $addItem){
            HStack{
                Text("Item: ")
                TextField("Add in an entry", text: self.$addItemName)
            }
            Button(action: {
                self.items.append(Item(name: self.addItemName))
                self.addItem.toggle()
                
                self.addItemName = ""
                
            }, label: {
                Text("Add")
            })
        }
    }
}

struct ContentView: View {
    @State private var items = []
    
    var body: some View {
        TabView {
            HabitBuilderView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Habit Builder")
                }
            ToDoView()
                .tabItem {
                    Image(systemName: "house")
                    Text("To-Do")
                }
            HabitBreakerView()
                .tabItem {
                    Image(systemName: "hammer")
                    Text("Habit Breaker")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
