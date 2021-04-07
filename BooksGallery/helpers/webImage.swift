//
//  webImage.swift
//  BooksGallery
//
//  Created by Retaj Al-Otaibi on 2/15/21.
//

import Foundation
import UIKit
import SwiftUI

struct ContainerRelativeShapeSpecificCorner: Shape {

    private let corners: [UIRectCorner]

    init(corner: UIRectCorner...) {
        self.corners = corner
    }

    func path(in rect: CGRect) -> Path {
        var p = ContainerRelativeShape().path(in: rect)

        if corners.contains(.allCorners) {
            return p
        }

        if !corners.contains(.topLeft) {
            p.addPath(Rectangle().path(in: CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.width / 2, height: rect.height / 2)))
        }
        if !corners.contains(.topRight) {
            p.addPath(Rectangle().path(in: CGRect(x: rect.origin.x + rect.width / 2, y: rect.origin.y, width: rect.width / 2, height: rect.height / 2)))
        }
        if !corners.contains(.bottomLeft) {
            p.addPath(Rectangle().path(in: CGRect(x: rect.origin.x, y: rect.origin.y + rect.height / 2, width: rect.width / 2, height: rect.height / 2)))
        }
        if !corners.contains(.bottomRight) {
            p.addPath(Rectangle().path(in: CGRect(x: rect.origin.x + rect.width / 2, y: rect.origin.y + rect.height / 2, width: rect.width / 2, height: rect.height / 2)))
        }
        return p
    }
}
