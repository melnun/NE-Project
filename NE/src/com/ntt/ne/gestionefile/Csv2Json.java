package com.ntt.ne.gestionefile;


public class Csv2Json {

	public Csv2Json() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * java com.ntt.ne.gestionefile.Csv2Json template.csv ne-file.json
	 * @param args
	 */
	public static void main(String[] args) {
		String csvFilename = args[0];
		String jsonOutputFilename = args[1];
		System.out.println("Carico "+csvFilename+ " in "+jsonOutputFilename);

		String result=(new FileManager()).csv2Json(csvFilename,jsonOutputFilename);

		if(result!=null){
			System.err.println("ERRORE FATALE:"+result);
		}
//		parser();
//		NeCell cella1 = new NeCell();
//		cella1.setPosizione("A1");
//		cella1.setValue("5");
	}

//	public static String parser()
//	{
//		
//		String csvFile = "C:/Users/melenu/ne/NE/etc/csv-test/consuntivo_contributi-test-.json.csv";
//		BufferedReader br = null;
//		String line = "";
//		String cvsSplitBy = ";";
//
//		try {
//
//			br = new BufferedReader(new FileReader(csvFile));
//			int rigaCorrente=1;
//
//			List<NeCell> arrayJson= new ArrayList();
//			while ((line = br.readLine()) != null) {
//				
//				// use comma as separator
//				String[] cellrows = line.split(cvsSplitBy,-1);
//
////				System.out.println("Country [code= " + country[4] 
////						+ " , name=" + country[5] + "]");
//				
//				System.out.println(cellrows.length+" %% "+line);
//				
//				char colonnaCorrente='A';
//				for(String cellaCorrente: cellrows){					
//					//System.out.println(" "+ ()+""+rigaCorrente +" = "+cellaCorrente);
//					if(cellaCorrente.trim().length() > 0){
//						System.out.println(" "+ colonnaCorrente+""+rigaCorrente +" = "+cellaCorrente);
//						NeCell n= new NeCell();
//						
//						// Popolare correttamente n
//						String appoggio=""+colonnaCorrente+rigaCorrente;
//						String nu;
//						if(cellaCorrente.charAt(0)=='"'){
//							nu=cellaCorrente.replace("\"", "");
//						}else{
//							nu=cellaCorrente;
//						}
//						n.setPosizione(appoggio);
//						n.setValue(nu);
//						System.out.println("Popolo"+n.toString());
//						// Rimuovere gli apici " se si trovano in posizione 0 e alla fine
//						arrayJson.add(n);
//						
//					}
//					colonnaCorrente++;
//				}
//				rigaCorrente++;
//			}
//
//			System.out.println("Struttura dati finale:"+arrayJson);
//		} catch (FileNotFoundException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		} finally {
//			if (br != null) {
//				try {
//					br.close();
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//			}
//		}
//
//		System.out.println("Done");
//
//		return "success";
//	}

}
