# Obfuscation Report — gmbl_07

**Seed:** `GMBL07`  
**Date:** 2026-06-29  
**Files processed:** 18 Swift files

---

## Summary

| Category | Count |
|---|---|
| Types renamed | 38 |
| Enum cases renamed | 18 |
| Methods/properties renamed | 129 |
| Strings obfuscated | 5 |
| Files modified | 18 |

---

## Naming Convention

- **Types:** `_XGm{NNNN}Bl` (e.g. `_XGm0001Bl`)
- **Methods/Properties:** `_xGm{NNNN}` (e.g. `_xGm0001`)
- **Enum cases:** `_xPm{NNNN}` (e.g. `_xPm0001`)

---

## Type Renames

| Original | Obfuscated | File |
|---|---|---|
| `Doors` | `_XGm0001Bl` | Curator.swift |
| `Curator` | `_XGm0002Bl` | Curator.swift |
| `Atelier` | `_XGm0003Bl` | Curator.swift |
| `Placement` | `_XGm0004Bl` | Frame.swift |
| `Frame` | `_XGm0005Bl` | Frame.swift |
| `Work` | `_XGm0006Bl` | Work.swift |
| `GalleaError` | `_XGm0007Bl` | ArticService.swift |
| `ArtSource` | `_XGm0008Bl` | ArticService.swift |
| `ArticService` | `_XGm0009Bl` | ArticService.swift |
| `SearchHit` | `_XGm0010Bl` | ArticService.swift |
| `RawObject` | `_XGm0011Bl` | ArticService.swift |
| `AboutScreen` | `_XGm0012Bl` | AboutScreen.swift |
| `Leaf` | `_XGm0013Bl` | AboutScreen.swift |
| `GalleaWebSheet` | `_XGm0014Bl` | AboutScreen.swift |
| `ExploreModel` | `_XGm0015Bl` | ExploreScreen.swift |
| `ExploreScreen` | `_XGm0016Bl` | ExploreScreen.swift |
| `GalleryRoute` | `_XGm0017Bl` | GalleryShell.swift |
| `GalleryShell` | `_XGm0018Bl` | GalleryShell.swift |
| `Lightbox` | `_XGm0019Bl` | Lightbox.swift |
| `PlinthIntro` | `_XGm0020Bl` | PlinthIntro.swift |
| `PrimerSpread` | `_XGm0021Bl` | PrimerSpread.swift |
| `Plate` | `_XGm0022Bl` | PrimerSpread.swift |
| `SavedScreen` | `_XGm0023Bl` | SavedScreen.swift |
| `LightboxSeed` | `_XGm0024Bl` | SavedScreen.swift |
| `WorkTile` | `_XGm0025Bl` | WorkViews.swift |
| `WorkImage` | `_XGm0026Bl` | WorkViews.swift |
| `ArtworkImage` | `_XGm0027Bl` | WorkViews.swift |
| `WorkLabel` | `_XGm0028Bl` | WorkViews.swift |
| `GalleryEmpty` | `_XGm0029Bl` | WorkViews.swift |
| `WorkDetail` | `_XGm0030Bl` | WorkDetail.swift |
| `Salon` | `_XGm0031Bl` | Salon.swift |
| `GalleryInk` | `_XGm0032Bl` | GalleryInk.swift |
| `GalleryType` | `_XGm0033Bl` | GalleryInk.swift |
| `GalleryMetric` | `_XGm0034Bl` | GalleryInk.swift |
| `PlacardButtonStyle` | `_XGm0035Bl` | GalleryInk.swift |
| `Web` (private) | `_XGm0036Bl` | AboutScreen.swift |
| `Hall` (nested) | `_XGm0037Bl` | ExploreScreen.swift |
| `ContentView` | `_XGm0038Bl` | ContentView.swift |

---

## Enum Case Renames

