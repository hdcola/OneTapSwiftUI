import SwiftUI

fileprivate enum AlignmentType: String,CaseIterable,Identifiable{
    case center = ".center"
    case leading = ".leading"
    case trailing = ".trailing"
    
    var id: Self { self }
    var caseValue: HorizontalAlignment {
        switch self{
        case .center:
            return .center
        case .leading:
            return .leading
        case .trailing:
            return .trailing
        }
    }
}


struct VStackView: View {
    @State private var alignment: AlignmentType = .center
    @State var spacing = DoubleOption(name: "spacing", value: 8, defaultValue: 8, range: -10...50)
    
    @State private var selectedPreview: PreviewType = .preview
    
    var spacingString:String{
        return spacing.active ? ", spacing:\(spacing.valueString)" : ""
    }
    
    var code: String{ return """
VStack(alignment: \(alignment.rawValue)\(spacingString)) {
    RoundedRectangle(cornerRadius: 20)
        .fill(.purple)
        .frame(width: 50, height: 40)
    RoundedRectangle(cornerRadius: 20)
        .fill(.mint)
        .frame(width: 200, height: 40)
    RoundedRectangle(cornerRadius: 20)
        .fill(.blue)
        .frame(width: 90, height: 40)
}
"""
    }
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                VStack(spacing: 40){
                    CodePreviewView(code: code)
                    HStack{
                        Spacer()
                        VStack(
                            alignment: alignment.caseValue, 
                            spacing: spacing.active ? spacing.value : nil
                        ){
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.purple)
                                .frame(width: 50, height: 40)
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.mint)
                                .frame(width: 200, height: 40)
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.blue)
                                .frame(width: 90, height: 40)
                        }
                        Spacer()
                    }
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text("alignment:")
                                .bold()
                            ForEach(AlignmentType.allCases){ alignmentType in
                                Button(alignmentType.rawValue){
                                    withAnimation { 
                                        alignment = alignmentType
                                    }
                                }.buttonStyle(.borderedProminent)
                            }
                        }
                        DoubleOptionView(option: $spacing)
                    }
                }
            }
        .padding()
        }
    }
}

struct VStackView_Previews: PreviewProvider {
    static var previews: some View {
        VStackView()
    }
}
