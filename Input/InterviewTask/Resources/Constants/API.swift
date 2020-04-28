//
//  Constants.swift
//  InterviewTask
//

import Foundation


enum API{
    
    case photo
    
    var url: URL{
        return URL(string: "https://picsum.photos/200")!
    }
    
}
