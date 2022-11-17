//
//  CachedFriend+CoreDataProperties.swift
//  FriendFace
//
//  Created by Derya Antonelli on 17/11/2022.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var origin: CachedUser?
    
    public var wrappedId: String {
        return id ?? "Unknown"
    }
    
    public var wrappedName: String {
        return name ?? "Unknown"
    }

}

extension CachedFriend : Identifiable {

}
