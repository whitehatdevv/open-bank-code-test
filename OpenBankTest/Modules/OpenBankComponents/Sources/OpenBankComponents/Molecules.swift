//
//  Molecules.swift
//
//
//  Created by Manu Martinez on 1/2/22.
//

public enum Molecules {

	public enum TableCells {
		public static var CharacterTableCell: CharactersTableViewCell {
			return CharactersTableViewCell()
		}
	}

	public enum CellViews {
		public static var CharacterCell: CharacterCellView {
			return CharacterCellView()
		}

		public static var SpinnerCellView: ScrollingCellView {
			return ScrollingCellView()
		}
	}

	public enum Bubbles {
		public static var Basic: Bubble {
			return Bubble()
		}
	}

}
