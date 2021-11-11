import Foundation

let templateName = "Module MVVM.xctemplate"
let destinationRelativePath = "/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/Project Templates/iOS/Application"

public func log(_ message: Any) {
    print("\(message)")
}

public func runTemplate() {
    let fileManager = FileManager.default
    let destinationPath = bash(command: "xcode-select", arguments: ["--print-path"]).appending(destinationRelativePath)
    do {
        if !fileManager.fileExists(atPath:"\(destinationPath)/\(templateName)"){
            try fileManager.copyItem(atPath: templateName, toPath: "\(destinationPath)/\(templateName)")
            log("Template installed successfully / テンプレートが正常にインストールされました")
        } else {
            try _ = fileManager.replaceItemAt(URL(fileURLWithPath:"\(destinationPath)/\(templateName)"), withItemAt: URL(fileURLWithPath:templateName))
            log("The template already exists. So has been replaced succesfully / テンプレートはすでに存在します。そのため、正常に置き換えられました。")
        }
    } catch let error as NSError {
        log("Error! something went wrong: \(error.localizedFailureReason!)")
    }
}

public func shell(launchPath: String, arguments: [String]) -> String {
    let task = Process()
    let pipe = Pipe()
    task.launchPath = launchPath
    task.arguments = arguments
    task.standardOutput = pipe
    task.launch()
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: String.Encoding.utf8)!
    if output.count > 0 {
        let lastIndex = output.index(before: output.endIndex)
        return String(output[output.startIndex ..< lastIndex])
    }
    return output
}

public func bash(command: String, arguments: [String]) -> String {
    let whichPathForCommand = shell(launchPath: "/bin/bash", arguments: ["-l", "-c", "which \(command)"])
    return shell(launchPath: whichPathForCommand, arguments: arguments)
}

runTemplate()
