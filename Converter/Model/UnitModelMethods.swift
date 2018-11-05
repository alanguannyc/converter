/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 Helper methods for providing and consuming drag-and-drop data.
 */

import UIKit
import MobileCoreServices
import RealmSwift

extension UnitModel {
    /**
     A helper function that serves as an interface to the data model,
     called by the implementation of the `tableView(_ canHandle:)` method.
     */
    func canHandle(_ session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: NSString.self)
    }
    
    /**
     A helper function that serves as an interface to the data mode, called
     by the `tableView(_:itemsForBeginning:at:)` method.
     */
    func dragItems(for indexPath: IndexPath, for item: Results<UnitItem>) -> [UIDragItem] {
//        let placeName = placeNames[indexPath.row]
        let itemName = item[indexPath.row].name
        
        let data = itemName.data(using: .utf8)
        let itemProvider = NSItemProvider()
        
        itemProvider.registerDataRepresentation(forTypeIdentifier: kUTTypePlainText as String, visibility: .all) { completion in
            completion(data, nil)
            return nil
        }
        
        return [
            UIDragItem(itemProvider: itemProvider)
        ]
    }
}
