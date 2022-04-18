//
//  ContentView.swift
//  TodoList
//
//  Created by Lee on 2022/4/13.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    // managedObjectContext for environment
    @FetchRequest (sortDescriptors:[NSSortDescriptor(keyPath: \Task.date, ascending: false)])
    //fetching and displaying results,sort by date
    
    private var tasks : FetchedResults<Task>
    
    var body: some View {
        NavigationView{
            List{
                ForEach(tasks){ task in
                    Text(task.title ?? "Untitled")
                        .onTapGesture(count: 1, perform: {
                            // 觸控觸發
                            updateTask(task)
                        })
                }.onDelete(perform: deleteTasks)
            }
            .navigationTitle("Todo List 📝")
            .navigationBarItems(trailing: Button("Add Task"){
                addTask()
            })
        }
    }
    private func saveContext(){
        
        do {
            try viewContext.save()
        }catch{
            let error = error as NSError
            fatalError("Unresolved Error : \(error)")
        }
    }
    private func updateTask(_ task: FetchedResults<Task>.Element){
        withAnimation{
            task.title = "Updated"
            saveContext()
            
        }
    }
    
    private func deleteTasks(offsets: IndexSet){
        withAnimation{
            offsets.map{tasks[$0]}.forEach(viewContext.delete)
            saveContext()
        }
    }
    
    private func addTask(){
        withAnimation {
            let newTask = Task (context: viewContext)
            newTask.title = "Bew task \(Date())"
            newTask.date = Date()
            
            saveContext()
        }
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
