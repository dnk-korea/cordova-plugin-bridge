import Foundation
@objc(Bridge) class Bridge : CDVPlugin {
    func test(_  command: CDVInvokedUrlCommand ){
        print("test")
        print( command.arguments[0] )
    }
    func saveFile(_  command: CDVInvokedUrlCommand){
        print("saveFile")
        print( command.arguments[0] )
    }
    func saveRefFile(_  command: CDVInvokedUrlCommand){
        print("saveRefFile")
        print( command.arguments[0] )
    }
    func getFile(_  command: CDVInvokedUrlCommand){
        print("getFile")
        print( command.arguments[0] )
    }
    func getRefFile(_  command: CDVInvokedUrlCommand){
        print("getRefFile")
        print( command.arguments[0] )
    }
    func deleteFile(_  command: CDVInvokedUrlCommand){
        print("deleteFile")
        print( command.arguments[0] )
    }
    func deleteRefFile(_  command: CDVInvokedUrlCommand){
        print("deleteRefFile")
        print( command.arguments[0] )
    }
    func deleteAllFile(_  command: CDVInvokedUrlCommand){
        print("deleteAllFile")
        print( command.arguments[0] )
    }
}
