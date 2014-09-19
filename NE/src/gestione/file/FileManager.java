package gestione.file;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

public class FileManager {

	public static class getDir
	{
		public static void creaDir(String user)
		{
			String Dir = "dir";
			boolean success = (new File(Dir)).mkdir();

			if (success)
			{
				System.out.println("Ho creato: " + Dir);
			}else{
				System.out.println("Impossibile creare: " + Dir);
			}
			Dir = "C:/NEDATA/"+user;
			success = (new File(Dir)).mkdirs();

			if (success)
			{
				System.out.println("Ho creato: " + Dir);
			}else{
				System.out.println("Impossibile creare: " + Dir);
			}
		}

		public static void newFile(String user, String filename) {
			String path = "C:/NEDATA/"+user+"/"+filename+".json";

			try {
				File file = new File(path);

				if (file.exists())
					System.out.println("Il file " + path + " esiste");
				else if (file.createNewFile())
					System.out.println("Il file " + path + " è stato creato");
				else
					System.out.println("Il file " + path + " non può essere creato");
			}
			catch (IOException e) {
				e.printStackTrace();
			}
		}

		public static boolean ExistsDir() {
			boolean flag;
			String path = "C:/NEDATA";
			File file = new File(path);
			if(file.exists())
				flag=true;
			else
				flag=false;
			return flag;
		}

		public static boolean ExistsJson() {
			boolean flag;
			String path = "C:/NEDATA";
			File file = new File(path);
			if(file.exists())
				flag=true;
			else
				flag=false;
			return flag;
		}

		public static void WriteFile(String json, String user, String filename){
			String path = "C:/NEDATA/"+user+"/"+filename+".json";
			try {
				File file = new File(path);
				FileWriter fw = new FileWriter(file);
				fw.write(json);
				fw.flush();
				fw.close();
			}
			catch(IOException e) { 
				e.printStackTrace();
			}
		}

//		public static ArrayList seekFile()
//		{
//			File dir = new File("C:");
//			String[] files = dir.list();
//			ArrayList<String> lista_file = new ArrayList<String>();
//			String nome_file=".json";
//			int k=0;
//			for (int i = 0; i < files.length; i++) {
//				if (files[i].endsWith(nome_file)) {
//					lista_file.add(files[i]);
//					k++;
//				}
//			}
//			return lista_file;
//		}

	}
}

