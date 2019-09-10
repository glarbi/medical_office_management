package org;


public class PropertyHandler {

	// Param�tres du clients
	private String mat;
	private String nom;
	private String prn;
	
	//Param�tres du m�decin
	private String matMedecin;
	private String nomMedecin;
	private String prnMedecin;
	
	//Pram�tres d'une consultation
	private String nommed;
	private String nompat;
	private String dtcons;
	//Pram�tres d'un ordonnance
	private String nommede;
	private String nompati;
	private String idord;
	//Pram�tres d'une maladie
	private String idmal;
	private String nomal;
	//param�tre d'un m�dicament
	private String idmec;
	private String nommec;
	//param�tre d'un examen
	private  String numexm;
	private String nomexm; 
	private String dtexm;
	private String resexm;
	//param�tre d'une service
	private String idser;
	private String nomser;



	public PropertyHandler() {
		mat = null;
		nom = null;
		prn = null;
	}

	//M�thodes pour M�decin
	public String getmatMedecin() {
		return matMedecin;
	}

	public void setmatMedecin(String matMedecin) {
		this.matMedecin = matMedecin;
	}

	public String getNomMedecin() {
		return nomMedecin;
	}

	public void setNomMedecin(String nomMedecin) {
		this.nomMedecin = nomMedecin;
	}

	public String getPrenomMedecin() {
		return prnMedecin;
	}

	public void setPrnMedecin(String prnMedecin) {
		this.prnMedecin = prnMedecin;
	}

	//M�thodes pour Patient
	public String getmat() {
		return mat;
	}

	public void setmat(String num_ss) {
		mat = num_ss;
	}

	public String getNom() {
		return nom;
	}
	
	public void setNom(String name) {
		nom = name;
	}

	public String getPrn() {
		return prn;
	}
	
	public void setPrn(String lastname) {
		prn = lastname;
	}
	
	//M�thodes pour Consultation

	public String getDtconsultation() {
		return dtcons;
	}

	public void setDtconsultation(String datecons) {
		this.dtcons = dtcons;
	}

	public String getNompat() {
		return nompat;
	}

	public void setNompat(String nompatient) {
		nompat = nompatient;
	}

	public String getNommed() {
		return nommed;
	}

	public void setNommed(String nommedecin) {
		nommed = nommedecin;
	}
	//M�thodes pour ordonnance
	public String getNompati() {
		return nompati;
	}

	public void setNompati(String nompati) {
		this.nompati = nompati;
	}

	public String getNommede() {
		return nommede;
	}

	public void setNommede(String nommede) {
		this.nommede = nommede;
	}

	public String getIdord() {
		return idord;
	}

	public void setIdord(String idord) {
		this.idord = idord;
	}
	//M�thodes pour maladie
	public String getIdmal() {
		return idmal;
	}

	public void setIdmal(String idmal) {
		this.idmal = idmal;
	}

	public String getNomal() {
		return nomal;
	}

	public void setNomal(String nomal) {
		this.nomal = nomal;
	}

    public void setIdmec(String idmec){
    	this.idmec =idmec;
    }
    public void getIdmec(String idmec){
    	this.idmec =idmec;
    }
	public String getNommec() {
		return nommec;
	}

	public void setNomec(String nommec) {
		this.nommec = nommec;
	}
    public void setIdser(String idser){
	    	this.idser =idmec;
	    }
	 public void getIdser(String idser){
	    	this.idser =idser;
	    }
	public String getNomser() {
			return nomser;
		}

	public void setNomser(String nomser) {
			this.nomser = nomser;
		}

	 public void setnumexm(String numexm){
		    	this.numexm =numexm;
		    }
	 public void getnumexm(String numexm){
		    	this.numexm =numexm;
		    }
	public String getNomexm() {
				return nomexm;
			}

	public void setNomexm(String nomexm) {
				this.nomexm = nomexm;
			}

	public void setdtexm(String dtexm){
			    	this.dtexm =dtexm;
			    }
	public void getdtexm(String dtexm){
			    	this.dtexm =dtexm;
			    }
	public String getResexm() {
					return resexm;
				}

	public void setresexm(String resexm) {
					this.resexm = resexm;
				}
}
	 

 
