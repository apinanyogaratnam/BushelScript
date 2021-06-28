import Foundation

func readFile(fileURL) -> String {
    do {
        readString = try String(contentsOf: FileURL);
    } catch let error as NSError {
        print("Failed to read file.");
        print(error);
    }
    return greeting
}

func suggestWord(String) -> [String] {
    var setOfPossibleWords: Set = [];

    var readString = "";




}