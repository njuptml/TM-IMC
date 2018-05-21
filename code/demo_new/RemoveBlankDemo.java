package cn.itcast_01;

public class RemoveBlankDemo {
	public static void main(String[] args) {
		 TextRemoveBlank gpcr = new TextRemoveBlank(".\\data\\GPCR.txt", ".\\data\\GPCRfeature.txt");
		 TextRemoveBlank go = new TextRemoveBlank(".\\data\\GO.txt", ".\\data\\GOfeature.txt");
		 gpcr.removeBlank();
		 go.removeBlank();
}
}
