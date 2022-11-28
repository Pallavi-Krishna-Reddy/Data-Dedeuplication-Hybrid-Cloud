package com.example.hybrid_cloud_.algo;

import java.io.*;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

public class ReadWriteFile {

	public static void main(String... aArgs) throws IOException{
		ReadWriteFile text = new ReadWriteFile();

		//treat as a small file
		List<String> lines = text.readSmallTextFile(FILE_NAME);
		log(lines);
		lines.add("This is a line added in code.");
		text.writeSmallTextFile(lines, FILE_NAME);

		//treat as a large file - use some buffering
		text.readLargerTextFile(FILE_NAME);
		lines = Arrays.asList("Down to the Waterline", "Water of Love");
		text.writeLargerTextFile(OUTPUT_FILE_NAME, lines);
	}

	static String FILE_NAME = null;
	static String OUTPUT_FILE_NAME = null;
	static Charset ENCODING = StandardCharsets.UTF_8;

	//For smaller files

	/**
	 Note: the javadoc of Files.readAllLines says it's intended for small
	 files. But its implementation uses buffering, so it's likely good
	 even for fairly large files.
	 */
	List<String> readSmallTextFile(String aFileName) throws IOException {
		Path path = Paths.get(aFileName);
		return Files.readAllLines(path, ENCODING);
	}

	void writeSmallTextFile(List<String> aLines, String aFileName) throws IOException {
		Path path = Paths.get(aFileName);
		Files.write(path, aLines, ENCODING);
	}

	public void writeFile(String fileName, String sData) throws IOException {
		File file = new File(fileName);
		FileOutputStream fileOutputStream = null;
		try {
			fileOutputStream = new FileOutputStream(file);
			fileOutputStream.write(sData.getBytes(StandardCharsets.UTF_8));
		} catch (Exception e) {
			throw e;
		} finally {
			if (fileOutputStream != null) {
				fileOutputStream.close();
			}
		}
	}

	//For larger files
	public StringBuffer readLargerTextFile(String aFileName) throws IOException {
		Path path = Paths.get(aFileName);
		StringBuffer fileData=new StringBuffer();
		try {
			Scanner scanner =  new Scanner(path, ENCODING.name());
			while (scanner.hasNextLine()){
				//process each line in some way
				fileData.append(scanner.nextLine());
				// log();
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}

		return fileData;
	}

	void readLargerTextFileAlternate(String aFileName) throws IOException {
		Path path = Paths.get(aFileName);
		try {
			BufferedReader reader = Files.newBufferedReader(path, ENCODING);
			String line = null;
			while ((line = reader.readLine()) != null) {
				//process each line in some way
				log(line);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void writeLargerTextFile(String aFileName, List<String> aLines) throws IOException {
		Path path = Paths.get(aFileName);
		try {
			BufferedWriter writer = Files.newBufferedWriter(path, ENCODING);
			for(String line : aLines){
				writer.write(line);
				writer.newLine();
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
	}

	private static void log(Object aMsg){
		System.out.println(String.valueOf(aMsg));
	}



}
