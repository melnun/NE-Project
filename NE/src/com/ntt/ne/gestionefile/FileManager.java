package com.ntt.ne.gestionefile;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;

import com.ntt.ne.BackendError;

public class FileManager {
	protected transient final Logger logger=Logger.getLogger(getClass());
	public final String NEDATA_DIR;
	
		public FileManager()
		{			
			// MUST FINISH WITH SLASH
			NEDATA_DIR=
					"C:\\Users\\melenu\\ne\\NE\\WebContent\\data\\";
					// System.getenv("SystemDrive") + "/NEDATA/";
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

		public void newFile(String user, String filename) {
			String path = NEDATA_DIR+user+"/"+filename+".json";
			logger.debug("Path:"+path);
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
			String path = NEDATA_DIR+user+"/"+filename+".json";
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

			if(files==null){
				logger.warn("First user login? Path:"+dir+" does not exist");
				dir.mkdir();				
			}else{

				for(String currentFile: files){
					if ( !(new File(currentFile)).isDirectory()
							&& 
							currentFile.endsWith(".json") ){
						jsonFiles.add(currentFile);
					}

				}		
			}
			return jsonFiles;
		}

	public String csv2Json(String csvFilename, String jsonOutputFilename) 
	{
		List<NeCell> l = parser(csvFilename) ;
		emitJson(l,jsonOutputFilename);
		
		return "success";
	}

	private void emitJson(final List<NeCell> cellList, final String jsonOutputFilename) 
	{
		this.newFile("admin", "provaperexcel");
		//[{"Position":"A1","Value":"test"},{"Position":"B1","Value":"dfasdfasdfsda"}]
		String stringaDaScrivere="[";
		Iterator<NeCell> it = cellList.iterator();
		
		while(it.hasNext()){
			NeCell n=it.next();
			stringaDaScrivere+="{"
					+"\"Position\":\""+n.getPosizione()+"\""+""
					+","+"\"Value\":\""+n.getValue()+"\""+""+"}";
			
			if(it.hasNext()) { stringaDaScrivere+=",";}
			
		}
		stringaDaScrivere+="]";
		System.out.println("Il risultato dell'ocropoid: "+stringaDaScrivere);
		this.WriteFile(stringaDaScrivere, "admin", jsonOutputFilename);
	}

	public List<NeCell> parser(final String csvFile) {

		BufferedReader br = null;
		String line = "";
		String cvsSplitBy = ";";

		try {

			br = new BufferedReader(new FileReader(csvFile));
			int rigaCorrente = 1;

			List<NeCell> arrayJson = new ArrayList();
			while ((line = br.readLine()) != null) {

				// use comma as separator
				String[] cellrows = line.split(cvsSplitBy, -1);

				// System.out.println("Country [code= " + country[4]
				// + " , name=" + country[5] + "]");

				System.out.println(cellrows.length + " %% " + line);

				char colonnaCorrente = 'A';
				for (String cellaCorrente : cellrows) {
					// System.out.println(" "+ ()+""+rigaCorrente
					// +" = "+cellaCorrente);
					if (cellaCorrente.trim().length() > 0) {
						System.out.println(" " + colonnaCorrente + ""
								+ rigaCorrente + " = " + cellaCorrente);
						NeCell n = new NeCell();

						// Popolare correttamente n
						String appoggio = "" + colonnaCorrente + rigaCorrente;
						String nu;
						if (cellaCorrente.charAt(0) == '"') {
							nu = cellaCorrente.replace("\"", "");
						} else {
							nu = cellaCorrente;
						}
						n.setPosizione(appoggio);
						n.setValue(nu);
						System.out.println("Popolo" + n.toString());
						// Rimuovere gli apici " se si trovano in posizione 0 e
						// alla fine
						arrayJson.add(n);

					}
					colonnaCorrente++;
				}
				rigaCorrente++;
			}

			System.out.println("Struttura dati finale:" + arrayJson);
			return arrayJson;
		} catch (FileNotFoundException e) {
			throw new BackendError("Non trovo il file", e);
		} catch (IOException e) {
			throw new BackendError(e);
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

	}

	
}

