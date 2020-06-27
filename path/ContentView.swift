//
//  ContentView.swift
//  path
//
//  Created by Ajith Kumar on 26/06/20.
//  Copyright © 2020 Ajith Kumar. All rights reserved.
//

import SwiftUI

struct TaskList : Identifiable{
    var id : Int
    var name : String
    var tasks : [String]
}
struct ContentView: View {
    let taskLists : [TaskList] = [
        TaskList(id: 1, name: "Backlog", tasks: ["Task 1","Task 2","Task 3"] ),
        TaskList(id: 2, name: "In Progress", tasks: ["Task 4","Task 5"] ),
        TaskList(id: 3, name: "Completed", tasks: ["Task 6","Task 7","Task 8","Task 9"] ),
        TaskList(id: 4, name: "Unassigned" ,tasks: ["Task 11","Task 12","Task 13"] ),
    ]
    var body: some View {
        NavigationView{
            ScrollView(){
                CalendarWidget()
                ScrollView(.horizontal){
                    HStack(alignment: .top, spacing: 15){
                        ForEach(taskLists) { taskListName in
                            TaskListView(tasklist: taskListName)
                        }
                    }.padding()
                }
                Divider()
                Section(header: Text("Summary").fontWeight(.bold).font(.system(size: 15))){
                    GeometryReader { geometry in
                        
                        HStack(spacing: 15){
                            SummaryItemView(count: 4, status: "Due Today", indicator: Color.green)
                                .frame(width: geometry.size.width / 3, height: 50)
                            
                            Spacer()
                            SummaryItemView(count: 32, status: "Completed", indicator: Color.blue)
                                .frame(width: geometry.size.width / 3, height: 50)
                            
                        }.padding()
                    }
                }
            }
            .navigationBarTitle(Text("Frestack"),displayMode: .inline)
            Spacer()
        }
    }
}

struct CalendarWidget: View{
    var body: some View{
        HStack{
            
            VStack{
                Text("Hello Ajith")
                    .fontWeight(.semibold)
                .font(.system(size: 20))
            }
            
            Spacer()

            VStack{
                Text("June").fontWeight(.semibold)
                Text("26th").fontWeight(.semibold)
            }
            .frame(width:60,height: 60)
            .foregroundColor(Color.purple)
            .background(Color.yellow)
            .cornerRadius(15)
        }.padding()
    }
}

struct TaskListView : View{
    var tasklist : TaskList
    var body: some View{
        VStack{
            HStack{
                Text(tasklist.name)
                    .fontWeight(.bold).font(.system(size: 15))
                Button(action:{
                    
                }){
                    Text("+").foregroundColor(.white)
                }
                
            }.padding()
                .background(Color.orange)
                .cornerRadius(15)
            
            VStack{
                ForEach(tasklist.tasks, id: \.self){ task in
                    TaskItemView(task : task)
                }
            }.padding()
                .background(Color.pink)
                .cornerRadius(15)
            Spacer(minLength: 0)
        }
    }
}

struct TaskItemView : View{
    var task : String
    var body: some View{
        Text(task.capitalized).padding()
            .cornerRadius(5)
    }
}


struct SummaryItemView : View{
    var count : Int
    var status : String
    var indicator : Color
    
    var body: some View{
        VStack{
                  Text(status)
                      .fontWeight(.bold).font(.system(size: 15))
            Spacer()
            Text(String(count))
            .fontWeight(.bold).font(.system(size: 15))
//                  Button(action:{
//
//                  }){
//                      Text("+").foregroundColor(.white)
//                  }
                  
              }.padding()
            .background(indicator)
                  .cornerRadius(15)
    }
}




struct Triangle : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x:rect.midX,y:rect.minY))
        path.addLine(to: CGPoint(x:rect.minX,y:rect.maxY))
        path.addLine(to: CGPoint(x:rect.maxX,y:rect.maxY))
        path.addLine(to: CGPoint(x:rect.midX,y:rect.minY))
        return path
        //
        //         Triangle().fill(Color.red)
        //        //            .frame(width: 300, height: 300, alignment: .center)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
