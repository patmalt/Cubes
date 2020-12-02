//
//  ContentView.swift
//  Cubes
//
//  Created by Patrick Maltagliati on 12/1/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Cubes().mask(LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .top, endPoint: .bottom))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.all, edges: [.top, .bottom])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class CubesView: UIView {
    private let rowReplicator = CAReplicatorLayer()
    private let cubeReplicator = CAReplicatorLayer()
    private let cudeReplicatorInstanceLayer = CAShapeLayer()
    private let size: CGFloat = 60

    override init(frame: CGRect) {
        super.init(frame: frame)
        cudeReplicatorInstanceLayer.anchorPoint = CGPoint(x: 0.5, y: 1)
        cudeReplicatorInstanceLayer.fillColor = UIColor.clear.cgColor
        cudeReplicatorInstanceLayer.strokeColor = UIColor.lightGray.withAlphaComponent(0.4).cgColor
        cubeReplicator.addSublayer(cudeReplicatorInstanceLayer)
        rowReplicator.addSublayer(cubeReplicator)
        layer.addSublayer(rowReplicator)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let numberOfCubes = Int(ceil(bounds.width / (size)))
        let numberOfRows = Int(ceil(bounds.height / (size)))
        let rect = CGRect(x: 0, y: 0, width: size, height: size)
        cudeReplicatorInstanceLayer.frame.size = rect.size
        cudeReplicatorInstanceLayer.path = CGPath.cube(in: rect)
        cubeReplicator.instanceCount = numberOfCubes
        cubeReplicator.instanceTransform = CATransform3DMakeTranslation(size, 0, 0)
        cubeReplicator.frame.size = bounds.size
        rowReplicator.instanceTransform = CATransform3DMakeTranslation(0, size, 0)
        rowReplicator.instanceCount = numberOfRows
        rowReplicator.frame = bounds
    }
}

extension CGPath {
    static func cube(in rect: CGRect) -> CGPath {
        let bezierPath = UIBezierPath()

        bezierPath.move(to: CGPoint(x: 0.0 * rect.width, y: 0.1912 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 0.50 * rect.width, y: 0.0 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 0.0 * rect.width, y: 0.1912 * rect.height))
        bezierPath.close()

        bezierPath.move(to: CGPoint(x: 0.9991 * rect.width, y: 0.1912 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 0.4991 * rect.width, y: 0.0 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 0.9991 * rect.width, y: 0.1912 * rect.height))
        bezierPath.close()

        bezierPath.move(to: CGPoint(x: 0.9982 * rect.width, y: 0.1912 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 0.50 * rect.width, y: 0.4234 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 0.9982 * rect.width, y: 0.1912 * rect.height))
        bezierPath.close()

        bezierPath.move(to: CGPoint(x: 0.0036 * rect.width, y: 0.1912 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 0.5018 * rect.width, y: 0.4234 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 0.0036 * rect.width, y: 0.1912 * rect.height))
        bezierPath.close()

        bezierPath.move(to: CGPoint(x: 0.9982 * rect.width, y: 0.7678 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 0.50 * rect.width, y: 1.0 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 0.9982 * rect.width, y: 0.7678 * rect.height))
        bezierPath.close()

        bezierPath.move(to: CGPoint(x: 0.0018 * rect.width, y: 0.7678 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 0.50 * rect.width, y: 1.0 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 0.0018 * rect.width, y: 0.7678 * rect.height))
        bezierPath.close()

        bezierPath.move(to: CGPoint(x: 0.50 * rect.width, y: 1 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 0.5036 * rect.width, y: 0.4234 * rect.height))
        bezierPath.move(to: CGPoint(x: 0.9964 * rect.width, y: 0.7678 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 1.0 * rect.width, y: 0.1912 * rect.height))
        bezierPath.move(to: CGPoint(x: 0.0 * rect.width, y: 0.7678 * rect.height))
        bezierPath.addLine(to: CGPoint(x: 0.0036 * rect.width, y: 0.1912 * rect.height))

        return bezierPath.cgPath
    }
}

struct Cubes: UIViewRepresentable {
    typealias UIViewType = CubesView

    func makeUIView(context: Context) -> CubesView {
        CubesView()
    }

    func updateUIView(_ uiView: CubesView, context: Context) {}
}
