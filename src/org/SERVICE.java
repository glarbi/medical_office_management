package org;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
public class SERVICE {
   String  ID_SER;
   String  NOM_SER;
   String  TYPE_SER;
   String  ADR_SER;
   String  NUM_TEL_FX;
   String  NUM_TEL_MOB;
   SERVICE (String ID_SER,String NOM_SER,String TYPE_SER, String ADR_SER,String   NUM_TEL_FX, String  NUM_TEL_MOB)
   {
	   this.ID_SER=ID_SER;
	   this.NOM_SER=NOM_SER;
	   this.TYPE_SER=NOM_SER;
	   this.ADR_SER=ADR_SER;
	   
	   this.NUM_TEL_FX=NUM_TEL_FX;
           this.NUM_TEL_MOB=NUM_TEL_MOB;
   }

}
