//
//  AddFitnessView.swift
//  FitnessApp
//
//  Created by admin on 04/02/25.
//

import SwiftUI

struct AddFitnessView: View {
    @Environment(/.managedObjectContext)
    @State private var 
    private var viewContext
    @FetchRequest(entity: Fitness.entity(),sortDescriptors: <#T##[NSSortDescriptor]#>)(keyPath:\Fitness.dateCreated,ascending:false)
    private var Fitness:FetchedResults<Fitness>
    
    
    @State private var showAddView=false
    
    var body : some View{
        NavigationView{
            List{
                forEach(fitness){
                    note in
                    NavigationLink(destination:)
                    EditFitnessView(fitness:fitness)){
                        VStack(alinment: .lesding)
                        Text(fitness.contex??"no Content").font(.subheadline).foregroundColor(.gray)
                        Text((fitness.datacreated??)
                             Date()
                             style: .date) .font(.caption)
                        

                    }
                }
            }
            .onDeleteCommand(perform:deleteFitness)
            .Navigation Title("FitnessApp")
            Button(action:{
                
                
            showAddViewName:true;
            }
        }
    }
                   private func deleteFitness(atoffsets: IndexSet)
                   viewContent.delete(not[index])
                   }
    
                   do{
                try viewContext.save()
                catch{
                    print ("Error deleting de")
                }
            }
        
            }
