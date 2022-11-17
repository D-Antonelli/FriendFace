//
//  CachedUser+CoreDataProperties.swift
//  FriendFace
//
//  Created by Derya Antonelli on 17/11/2022.
//
//

import Foundation
import CoreData


extension CachedUser {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }
    
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var age: Int32
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var about: String?
    @NSManaged public var registered: String?
    @NSManaged public var tags: String?
    @NSManaged public var id: String?
    @NSManaged public var cachedFriend: NSSet?
    
    public var wrappedName: String {
        return name ?? "Unknown"
    }
    
    public var wrappedCompany: String {
        return company ?? "Unknown"
    }
    
    public var wrappedEmail: String {
        return email ?? "Unknown"
    }
    
    public var wrappedAddress: String {
        return address ?? "Unknown"
    }
    
    public var wrappedAbout: String {
        return about ?? "Unknown"
    }

    public var wrappedRegistered: String {
        return registered ?? "Unknown"
    }
    
    public var wrappedTags: String {
        return tags ?? "Unknown"
    }
    
    public var wrappedId: String {
        return id ?? "Unknown"
    }
    
    public var friendsArray: Array<CachedFriend> {
        let set = cachedFriend ?? NSSet()
        return Array(set as! Set<CachedFriend>)
    }
}

// MARK: Generated accessors for cachedFriend
extension CachedUser {

    @objc(addCachedFriendObject:)
    @NSManaged public func addToCachedFriend(_ value: CachedFriend)

    @objc(removeCachedFriendObject:)
    @NSManaged public func removeFromCachedFriend(_ value: CachedFriend)

    @objc(addCachedFriend:)
    @NSManaged public func addToCachedFriend(_ values: NSSet)

    @objc(removeCachedFriend:)
    @NSManaged public func removeFromCachedFriend(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
