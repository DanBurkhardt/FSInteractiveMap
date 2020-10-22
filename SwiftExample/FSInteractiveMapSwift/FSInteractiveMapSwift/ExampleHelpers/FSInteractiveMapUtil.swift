// File.swift
//
// Created by GigabiteLabs on 10/22/20
// Swift Version: 5.0
// Copyright © 2020 GigabiteLabs. All rights reserved.
//

import Foundation

/// A public convenience typealise for `FSInteractiveMapUtil`.
public typealias FSUtil = FSInteractiveMapUtil
/// A singleton utility for easy access and information and
/// type conversions related to the FSInteractiveMapVIew.
public class FSInteractiveMapUtil {
    /// Retrieves the English languague name for a given (supported)
    /// SVG layer name.
    ///
    /// - Parameters:
    ///     - id: the string id of the svg layer name
    ///
    /// - Returns: String? representing the human-readable
    /// name of the SVG layer id. Returns nil if an invalid ID or if
    /// no supported name exists.
    ///
    func nameFor(id: String?) -> String? {
        guard let id = id else {
            return nil
        }
        switch id.contains("US-") {
        case true:
            let slicedId = id.components(separatedBy: "-").last
            for (key, value) in USStates {
                if value == slicedId {
                    return key
                }
            }
            return nil
        default:
            return nil
        }
    }
}
