//
//  Constants.swift
//  InterviewTask
//
//

import Foundation


enum API{
    
    case photo(number: Int)
    
    var url: URL {
        switch self {
        case .photo(let number):
            return URL(string: "https://picsum.photos/\(number)")! // comment: На самом деле API было верным. Ресурс выдаёт РАНДОМНОЕ изображение, а последний /path, судя по всему, нужен для указания размера, а не порядкового номера, как я думал. В любом случае, я доработал API до более привычного и частоиспользуемого вида
        }
    }
}
