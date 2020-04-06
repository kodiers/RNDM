//
//  Comment.swift
//  RNDM
//
//  Created by Viktor Yamchinov on 03.04.2020.
//  Copyright © 2020 Viktor Yamchinov. All rights reserved.
//

import Foundation
import Firebase

class Comment {
    private(set) var username: String!
    private(set) var timestamp: Date!
    private(set) var commentTxt: String!
   
   init(username: String, timestamp: Date, commentTxt: String) {
       self.username = username
       self.timestamp = timestamp
       self.commentTxt = commentTxt
   }
   
   class func parseData(snapshot: QuerySnapshot?) -> [Comment] {
       var comments = [Comment]()
       guard let snap = snapshot else {
           return comments
       }
       for document in snap.documents {
           let data = document.data()
           let username = data[USERNAME] as? String ?? "Anonymous"
           let timestamp = data[TIMESTAMP] as? Date ?? Date()
           let commentTxt = data[COMMENT_TXT] as? String ?? ""
           let newComment = Comment(username: username, timestamp: timestamp, commentTxt: commentTxt)
           comments.append(newComment)
       }
       return comments
   }
}