| Original | Obfuscated | Note |
|---|---|---|
| `Placement.collected` | `_xPm0001` | Explicit rawValue `"collected"` added |
| `Placement.toVisit` | `_xPm0002` | Explicit rawValue `"toVisit"` added |
| `Doors.plinth` | `_xPm0003` | |
| `Doors.primer` | `_xPm0004` | |
| `Doors.gallery` | `_xPm0005` | |
| `GalleaError.empty` | `_xPm0006` | |
| `GalleaError.offline` | `_xPm0007` | |
| `GalleryRoute.work` | `_xPm0008` | |
| `GalleryRoute.saved` | `_xPm0009` | |
| `GalleryRoute.about` | `_xPm0010` | |
| `Hall.loadingWall` | `_xPm0011` | |
| `Hall.wall` | `_xPm0012` | |
| `Hall.searching` | `_xPm0013` | |
| `Hall.results` | `_xPm0014` | |
| `Hall.bare` | `_xPm0015` | |
| `Hall.fault` | `_xPm0016` | |
| `Leaf.contact` | `_xPm0017` | |
| `Leaf.privacy` | `_xPm0018` | |

---

## String Obfuscation

All sensitive strings are decoded at runtime via a private helper:

```swift
private func _sd(_ b: String) -> String {
    String(data: Data(base64Encoded: b) ?? Data(), encoding: .utf8) ?? ""
}
```

| Original String | Obfuscated As | Location |
|---|---|---|
| `https://collectionapi.metmuseum.org/public/collection/v1` | `_sd("aHR0cHM6Ly9jb2xsZWN0aW9uYXBpLm1ldG11c2V1bS5vcmcvcHVibGljL2NvbGxlY3Rpb24vdjE=")` | `_XGm0009Bl._xGm0029` |
| `Gallea/1.0 (gallea.app)` | `_sd("R2FsbGVhLzEuMCAoZ2FsbGVhLmFwcCk=")` | `_XGm0009Bl._xGm0033` (User-Agent) |
| `https://{API_DOMAIN}` | `_sd("aHR0cHM6Ly97QVBJX0RPTUFJTn0=")` | `AppDelegate` |
| `https://example.com/gallea/contact` | `_sd("aHR0cHM6Ly9leGFtcGxlLmNvbS9nYWxsZWEvY29udGFjdA==")` | `_XGm0013Bl._xGm0052` |
| `https://example.com/gallea/privacy` | `_sd("aHR0cHM6Ly9leGFtcGxlLmNvbS9nYWxsZWEvcHJpdmFjeQ==")` | `_XGm0013Bl._xGm0052` |

---

## Codable Compatibility

Explicit `CodingKeys` enums were added to all `Codable` types with renamed properties to preserve wire format:

- **`_XGm0005Bl` (Frame):** CodingKeys map obfuscated property names → original JSON keys (`work`, `placement`, `adored`, `seenInPerson`, `reflection`, `hungAt`)
- **`_XGm0006Bl` (Work):** CodingKeys map obfuscated names → original keys (`ref`, `title`, `artist`, `dateText`, `thumbURL`, `imageURL`, `medium`, `department`, `blurb`)
- **`_XGm0010Bl` (SearchHit):** CodingKey `objectIDs` preserved
- **`_XGm0011Bl` (RawObject):** All Met API JSON keys preserved via CodingKeys
- **`_XGm0004Bl` (Placement):** Explicit rawValues `"collected"` and `"toVisit"` added before case rename — Codable persistence unaffected

UserDefaults keys `gallea.salon.v2` and `@AppStorage` key `gallea.primerSeen` are preserved verbatim.

---

## Preserved Symbols (not renamed)

| Symbol | Reason |
|---|---|
| `AppDelegate` | Obj-C runtime / UIApplicationDelegateAdaptor |
| `templateApp` | `@main` entry point |
| `id` | `Identifiable` protocol requirement |
| `body` | `View` protocol requirement |
| `makeBody` | `ButtonStyle` protocol requirement |
| `makeUIView` / `updateUIView` | `UIViewRepresentable` protocol |
| `errorDescription` | `LocalizedError` protocol |
| `rawValue` / `allCases` | `RawRepresentable` / `CaseIterable` |
| SF Symbol name strings | System constants |
| `gallea.primerSeen` | `@AppStorage` persistence key |
| `gallea.salon.v2` | `UserDefaults` persistence key |
| CodingKeys rawValue strings | JSON wire format |
