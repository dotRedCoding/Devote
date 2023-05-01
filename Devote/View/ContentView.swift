//
//  ContentView.swift
//  Devote
//
//  Created by Jared Infantino on 2023-04-30.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: - PROPERTY
    @State var task: String = ""
    @State private var showNewTaskItem: Bool = false
    
    // FETCHING DATA
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest( // allows us to load core data results
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item> // fetched result: Property(items) fills out the list using the forEach loop
    
    // MARK: - FUNCTION
    // recommended to keep functions between the properties and body
  
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ZStack {
                // MARK: - MAIN VIEW
                VStack {
                    
                    // MARK: - HEADER
                    Spacer(minLength: 80)
                    
                    // MARK: - NEW TASK BUTTON
                    Button(action: {
                        showNewTaskItem = true
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 30, weight: .semibold, design: .rounded))
                        Text("New Task")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                    })
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .leading, endPoint: .trailing)
                            .clipShape(Capsule())
                    )
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 8, x: 0.0, y: 4.0)
                    
                    // MARK: - TASKS
                    List {
                        ForEach(items) { item in
                            VStack(alignment: .leading) {
                                Text(item.task ?? "")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            } // End of VSTACK
                        }
                        .onDelete(perform: deleteItems)
                    } // End of List
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 12)
                    .padding(.vertical)
                    .frame(maxWidth: 640) // this will remove default padding and maximize it for iPad
                } // End of VSTACK
                
                // MARK: - NEW TASK ITEM
            } // END of ZSTACK
            .onAppear() {
                UITableView.appearance().backgroundColor = UIColor.clear
            }
            .navigationTitle("Daily Tasks")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }// End of Toolbar
            .background(
            BackgroundImageView()
            )
            .background(
                backgroundGradient.ignoresSafeArea(.all)
            )
        } // End of Nav
    }
}


// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
