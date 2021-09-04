//
//  CodableExtension.swift
//  JsonClassSaver
//
//  Created by Gáudio Ney on 22/08/21.

import CloudKit // For decode CKAsset as a valid Data type convertible to otiginal asset type
import os.log

enum FileManageError:Error {
	case canNotSaveInFile
	case canNotReadFile
	case canNotConvertData
	case canNotDecodeData
	case canNotEncodeData
}

extension Error {
	public var asString:String {
		return String(describing: self)
	}
}


extension Encodable {

	private var jSONSerializationDefaultReadingOptions:JSONSerialization.ReadingOptions {
		[JSONSerialization.ReadingOptions.allowFragments, JSONSerialization.ReadingOptions.mutableContainers, JSONSerialization.ReadingOptions.mutableLeaves]
	}
	
	var asString:String? {
		return self.jsonData?.toText
	}
	
	var jsonData:Data? {
		do {
			return try JSONEncoder().encode(self)
		} catch {}
		return nil
	}
	
	var asDictionary:[String: Any]? {
		if let data = self as? Data { return data.toDictionary as? [String: Any] } // is type IS Data.type, properly convert

		guard let json:Data  = self.jsonData,
			  let jsonObject = try? JSONSerialization.jsonObject(with: json, options: jSONSerializationDefaultReadingOptions) else {
				os_log("Cannot Decode %@ type as Dictionary", type:.error, String(describing: type(of:self)))
			return nil
		}
		// if jsonObject is OK
		if let dic = jsonObject as? [String: Any] {
			return dic
		}
		// else if is an Array
		if let value = jsonObject as? [Any] {
			let key = String(describing: type(of:self))
			return [key:value]
		}
		// else
		os_log("Cannot Decode this type as Dictionary", type:.error)
		return nil
	}
	
	var asArray:[Any]? {
		do {
			return try JSONSerialization.jsonObject(with: JSONEncoder().encode(self), options:jSONSerializationDefaultReadingOptions) as? [Any]
		} catch {
			os_log("Cannot Decode %@ type as Array", type:.error, String(describing: type(of:self)))
		}
		return nil
	}
	
	func save(in file:String? = nil)throws {
		// generates URL for documentDir/file.json
		let documentDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
		let fileName = file ?? String(describing: type(of: self))
		let url = URL(fileURLWithPath: documentDir.appendingPathComponent(fileName+".json"))
		try self.save(in: url)
	}
	
	func save(in url:URL) throws {
		// Try to save
		do {
			try JSONEncoder().encode(self).write(to: url)
			os_log("Saved in %@", type:.info, String(describing: url))
		} catch {
			os_log("Can not save in %@", type:.error, String(describing: url))
			throw FileManageError.canNotSaveInFile
		}
	}
}

extension Decodable {
	
	/// Mutating Loads
	mutating func load(from data:Data) throws {
		self = try Self.load(from: data)
	}
	
	mutating func load(from url:URL) throws {
		self = try Self.load(from: url)
	}
	
	mutating func load(from file:String? = nil) throws {
		self = try Self.load(from: file)
	}
	
	mutating func load(fromStringData stringData:String) throws {
		self = try Self.load(from: stringData)
	}
	
	mutating func load(from dictionary:[String:Any]) throws {
		try self = Self.load(from: dictionary)
	}
	
	mutating func load(from array:[Any]) throws {
		try self = Self.load(from: array)
	}
	
	/// Static Loads
	static func load(from data:Data)throws ->Self {
		// Try to read
		do {
			return try JSONDecoder().decode(Self.self, from: data)
		} catch {
			os_log("Can not read from %@", type:.error, String(describing: data))
			throw FileManageError.canNotConvertData
		}
	}
	
	static func load(from url:URL) throws  ->Self {
		// Try to read
		do {
			let data = try Data(contentsOf: url)
			return try Self.load(from: data)
		} catch {
			os_log("Can not read from %@", type:.error, String(describing: url))
			throw FileManageError.canNotReadFile
		}
	}

	static func load(from file:String? = nil)throws ->Self {
		return try Self.load(from: Self.url(from: file))
	}
	
	static func load(fromString stringData:String)throws ->Self{
		guard let data = stringData.data(using: .utf8) else {
			os_log("Can not read from %@", type:.error, stringData)
			throw FileManageError.canNotConvertData
		}
		do {
			return try load(from: data)
		} catch {
			os_log("Can not read from %@", type:.error, stringData)
			throw FileManageError.canNotConvertData
		}
	}
	
	static func load(from dictionary:[String:Any])throws ->Self{
		do {
			guard let data:Data =
				(dictionary[String(describing: self)] as? [Any])?.asData ?? // if data is Array, or
					dictionary.asData // if data is Dictionary
				else { throw FileManageError.canNotConvertData } // else throw error to catch
			return try Self.load(from: data)
		} catch let error {
			os_log("Can not convert from dictionary to %@", type:.error, String(describing: Self.self))
			throw error
		}
	}
	
	static func load(from array:[Any])throws ->Self{
		do {
			guard let data = array.asData else { throw FileManageError.canNotConvertData }
			return try Self.load(from: data)
		} catch {
			os_log("Can not convert from array to %@", type:.error, String(describing: Self.self))
			throw FileManageError.canNotConvertData
		}
	}
	
	static private func url(from file:String? = nil)->URL {
		// generates URL for documentDir/file.json
		if let fileName = file {
			if fileName.lowercased().hasPrefix("http") {
				return URL(string: fileName) ?? URL(fileURLWithPath: fileName)
			} //else
			return URL(fileURLWithPath: fileName)
		} else {
			let fileName = String(describing: Self.self)
			let documentDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
			return URL(fileURLWithPath: documentDir.appendingPathComponent(fileName+".json"))
		}
	}
	
}


/// Type Extensions
extension Data {
	
	public var toText:String {
		return String(data: self, encoding: .utf8) ?? #""ERROR": "cannot decode into String"""#
	}
	
	public var toDictionary:[AnyHashable:Any] {
		if let dictionary = try? JSONSerialization.jsonObject(with: self, options: .mutableContainers) as? [AnyHashable: Any] {
			return dictionary
		}
		// else
		
		if let array = self.asArray as? Codable {
			return ["Array":array]
		}
		// else
		return ["ERROR":"cannot decode into dictionary"]
	}
	
	public var toArray:[Codable]? {
		return try? JSONSerialization.jsonObject(with: self, options: .mutableContainers) as? [Codable]
	}
	
	public func convert<T>(to:T.Type) throws ->T where T:Codable {
		// Try to convert
		do {
			return try JSONDecoder().decode(T.self, from: self)
		} catch {
			os_log("Can not convert this: %@", type:.error, String(describing: self))
			throw FileManageError.canNotDecodeData
		}
	}
	
	/// Saves data in a file in default.temporaryDirectory, returning URL
	func saveInTemp()throws->URL {
		let tmpDirURL = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString+".data")
		try self.write(to: tmpDirURL)
		return tmpDirURL
	}
	
}

extension URL {
	var contentAsData:Data? {
		return try? Data(contentsOf: self)
	}
}


extension Array {
	var asData:Data? {
		return try? JSONSerialization.data(withJSONObject: self, options: [])
	}
}

extension Dictionary where Key == String {
	var asData:Data? {
		return try? JSONSerialization.data(withJSONObject: self, options: [])
	}
	
}
