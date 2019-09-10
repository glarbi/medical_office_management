package org;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class PERSONNE {

	String MAT;
	String NOM;
	String PRN;
	String DT_NAIS;
	String LIEU_NAIS;
	String ADR;
	String NATIONALITE;
	String NUM_TEL_FX;
        String NUM_TEL_MOB;
	
	PERSONNE(String MAT,String NOM, String PRN, String DT_NAIS, String LIEU_NAIS, 
	 		String ADR, String NATIONALITE, String NUM_TEL_FX, String NUM_TEL_MOB)
	{
		this.MAT = MAT;
		this.NOM = NOM;
		this.PRN = PRN;
		this.DT_NAIS = DT_NAIS;
		this.LIEU_NAIS = LIEU_NAIS;
		this.ADR = ADR;
		this.NATIONALITE = NATIONALITE;
		this.NUM_TEL_FX = NUM_TEL_FX;	
                this.NUM_TEL_MOB = NUM_TEL_MOB;	
	
	}
}
