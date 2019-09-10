package org;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class PATIENT extends PERSONNE {
	private String ANTECEDANTS;
	private String TRAVAIL;
	private String DT_INSCRIPTION;
	
     /**
      * Constructeur d'initialisation de PATIENT
      */
     public PATIENT(String MAT,String NOM, String PRN, String DT_NAIS, String LIEU_NAIS, 
    		 		String ADR, String NATIONALITE, String NUM_TEL_FX, String NUM_TEL_MOB, String ANTECEDANTS, String TRAV, String DT_INSCR)
     {
		super(MAT, NOM, PRN, DT_NAIS, LIEU_NAIS, ADR, NATIONALITE,  NUM_TEL_FX,  NUM_TEL_MOB);

		this.ANTECEDANTS = ANTECEDANTS;
		this.TRAVAIL = TRAV;
		this.DT_INSCRIPTION = DT_INSCR;
     }

}
