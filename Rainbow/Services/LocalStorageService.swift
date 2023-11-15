//
//  LocalStorageService.swift
//  Rainbow
//
//  Created by Alexandr Rodionov on 14.11.23.
//

import Foundation

enum Keys: String {
    case settings
}

final class LocalStorageService {
    
    private init() {}
    static let shared = LocalStorageService()
    
    
    func saveSettings(settings: SettingsModel, name: Keys.RawValue) {
        save(settings, key: name)
    }
    
    func loadSettings(settingsName: Keys.RawValue) -> SettingsModel? {
        load(key: settingsName)
    }
    
    // MARK: - private save / load methods
    
    private func save<T: Codable>(_ object: T, key: String) {
        do {
            let data = try JSONEncoder().encode(object)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("\(T.Type.self) saving failed")
        }
    }
    
    private func load<T: Codable>(key: String) -> T? {
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        
        do {
            let object = try JSONDecoder().decode(T.self, from: data)
            return object
        } catch {
            print("\(T.Type.self) loading failed")
            return nil
        }
    }
}
