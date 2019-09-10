package org;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
public class CONSULTER 
{
  String  MAT_MED;
  String  MAT_PAT;
  String  DT_CONS;
  CONSULTER (String MAT_MED , String MAT_PAT ,String DT_CONS )
 { 
  this.MAT_MED= MAT_MED;
  this.MAT_PAT=MAT_PAT;
  this.DT_CONS=DT_CONS;
  }
}
