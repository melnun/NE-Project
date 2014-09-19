package gestione.file;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class FileManager {

	public final String NEDATA_DIR;
	
		public FileManager()
		{			
			NEDATA_DIR=System.getenv("SystemDrive") + "/NEDATA/";
		}
	
		public  void creaDir(String user)
		{
			String Dir = "dir";
			boolean success = (new File(Dir)).mkdir();

			if (success)
			{
				System.out.println("Ho creato: " + Dir);
			}else{
				System.out.println("Impossibile creare: " + Dir);
			}
			Dir = NEDATA_DIR+user;
			success = (new File(Dir)).mkdirs();

			if (success)
			{
				System.out.println("Ho creato: " + Dir);
			}else{
				System.out.println("Impossibile creare: " + Dir);
			}
		}

		public  void newFile(String user, String filename) {
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

		public  boolean ExistsDir() {
			boolean flag;
			String path = "C:/NEDATA";
			File file = new File(path);
			if(file.exists())
				flag=true;
			else
				flag=false;
			return flag;
		}

		public  boolean ExistsJson() {
			boolean flag;
			String path = "C:/NEDATA";
			File file = new File(path);
			if(file.exists())
				flag=true;
			else
				flag=false;
			return flag;
		}

		public  void WriteFile(String json, String user, String filename){
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

		public  List<String> seekFile(String user)
		{
			File dir = new File(NEDATA_DIR+user+"/");
			String[] files = dir.list();
			ArrayList<String> jsonFiles = new ArrayList<String>();
			
			for(String currentFile: files){
				if ( (new File(currentFile)).isFile()
						 && 
						 currentFile.endsWith(".json") ){
					jsonFiles.add(currentFile);
				}
						 
			}									
			return jsonFiles;
		}

	
}

