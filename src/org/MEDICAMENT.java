package org;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class MEDICAMENT {
	String ID_MEC;
	String NOM_MEC;
	String DCI_MEC;
	MEDICAMENT (String ID_MEC,String NOM_MEC,String DCI_MEC){
		this.ID_MEC = ID_MEC;
		this.NOM_MEC = NOM_MEC;
		this.DCI_MEC = DCI_MEC;
	}

}
