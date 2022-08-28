//
//  PubnubManager.swift
//  PubnubPoc
//
//  Created by Theonetech on 28/08/22.
//

import Foundation
import PubNub

class PubNubManager {
    
    enum channelName: String {
        case textMessage
    }
    
    static func pubNubLogLevel() {
        PubNub.log.levels = [.all]
        PubNub.log.writers = [ConsoleLogWriter(), FileLogWriter()]
    }
    
    static func configPubNub() -> PubNub {
        var config = PubNubConfiguration(
            publishKey: AppConstant.pubNubPublishKey,
            subscribeKey: AppConstant.pubNubSubscribeKey,
            userId: "myUniqueUserId"
        )
        debugPrint("\(#function) \(AppConstant.shared.getUUID)")
        config.uuid = AppConstant.shared.getUUID
        return PubNub(configuration: config)
    }
    
    static func sendMessageToChannel(pubNub: PubNub, message: String) {
        pubNub.publish(
            channel: channelName.textMessage.rawValue,
            message: ["text": message]
        ){ result in
            switch result {
                case let .success(response):
                    debugPrint("succeeded: \(response)")
                case let .failure(error):
                    debugPrint("failed: \(error.localizedDescription)")
            }
        }
    }
    
    static func subscribeChannel(pubNub: PubNub) {
        pubNub.subscribe(to: [channelName.textMessage.rawValue])
        listenSubscribe(pubNub: pubNub)
    }
    
    static func listenSubscribe(pubNub: PubNub) {
        let listener = SubscriptionListener()
        
        DispatchQueue.main.async {
            listener.didReceiveSubscription = { event in
                switch event {
                    case let .messageReceived(message):
                        debugPrint("Message Received: \(message) Publisher: \(message.publisher ?? "defaultUUID")")
                    default:
                        break
                }
            }
            pubNub.add(listener)
        }
        
    }
    
}
