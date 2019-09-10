package org;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
public class MEDECIN extends PERSONNE {
private String SPECIALITE;
/**
 * Constructeur d'initialisation de MEDECIN
 */
public MEDECIN(String MAT,String NOM, String PRN, String DT_NAIS, String LIEU_NAIS, 
		 		String ADR, String NATIONALITE, String NUM_TEL_FX, String NUM_TEL_MOB, String SPECIALITE )
{
	super(MAT, NOM, PRN, DT_NAIS, LIEU_NAIS, ADR, NATIONALITE, NUM_TEL_FX, NUM_TEL_MOB);

	this.SPECIALITE = SPECIALITE;
}

}
