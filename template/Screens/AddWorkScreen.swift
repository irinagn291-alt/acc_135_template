import SwiftUI
import PhotosUI

struct _XGm0200Bl: View {
    @EnvironmentObject private var _xGm0006: _XGm0031Bl
    @Environment(\.dismiss) private var dismiss

    @State private var _xGm0201 = ""
    @State private var _xGm0202 = ""
    @State private var _xGm0203 = ""
    @State private var _xGm0204 = ""
    @State private var _xGm0205: _XGm0004Bl = ._xPm0001
    @State private var _xGm0206: PhotosPickerItem?
    @State private var _xGm0207: Data?

    private var _xGm0208: Bool { !_xGm0201.trimmingCharacters(in: .whitespaces).isEmpty }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    _xGm0209
                    _xGm0210("Title", "Untitled work", $_xGm0201)
                    _xGm0210("Artist", "Unknown artist", $_xGm0202)
                    _xGm0210("Date or period", "e.g. 1889", $_xGm0203)
                    _xGm0211
                    _xGm0212
                }
                .padding(24)
            }
            .background(_XGm0032Bl._xGm0103.ignoresSafeArea())
            .navigationTitle("New entry")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) { Button("Cancel") { dismiss() } }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save", action: _xGm0213).disabled(!_xGm0208)
                }
            }
            .tint(_XGm0032Bl._xGm0106)
            .task(id: _xGm0206) {
                if let d = try? await _xGm0206?.loadTransferable(type: Data.self) { _xGm0207 = d }
            }
        }
    }

    private var _xGm0209: some View {
        PhotosPicker(selection: $_xGm0206, matching: .images) {
            ZStack {
                _XGm0032Bl._xGm0105
                if let d = _xGm0207, let ui = UIImage(data: d) {
                    Image(uiImage: ui).resizable().aspectRatio(contentMode: .fill)
                } else {
                    VStack(spacing: 10) {
                        Image(systemName: "photo.badge.plus").font(.system(size: 32, weight: .light))
                        Text("Add a photo").font(_XGm0033Bl._xGm0008(13))
                    }.foregroundStyle(_XGm0032Bl._xGm0107)
                }
            }
            .frame(height: 220).frame(maxWidth: .infinity).clipped()
            .overlay(Rectangle().strokeBorder(_XGm0032Bl._xGm0110, lineWidth: 1))
        }
    }

    private func _xGm0210(_ label: String, _ hint: String, _ text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label.uppercased()).font(_XGm0033Bl._xGm0008(11)).tracking(1.5).foregroundStyle(_XGm0032Bl._xGm0107)
            TextField("", text: text, prompt: Text(hint).foregroundStyle(_XGm0032Bl._xGm0109))
                .font(_XGm0033Bl._xGm0027(16)).foregroundStyle(_XGm0032Bl._xGm0106)
                .padding(.vertical, 10)
                .overlay(Rectangle().fill(_XGm0032Bl._xGm0110).frame(height: 1), alignment: .bottom)
        }
    }

    private var _xGm0211: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("NOTE").font(_XGm0033Bl._xGm0008(11)).tracking(1.5).foregroundStyle(_XGm0032Bl._xGm0107)
            TextField("", text: $_xGm0204, prompt: Text("Why this piece matters to you…").foregroundStyle(_XGm0032Bl._xGm0109), axis: .vertical)
                .font(_XGm0033Bl._xGm0027(15)).foregroundStyle(_XGm0032Bl._xGm0106).lineLimit(3...6)
                .padding(12).overlay(Rectangle().strokeBorder(_XGm0032Bl._xGm0110, lineWidth: 1))
        }
    }

    private var _xGm0212: some View {
        HStack(spacing: 0) {
            ForEach(_XGm0004Bl.allCases) { p in
                let on = _xGm0205 == p
                Button { _xGm0205 = p } label: {
                    Text(p._xGm0008).font(_XGm0033Bl._xGm0008(14))
                        .foregroundStyle(on ? _XGm0032Bl._xGm0103 : _XGm0032Bl._xGm0106)
                        .frame(maxWidth: .infinity).frame(height: 48)
                        .background(on ? _XGm0032Bl._xGm0106 : Color.clear)
                }
                if p != _XGm0004Bl.allCases.last { Rectangle().fill(_XGm0032Bl._xGm0106).frame(width: 1) }
            }
        }
        .overlay(Rectangle().strokeBorder(_XGm0032Bl._xGm0106, lineWidth: 1))
    }

    private func _xGm0213() {
        var imageURL: String?
        if let d = _xGm0207 { imageURL = _xGm0214(d) }
        let work = _XGm0006Bl(
            _xGm0016: Int.random(in: Int.min ... -2),
            _xGm0017: _xGm0201.trimmingCharacters(in: .whitespaces),
            _xGm0018: _xGm0202.isEmpty ? nil : _xGm0202,
            _xGm0019: _xGm0203.isEmpty ? nil : _xGm0203,
            _xGm0020: imageURL,
            _xGm0021: imageURL,
            _xGm0022: nil,
            _xGm0023: "My own",
            _xGm0024: _xGm0204.isEmpty ? nil : _xGm0204
        )
        let f = _xGm0006._xGm0098(work, at: _xGm0205)
        if !_xGm0204.isEmpty { _xGm0006._xGm0100(ref: work._xGm0016) { $0._xGm0014 = _xGm0204 } }
        _ = f
        dismiss()
    }

    private func _xGm0214(_ data: Data) -> String? {
        let name = "gallea_\(UUID().uuidString).jpg"
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = dir.appendingPathComponent(name)
        let img = UIImage(data: data)
        let out = img?.jpegData(compressionQuality: 0.85) ?? data
        try? out.write(to: url)
        return url.absoluteString
    }
}
