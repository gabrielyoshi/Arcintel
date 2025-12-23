//
//  ArchiveItemEditorView.swift
//  Arcintel
//
//  Created by Claudia&Gabe  on 12/23/25.
//

import SwiftUI
import SwiftData

struct ArchiveItemEditorView: View {
    // Connects the UI to your SwiftData model
    @Bindable var item: ArchiveItem
    
    var body: some View {
        VStack(spacing: 0) {
            // 1. Title Editor
            TextField("Title", text: $item.title, axis: .vertical)
                .font(.title2)
                .fontWeight(.bold)
                .textFieldStyle(.plain)
                .padding()
                .background(Color(.systemBackground))
            
            Divider()
            
            // 2. Main Content Editor
            TextEditor(text: $item.content)
                .font(.body)
                .padding()
                .scrollContentBackground(.hidden) // Removes default gray background
                .background(Color(.systemBackground))
            
            Divider()
            
            // 3. Refined Metadata Footer
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Created: \(item.timestamp, format: .dateTime)")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    
                    if let urlString = item.sourceUrl, !urlString.isEmpty {
                        Text(urlString)
                            .font(.caption)
                            .foregroundColor(.blue)
                            .lineLimit(1)
                    }
                }
                
                Spacer()
                
                // Interactive Actions
                HStack(spacing: 20) {
                    // Safari Link Button
                    if let urlString = item.sourceUrl, let url = URL(string: urlString) {
                        Link(destination: url) {
                            Image(systemName: "safari")
                                .font(.title3)
                                .foregroundStyle(.blue)
                        }
                    }

                    // Favorite Toggle
                    Button(action: {
                        item.isFavorite.toggle()
                    }) {
                        Image(systemName: item.isFavorite ? "star.fill" : "star")
                            .font(.title3)
                            .foregroundColor(item.isFavorite ? .yellow : .secondary)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding()
            .background(.ultraThinMaterial) // Modern blurred glass effect
        }
        .navigationTitle("Edit Archive")
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }
}

// Preview setup for the VS Code or Xcode canvas
#Preview {
    NavigationStack {
        ArchiveItemEditorView(item: ArchiveItem(
            title: "Sample Archive",
            content: "This is what your chat or webpage archive looks like.",
            sourceUrl: "https://apple.com",
            isFavorite: true
        ))
    }
    .modelContainer(for: ArchiveItem.self, inMemory: true)
}
