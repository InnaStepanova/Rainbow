//
//  LocalStorageService.swift
//  Rainbow
//
//  Created by Alexandr Rodionov on 14.11.23.
//

import Foundation

enum Keys: String {
    case settings
    case statistics
}

final class LocalStorageService {
    
    private init() {}
    static let shared = LocalStorageService()
    
    // MARK: methods for saving / loading game SETTINGS
    func saveSettings(settings: SettingsModel, name: Keys.RawValue) {
        save(settings, key: name)
    }
    
    func loadSettings(settingsName: Keys.RawValue) -> SettingsModel? {
        load(key: settingsName)
    }
    
    // MARK: methods for saving / loading / deleting game STATISTICS
    func saveStatistics(_ statistics: [StatisticModel], key: Keys.RawValue) {
        save(statistics, key: key)
    }
    
    func loadStatistics(key: Keys.RawValue) -> [StatisticModel]? {
        load(key: key)
    }
    
    func clearStatistics() {
        UserDefaults.standard.removeObject(forKey: Keys.statistics.rawValue)
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
