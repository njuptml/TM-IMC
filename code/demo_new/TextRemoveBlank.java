package cn.itcast_01;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class TextRemoveBlank {
	private String filename1;
	private String filename2;

	public TextRemoveBlank(String file1, String file2) {
		this.filename1 = file1;
		this.filename2 = file2;
	}

	public void removeBlank() {

		File file = new File(filename1);
		InputStream is = null;
		BufferedReader br = null;
		String tmp;
		FileWriter writer = null;
		int i = 0;
		try {
			is = new BufferedInputStream(new FileInputStream(file));
			br = new BufferedReader(new InputStreamReader(is, "utf-8"));
			writer = new FileWriter(filename2, true);
			while ((tmp = br.readLine()) != null) {
				if (tmp.equals("	")) {
					i++;
					System.out.println(i);
				} else {
					writer.write(tmp.trim() + "\n");
					i++;
				}
			}
			writer.close();
			is.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
