package org;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Wrapper;

public class DBManager {
	public static Connection getConnection() {
		Connection con = null;

		try {
			Context context = new InitialContext();
			//DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/GCMDB");  //to use H2 datasource
			DataSource ds = (DataSource) context.lookup("java:jboss/datasources/GCMDB");
			con = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

	public static void setMedecin(String mat, String nom, String prn,
			String dtnais, String lieunais, String nationalite, String adr,
			String specialite, String tel_fx, String tel_mob) {
		if (mat != null && !mat.isEmpty()) {
			if (nom == null)
				nom = "";
			if (prn == null)
				prn = "";
			if (dtnais == null)
				dtnais = "01/01/2000";
			if (lieunais == null)
				lieunais = "";
			if (nationalite == null)
				nationalite = "";
			if (adr == null)
				adr = "";
			if (specialite == null)
				specialite = "";
			if (tel_fx == null)
				tel_fx = "";
			if (tel_mob == null)
				tel_mob = "";
			Connection con = getConnection();
			try {
				mat = "'" + mat + "'";
				String myRequest = "SELECT * FROM MEDECIN WHERE MAT_MED=" + mat;
				// Afficher myRequest
				System.out.println("setMedecin1 : " + myRequest);
				PreparedStatement pStmt = con.prepareStatement(myRequest);
				ResultSet rs = pStmt.executeQuery();
				if (rs.next()) {
					myRequest = "UPDATE MEDECIN SET NOM_MED='" + nom
							+ "', PRN_MED='" + prn + "', DT_NAIS='" + dtnais
							+ "', LIEU_NAIS='" + lieunais + "', NATIONALITE='"
							+ nationalite + "', ADR='" + adr
							+ "', SPECIALITE='" + specialite
							+ "', NUM_TEL_FX='" + tel_fx + "', NUM_TEL_MOB='"
							+ tel_mob + "' WHERE MAT_MED=" + mat;
					// Afficher myRequest
					System.out.println("setMedecin2 : " + myRequest);
					pStmt = con.prepareStatement(myRequest);
					pStmt.executeUpdate();
				} else {
					myRequest = "INSERT INTO MEDECIN (MAT_MED,NOM_MED,PRN_MED,DT_NAIS,LIEU_NAIS,NATIONALITE,ADR,SPECIALITE,NUM_TEL_FX,NUM_TEL_MOB) VALUES ("
							+ mat
							+ ",'"
							+ nom
							+ "','"
							+ prn
							+ "','"
							+ dtnais
							+ "','"
							+ lieunais
							+ "','"
							+ nationalite
							+ "','"
							+ adr
							+ "','"
							+ specialite
							+ "','"
							+ tel_fx
							+ "','"
							+ tel_mob + "')";
					/*
					 * myRequest = "INSERT INTO MEDECIN NSS_MED="+nss
					 * +", NOM_MED='"+nom +"', PRENOM_MED='"+prenom
					 * +"', DATE_NAIS='"+datenais +"', LIEU_NAIS='"+lieunais
					 * +"', NATIONALITE='"+nationalite +"', ADRESSE='"+adresse
					 * +"', SPECIALITE='"+specialite +"', NUM_TEL='"+tel+"'";
					 */
					// Afficher myRequest
					System.out.println("setMedecin2 : " + myRequest);
					pStmt = con.prepareStatement(myRequest);
					pStmt.executeUpdate();

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	public static String getNomMedecin(String mat) {
		String ret = "";
		if (mat != null && !mat.isEmpty()) {
			Connection con = getConnection();
			try {
				String myRequest = "SELECT NOM_MED FROM MEDECIN WHERE MAT_MED='"
						+ mat + "'";
				// Afficher myRequest
				System.out.println("getNomMedecin : " + myRequest);
				PreparedStatement pStmt = con.prepareStatement(myRequest);
				ResultSet rs = pStmt.executeQuery();
				rs.next();
				ret = rs.getString("NOM_MED");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return ret;
	}

	public static ArrayList getMedecins(String matMedecin, String nomMedecin,
			String prnMedecin) {
		ArrayList medecins = new ArrayList();
		Connection con = getConnection();
		if (con == null) {
			medecins.add(0, "Problème de connexion à la base de données");
		} else {
			try {

				String myRequest = "";
				if (matMedecin.isEmpty() && nomMedecin.isEmpty()
						&& prnMedecin.isEmpty()) {
					myRequest = "SELECT * FROM MEDECIN";
				} else {
					myRequest = "SELECT * FROM MEDECIN WHERE ";
					if (!matMedecin.isEmpty())

						myRequest = myRequest + "MAT_MED='" + matMedecin + "' ";
					if (!nomMedecin.isEmpty())
						myRequest = myRequest + "  NOM_MED='" + nomMedecin
								+ "' ";
					if (!prnMedecin.isEmpty())
						myRequest = myRequest + "  PRN_MED='" + prnMedecin
								+ "' ";
					/*
					 * if (matMedecin != null && nomMedecin != null &&
					 * prnMedecin != null && matMedecin.isEmpty() &&
					 * nomMedecin.isEmpty() && prnMedecin.isEmpty()) { myRequest
					 * = "SELECT * FROM MEDECIN"; } else { myRequest =
					 * "SELECT * FROM MEDECIN WHERE "; if (matMedecin == null ||
					 * matMedecin.isEmpty()) myRequest = myRequest + "MAT_MED=";
					 * else myRequest = myRequest + "MAT_MED='" +
					 * matMedecin+"'"; if (nomMedecin != null &&
					 * !nomMedecin.isEmpty()) { if (matMedecin == null)
					 * myRequest = myRequest + " NOM_MED='" + nomMedecin + "'";
					 * else myRequest = myRequest + " and NOM_MED='" +
					 * nomMedecin + "'"; } if (prnMedecin != null &&
					 * !prnMedecin.isEmpty()) { if (matMedecin == null)
					 * 
					 * myRequest = myRequest + " PRN_MED='" + prnMedecin + "'";
					 * else myRequest = myRequest + " and PRN_MED='" +
					 * prnMedecin + "'"; }
					 */
				}
				// Afficher myRequest
				System.out.println("getMedecins : " + myRequest);
				PreparedStatement pStmt = con.prepareStatement(myRequest);
				ResultSet rs = pStmt.executeQuery();
				int j = 0;
				while (rs.next()) {
					ArrayList medecin = new ArrayList();

					String mat_med = rs.getString("MAT_MED");

					String nom_med = rs.getString("NOM_MED");
					String prn_med = rs.getString("PRN_MED");
					String dt_nais = rs.getDate("DT_NAIS").toString();
					String lieu_nais = rs.getString("LIEU_NAIS");
					String nationalite = rs.getString("NATIONALITE");
					String adr = rs.getString("ADR");
					String specialite = rs.getString("SPECIALITE");
					String num_tel_fx = rs.getString("NUM_TEL_FX");
					String num_tel_mob = rs.getString("NUM_TEL_MOB");

					medecin.add(0, mat_med);
					medecin.add(1, nom_med);
					medecin.add(2, prn_med);
					medecin.add(3, dt_nais);
					medecin.add(4, lieu_nais);
					medecin.add(5, nationalite);
					medecin.add(6, adr);
					medecin.add(7, specialite);
					medecin.add(8, num_tel_fx);
					medecin.add(9, num_tel_mob);

					medecins.add(j, medecin);
					j++;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}

		return medecins;
	}

	public static String getNomPatient(String mat) {
		String ret = "";
		if (mat != null && !mat.isEmpty()) {
			Connection con = getConnection();
			try {
				String myRequest = "SELECT NOM_PAT FROM PATIENT WHERE MAT_PAT='"
						+ mat + "'";
				// Afficher myRequest
				System.out.println("getNomPatient : " + myRequest);
				PreparedStatement pStmt = con.prepareStatement(myRequest);
				ResultSet rs = pStmt.executeQuery();
				rs.next();
				ret = rs.getString("NOM_PAT");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return ret;
	}

	public static ArrayList getPatients(String mat, String nom, String prn) {
		ArrayList patients = new ArrayList();
		Connection con = getConnection();
		if (con == null) {
			patients.add(0, "Problème de connection à la base de données");
		} else {
			try {
				String myRequest = "";
				if (mat.isEmpty() && nom.isEmpty() && prn.isEmpty()) {
					myRequest = "SELECT * FROM PATIENT";
				} else {
					myRequest = "SELECT * FROM PATIENT WHERE ";
					if (!mat.isEmpty())

						myRequest = myRequest + "MAT_PAT='" + mat + "' ";
					if (!nom.isEmpty())
						myRequest = myRequest + "  NOM_PAT='" + nom + "' ";
					if (!prn.isEmpty())
						myRequest = myRequest + "  PRN_PAT='" + prn + "' ";

				}
				// Afficher myRequest
				System.out.println("getPatients : " + myRequest);
				PreparedStatement pStmt = con.prepareStatement(myRequest);
				ResultSet rs = pStmt.executeQuery();
				int j = 0;
				while (rs.next()) {
					ArrayList patient = new ArrayList();
					String mat_pat = rs.getString("MAT_PAT");
					String nom_pat = rs.getString("NOM_PAT");
					String prn_pat = rs.getString("PRN_PAT");
					String dt_nais = rs.getDate("DT_NAIS").toString();
					String lieu_nais = rs.getString("LIEU_NAIS");
					String nationalite = rs.getString("NATIONALITE");
					String adr = rs.getString("ADR");
					String profession = rs.getString("PROFESSION");
					String num_tel_fx = rs.getString("NUM_TEL_FX");
					String num_tel_mob = rs.getString("NUM_TEL_MOB");
					String antecedants = rs.getString("ANTECEDANTS");
					String dt_inscription = rs.getDate("DT_INSCRIPTION")
							.toString();

					patient.add(0, mat_pat);
					patient.add(1, nom_pat);
					patient.add(2, prn_pat);
					patient.add(3, dt_nais);
					patient.add(4, lieu_nais);
					patient.add(5, nationalite);
					patient.add(6, adr);
					patient.add(7, profession);
					patient.add(8, num_tel_fx);
					patient.add(9, num_tel_mob);
					patient.add(10, antecedants);
					patient.add(11, dt_inscription);

					patients.add(j, patient);
					j++;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}

		return patients;
	}

	public static ArrayList getPats(String mat, String nom, String prn) {
		ArrayList patients = new ArrayList();
		Connection con = getConnection();
		if (con == null) {
			patients.add(0, "Problème de connection à la base de données");
		} else {
			try {
				String myRequest = "";
				if (mat.isEmpty() && nom.isEmpty() && prn.isEmpty()) {
					// myRequest = "SELECT * FROM PATIENT";
				} else {
					myRequest = "DELETE FROM PATIENT WHERE ";
					if (!mat.isEmpty())

						myRequest = myRequest + "MAT_PAT='" + mat + "' ";
					if (!nom.isEmpty())
						myRequest = myRequest + "  NOM_PAT='" + nom + "' ";
					if (!prn.isEmpty())
						myRequest = myRequest + "  PRN_PAT='" + prn + "' ";

				}
				// Afficher myRequest
				System.out.println("getPatients : " + myRequest);
				PreparedStatement pStmt = con.prepareStatement(myRequest);
				ResultSet rs = pStmt.executeQuery();
				int j = 0;
				/*
				 * while (rs.next()) { ArrayList patient = new ArrayList();
				 * rs.getString("MAT_PAT"); String nom_pat =
				 * rs.getString("NOM_PAT"); String prn_pat =
				 * rs.getString("PRN_PAT"); String dt_nais =
				 * rs.getDate("DT_NAIS").toString(); String lieu_nais =
				 * rs.getString("LIEU_NAIS"); String nationalite =
				 * rs.getString("NATIONALITE"); String adr =
				 * rs.getString("ADR"); String profession =
				 * rs.getString("PROFESSION"); String num_tel_fx =
				 * rs.getString("NUM_TEL_FX"); String num_tel_mob =
				 * rs.getString("NUM_TEL_MOB"); String antecedants =
				 * rs.getString("ANTECEDANTS"); String dt_inscription =
				 * rs.getDate("DT_INSCRIPTION") .toString();
				 * 
				 * patient.add(0, mat_pat); patient.add(1, nom_pat);
				 * patient.add(2, prn_pat); patient.add(3, dt_nais);
				 * patient.add(4, lieu_nais); patient.add(5, nationalite);
				 * patient.add(6, adr); patient.add(7, profession);
				 * patient.add(8, num_tel_fx); patient.add(9, num_tel_mob);
				 * patient.add(10, antecedants); patient.add(11,
				 * dt_inscription);
				 * 
				 * patients.add(j, patient); j++; }
				 */
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}

		return patients;
	}

	public static void setPatient(String mat, String nom, String prn,
			String dtnais, String lieunais, String nationalite, String adr,
			String profession, String tel_fx, String tel_mob,
			String antecedants, String dt_inscription) {
		if (mat != null && !mat.isEmpty()) {
			if (nom == null)
				nom = "";
			if (prn == null)
				prn = "";
			if (dtnais == null)
				dtnais = "01/01/2000";
			if (lieunais == null)
				lieunais = "";
			if (nationalite == null)
				nationalite = "";
			if (adr == null)
				adr = "";
			if (profession == null)
				profession = "";
			if (tel_fx == null)
				tel_fx = "";
			if (tel_mob == null)
				tel_mob = "";
			if (antecedants == null)
				antecedants = "";
			if (dt_inscription == null)
				dt_inscription = "01/01/2000";
			Connection con = getConnection();
			try {
				mat = "'" + mat + "'";
				String myRequest = "SELECT * FROM PATIENT WHERE MAT_PAT=" + mat;
				// Afficher myRequest
				System.out.println("setPatient1 : " + myRequest);
				PreparedStatement pStmt = con.prepareStatement(myRequest);
				ResultSet rs = pStmt.executeQuery();
				if (rs.next()) {
					myRequest = "UPDATE PATIENT SET NOM_PAT='" + nom
							+ "', PRN_PAT='" + prn + "', DT_NAIS='" + dtnais
							+ "', LIEU_NAIS='" + lieunais + "', NATIONALITE='"
							+ nationalite + "', ADR='" + adr
							+ "', PROFESSION='" + profession
							+ "', NUM_TEL_FX='" + tel_fx + "', NUM_TEL_MOB='"
							+ tel_mob + "', ANTECEDANTS='" + antecedants
							+ "', DT_INSCRIPTION='" + dt_inscription
							+ "' WHERE MAT_PAT=" + mat;
					// Afficher myRequest
					System.out.println("setPatient2 : " + myRequest);
					pStmt = con.prepareStatement(myRequest);
					pStmt.executeUpdate();
				} else {
					myRequest = "INSERT INTO PATIENT (MAT_PAT,NOM_PAT,PRN_PAT,DT_NAIS,LIEU_NAIS,NATIONALITE,ADR,PROFESSION,NUM_TEL_FX,NUM_TEL_MOB, ANTECEDANTS, DT_INSCRIPTION) VALUES ("
							+ mat
							+ ",'"
							+ nom
							+ "','"
							+ prn
							+ "','"
							+ dtnais
							+ "','"
							+ lieunais
							+ "','"
							+ nationalite
							+ "','"
							+ adr
							+ "','"
							+ profession
							+ "','"
							+ tel_fx
							+ "','"
							+ tel_mob
							+ "', '"
							+ antecedants
							+ "', '"
							+ dt_inscription + "' )";
					/*
					 * myRequest = "INSERT INTO PATIENT NSS_PAT="+nss
					 * +", NOM_PAT='"+nom +"', PRENOM_PAT='"+prenom
					 * +"', DATE_NAIS='"+datenais +"', LIEU_NAIS='"+lieunais
					 * +"', NATIONALITE='"+nationalite +"', ADRESSE='"+adresse
					 * +"', PROFESSION='"+profession +"', NUM_TEL='"+tel
					 * +"', ANTECEDANTS='"+antecedants
					 * +"', DATE_INSCRIPTION='"+date_inscription
					 */
					// Afficher myRequest
					System.out.println("setPatient3 : " + myRequest);
					pStmt = con.prepareStatement(myRequest);
					pStmt.executeUpdate();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	public static void setMaladie(String idmaladie, String nom_maladie) {
		if (idmaladie != null && !idmaladie.isEmpty()) {
			if (nom_maladie == null)
				nom_maladie = "";

			Connection con = getConnection();
			try {
				String myRequest = "SELECT * FROM MALADIE WHERE ID_MALADIE="
						+ idmaladie;
				// Afficher myRequest
				System.out.println("setMaladie1 : " + myRequest);
				PreparedStatement pStmt = con.prepareStatement(myRequest);
				ResultSet rs = pStmt.executeQuery();
				if (rs.next()) {
					myRequest = "UPDATE MALADIE SET NOM_MALADIE ='"
							+ nom_maladie

							+ "' WHERE  ID_MALADIE =" + idmaladie;
					// Afficher myRequest
					System.out.println("setMaladie2 : " + myRequest);
					pStmt = con.prepareStatement(myRequest);
					pStmt.executeUpdate();
				} else {
					myRequest = "INSERT INTO MALADIE (ID_MALADIE,NOM_MALADIE) VALUES ("
							+ idmaladie + ",'" + nom_maladie + "')";
					/*
					 * myRequest = "INSERT INTO MALADIE ID_MALADIE="+ id_mal
					 * +", NOM_MALADIE='"+nom_maladie +"';
					 */
					// Afficher myRequest
					System.out.println("setMaladie3 : " + myRequest);
					pStmt = con.prepareStatement(myRequest);
					pStmt.executeUpdate();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	public static ArrayList getMaladies(String idmaladie, String nomaladie) {
		ArrayList maladies = new ArrayList();

		Connection con = getConnection();
		if (con == null) {
			maladies.add(0, "Problème de connection à la base de données");
		} else {
			try {
				String myRequest = "";
				if (idmaladie != null && nomaladie != null
						&& idmaladie.isEmpty() && nomaladie.isEmpty()) {
					myRequest = "SELECT * FROM MALADIE";
				} else {
					myRequest = "SELECT * FROM MALADIE WHERE ";
					if (idmaladie == null || idmaladie.isEmpty())
						myRequest = myRequest + "0";
					else
						myRequest = myRequest + "ID_MALADIE=" + idmaladie;
					if (nomaladie != null && !nomaladie.isEmpty())
						myRequest = myRequest + " OR NOM_MALADIE='" + nomaladie
								+ "'";

					// myRequest = "SELECT * FROM MALADIE WHERE ID_MALADIE="
					// + idmaladie + " OR NOM_MALADIE='" + nomaladie

				}
				// Afficher myRequest
				System.out.println("getMaladies : " + myRequest);
				PreparedStatement pStmt = con.prepareStatement(myRequest);
				ResultSet rs = pStmt.executeQuery();
				int j = 0;
				while (rs.next()) {
					ArrayList maladie = new ArrayList();

					String id_maladie = rs.getString("ID_MALADIE");
					String nom_maladie = rs.getString("NOM_MALADIE");

					maladie.add(0, id_maladie);
					maladie.add(1, nom_maladie);

					maladies.add(j, maladie);
					j++;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}

		return maladies;
	}

	public static void setOrdonnance(String idord, String Nommed, String Nompat) {
		if (idord != null && !idord.isEmpty()) {
			if (Nommed == null)
				Nommed = "";
			if (Nompat == null)
				Nompat = "";

			Connection con = getConnection();
			try {
				idord = "'" + idord + "'";
				String myRequest = "SELECT * FROM ORDONNANCE WHERE ID_ORD="
						+ idord;
				// Afficher myRequest
				System.out.println("setOrdonnance1 : " + myRequest);
				PreparedStatement pStmt = con.prepareStatement(myRequest);
				ResultSet rs = pStmt.executeQuery();
				if (rs.next()) {
					myRequest = "UPDATE ORDONNANCE SET  NOM_MED='" + Nommed
							+ "', NOM_PAT='" + Nompat + "' WHERE  ID_ORD ="
							+ idord;
					// Afficher myRequest
					System.out.println("setOrdonnance2 : " + myRequest);
					pStmt = con.prepareStatement(myRequest);
					pStmt.executeUpdate();
				} else {
					String RQ1 = "SELECT MAT_PAT FROM PATIENT WHERE NOM_PAT='"
							+ Nompat + "'";
					String RQ2 = "SELECT MAT_MED FROM MEDECIN WHERE NOM_MED='"
							+ Nommed + "'";
					System.out.println("RQ1 : " + RQ1);
					System.out.println("RQ2 : " + RQ2);
					PreparedStatement pStmt1 = con.prepareStatement(RQ1);
					ResultSet rs1 = pStmt1.executeQuery();

					if (rs1.next()) {
						String mat_pat = rs1.getString("MAT_PAT");
						System.out.println("mat_pat" + mat_pat);
					}
					/*
					 * int j=0; while (rs1.next()) { ArrayList Contenir = new
					 * ArrayList(); String mat_pat = rs1.getString("NOM_PAT");
					 * System.out.println("mat_pat="+mat_pat);
					 * 
					 * j++; }
					 */
					PreparedStatement pStmt2 = con.prepareStatement(RQ2);
					ResultSet rs2 = pStmt2.executeQuery();

					if (rs2.next()) {
						String mat_med = rs2.getString("MAT_MED");
						System.out.println("mat_med" + mat_med);
					}

					/*
					 * int i=0; while (rs1.next()) { ArrayList Contenir = new
					 * ArrayList(); String mat_med = rs1.getString("NOM_MED");
					 * System.out.println("mat_med="+mat_med);
					 * 
					 * i++; }
					 */

					myRequest = "INSERT INTO ORDONNANCE (ID_ORD,MAT_PAT,MAT_MED) VALUES ("
							+ idord
							+ ", '"
							+ rs1.getString("MAT_PAT")
							+ "', '"
							+ rs2.getString("MAT_MED") + "')";
					/*
					 * myRequest = "INSERT INTO ORDONNANCE ID_ORD="+ id_ord
					 * +",  NOM_MED='"+Nommed +", NOM_PAT='"+nompat;
					 */
					// Afficher myRequest
					System.out.println("setOrdonnance3 : " + myRequest);
					pStmt = con.prepareStatement(myRequest);
					pStmt.executeUpdate();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	public static ArrayList getOrdonnances(String idord, String nompat,
			String nommed) {

		String idordonnance = idord;
		String nommec = "";
		String matpat = "";
		String matmed = "";
		ArrayList medecin = getMedecins("", nommed, "");

		if (medecin == null || medecin.isEmpty())
			matmed = "";
		else {
			List ligneMedecin = null;
			for (int i = 0; i < medecin.size(); i++) {
				ligneMedecin = (List) (medecin.get(i));
				matmed = matmed + ligneMedecin.get(0).toString();
				if (i < medecin.size() - 1)
					matmed = matmed + "','";
			}
		}

		ArrayList patients = getPatients("", nompat, "");

		if (patients == null || patients.isEmpty())
			matpat = "0";
		else {
			List lignePatient = null;
			for (int i = 0; i < patients.size(); i++) {
				lignePatient = (List) (patients.get(i));
				matpat = matpat + lignePatient.get(0).toString();
				if (i < patients.size() - 1)
					matpat = matpat + "','";
			}
		}
		ArrayList contenir = getContenir(idord, "");

		if (contenir == null || contenir.isEmpty())
			nommec = "";
		else {
			List ligneContenir = null;
			for (int i = 0; i < contenir.size(); i++) {
				ligneContenir = (List) (contenir.get(i));
				nommec = nommec + ligneContenir.get(3).toString();
				if (i < contenir.size() - 1)
					nommec = nommec + "','";

			}
		}
		ArrayList ordonnances = new ArrayList();

		Connection con = getConnection();
		if (con == null) {
			ordonnances.add(0, "Problème de connection à la base de données");
		} else {
			try {

				String myRequest = "";
				if (idordonnance.isEmpty() && matmed.isEmpty()
						&& matpat.isEmpty()) {
					myRequest = "SELECT * FROM ORDONNANCE";
				} else {
					myRequest = "SELECT CONTENIR.*, MEDICAMENT.NOM_MEC FROM CONTENIR,MEDICAMENT WHERE ";
					if (!idordonnance.isEmpty())

						myRequest = myRequest + "ID_ORD IN ('" + idordonnance
								+ "') AND CONTENIR.ID_ORD ='"+idordonnance+"' AND CONTENIR.ID_MEC=MEDICAMENT.ID_MEC";
					
					/*
					 * String myRequest = ""; if (idord != null &&
					 * idord.isEmpty()) { myRequest =
					 * "SELECT * FROM ORDONNANCE"; } else { myRequest =
					 * "SELECT * FROM ORDONNANCE WHERE "; if (idord == null ||
					 * idord.isEmpty()) myRequest = myRequest + "0"; else
					 * myRequest = myRequest + "ID_ORD=" + idord; if (matmed !=
					 * null && !matmed.isEmpty()) myRequest = myRequest +
					 * " AND MAT_MED='" + matmed + "'"; if (matpat != null &&
					 * !matpat.isEmpty()) myRequest = myRequest +
					 * "' AND MAT_PAT='" + matpat + "'";/*
					 * 
					 * // myRequest = "SELECT * FROM ORDONNANCE WHERE ID_ORD="
					 * // + idord + " AND NSS_MED='" + nssmed // +
					 * "' OR NSS_PAT='" + nsspat + "'";
					 */
				}
				// Afficher myRequest
				System.out.println("getOdonnances : " + myRequest);
				PreparedStatement pStmt = con.prepareStatement(myRequest);
				ResultSet rs = pStmt.executeQuery();
				int j = 0;
				while (rs.next()) {

					ArrayList ordonnance = new ArrayList();
					// String nss_med1 = rs.getString("NSS_MED");
					// String nss_pat1 = rs.getString("NSS_PAT");
					// String id_ser1 = rs.getString("ID_SER");
					String id_ord =idordonnance;
					String mat_med = matmed;

					String mat_pat =matpat;

					String nom_mec = rs.getString("NOM_MEC");
					String posologie = rs.getString("POSOLOGIE");

					System.out.println(id_ord + " " + mat_med + " " + mat_pat);
					// Rendez_vous.add(0, nss_med1);
					// Rendez_Vous.add(1, nss_pat1);
					ArrayList ordonnannce = new ArrayList();
					ordonnannce.add(0, rs.getString("ID_ORD"));
					ordonnannce.add(1, mat_med);
					ordonnannce.add(2, getNomMedecin(mat_med));
					System.out.println(getNomPatient(mat_pat));
					System.out.println(getNomMedecin(mat_med));
					ordonnannce.add(3, mat_pat);
					ordonnannce.add(4, getNomPatient(mat_pat));
					ordonnannce.add(5, nom_mec);
					ordonnannce.add(6, posologie);
					ordonnances.add(j, ordonnannce);
					System.out.println("*************************************************************");
					System.out.println("*************************************************************");
					System.out.println(rs.getString("ID_ORD"));
					System.out.println(mat_med);
					System.out.println(getNomMedecin(mat_med));
					System.out.println(mat_pat);
					System.out.println(getNomPatient(mat_pat));
					System.out.println(nom_mec);
					System.out.println(posologie);
					System.out.println("*************************************************************");
					System.out.println("*************************************************************");
					/*
					 * ArrayList ordonnance = new ArrayList();
					 * 
					 * String id_ord = rs.getString("ID_ORD"); String nom_med =
					 * rs.getString("NOM_MED"); String nom_pat =
					 * rs.getString("NOM_PAT"); String nom_mec =
					 * rs.getString("NOM_MEC"); String posologie =
					 * rs.getString("POSOLOGIE");
					 * 
					 * ordonnance.add(0, idord); ordonnance.add(1, nommed);
					 * ordonnance.add(2, nompat); ordonnance.add(3, nommec);
					 * ordonnance.add(4, posologie);
					 * 
					 * ordonnances.add(j, ordonnance);
					 */
					j++;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}

		return ordonnances;
	}

	public static ArrayList getContenir(String idord, String idmec) {
		String posologie = "";
	
		ArrayList CONTENIRS = new ArrayList();

		Connection con = getConnection();
		if (con == null) {
			CONTENIRS.add(0, "Problème de connection à la base de données");
		} else {
			try {
				String myRequest = "";
				// if (idord != null && idmec != null
				// && idord.isEmpty()
				// && idmec.isEmpty()) {
				// myRequest = "SELECT * FROM CONTENIR";
				// } else {
				myRequest = "SELECT * FROM CONTENIR  WHERE ID_ORD = '" + idord
						+ "'";
				// if(idmec !=null && idmec.isEmpty())
				// myRequest = myRequest + "0";
				// else
				// myRequest = myRequest +"idmec";
				if (idmec != null && !idmec.isEmpty())
					myRequest += " AND ID_MEC = '" + idmec + "'";
				// if (posologie!=null && !posologie.isEmpty())
				// myRequest= myRequest + posologie;

				// myRequest = "SELECT * FROM ORDONNANCE WHERE ID_ORD="
				// + idord + " AND ID_MEC='" + idmec
				// + "' OR POSOLOGIE='" + posologie + "'";

				// }
				// Afficher myRequest
				System.out.println("getcontenir : " + myRequest);
				PreparedStatement pStmt = con.prepareStatement(myRequest);
				ResultSet rs = pStmt.executeQuery();
				int j = 0;
				while (rs.next()) {
					ArrayList CONTENIR = new ArrayList();

					String id_ord = rs.getString("ID_ORD");
					String id_mec = rs.getString("ID_MEC");
					String posologie1 = rs.getString("POSOLOGIE");
					 String nom_mec =getNomMedicaments(id_mec);


					CONTENIR.add(0, id_ord);
					CONTENIR.add(1, id_mec);
					CONTENIR.add(2, posologie1);
					CONTENIR.add(3, nom_mec);

					CONTENIRS.add(j, CONTENIR);
					j++;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}

		return CONTENIRS;
	}

	public static ArrayList getConsulters(String nompat, String nommed,
			String dtcons) {
		ArrayList consulter = new ArrayList();

		String mat_med = "";
		String mat_pat = "";

		ArrayList medecins = getMedecins("", nommed, "");

		if (medecins == null || medecins.isEmpty())
			mat_med = "0";
		else {
			List ligneMedecin = null;
			for (int i = 0; i < medecins.size(); i++) {
				ligneMedecin = (List) (medecins.get(i));
				mat_med = mat_med + ligneMedecin.get(0).toString();
				if (i < medecins.size() - 1)
					mat_med = mat_med + ',';
			}
		}

		ArrayList patients = getPatients("", nompat, "");

		if (patients == null || patients.isEmpty())
			mat_pat = "0";
		else {
			List lignePatient = null;
			for (int i = 0; i < patients.size(); i++) {
				lignePatient = (List) (patients.get(i));
				mat_pat = mat_pat + lignePatient.get(0).toString();
				if (i < patients.size() - 1)
					mat_pat = mat_pat + ',';
			}
		}
		Connection con = getConnection();
		if (con == null) {
			consulter.add(0, "Problème de connection à la base de données");
		} else {
			try {
				String myRequest;
				if (dtcons.equalsIgnoreCase("00/00/0000")) {
					myRequest = "SELECT * FROM CONSULTER WHERE MAT_PAT IN ("
							+ mat_pat + ") AND MAT_MED IN (" + mat_med + ")";
				} else {
					myRequest = "SELECT * FROM CONSULTER WHERE MAT_PAT IN ("
							+ mat_pat + ") AND MAT_MED IN (" + mat_med
							+ ")AND DT_CONS IN ('" + dtcons + "')"; // date_cons='mm/dd/yyyy'
				}

				// Afficher myRequest
				System.out.println("getCONSULTER : " + myRequest);
				PreparedStatement pStmt = con.prepareStatement(myRequest);
				ResultSet rs = pStmt.executeQuery();
				int j = 0;
				while (rs.next()) {
					ArrayList CONSULTER = new ArrayList();

					// string nss_med1 = rs.getchar("NSS_MED");
					// string nss_pat1 = rs.getchar("NSS_PAT");

					mat_med = ((Integer) rs.getInt("MAT_MED")).toString();
					mat_pat = ((Integer) rs.getInt("MAT_PAT")).toString();

					// CONSULTER.add(0, nss_med1);
					// CONSULTER.add(1, nss_pat1);
					CONSULTER.add(0, mat_med);
					CONSULTER.add(1, getNomMedecin(mat_med));
					CONSULTER.add(2, mat_pat);
					CONSULTER.add(3, getNomPatient(mat_pat));
					CONSULTER.add(4, dtcons);

					CONSULTER.add(j, CONSULTER);

					j++;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return consulter;
	}

	public static void setConsulter(String matmed, String matpat, String dtcons) {
		if (matpat != null && !matpat.isEmpty()) {
			if (matmed == null)
				matmed = "";
			if (dtcons == null)
				dtcons = "";

			Connection con = getConnection();
			try {
				String myRequest = "SELECT * FROM CONSULTER WHERE MAT_PAT="
						+ matpat;
				// Afficher myRequest
				System.out.println("setConsulter1 : " + myRequest);
				PreparedStatement pStmt = con.prepareStatement(myRequest);
				ResultSet rs = pStmt.executeQuery();
				if (rs.next()) {
					myRequest = "UPDATE CONSULTER SET MAT_MED='" + matmed
							+ "', DT_CONS='" + dtcons + "' WHERE MAT_PAT="
							+ matpat;
					// Afficher myRequest
					System.out.println("setConsulter2 : " + myRequest);
					pStmt = con.prepareStatement(myRequest);
					pStmt.executeUpdate();
				} else {
					myRequest = "INSERT INTO CONSULTER (MAT_MED,MAT_PAT,DT_CONS) VALUES ("
							+ matmed + ",'" + matpat + "','" + dtcons + "' )";
					/*
					 * myRequest = "INSERT INTO COSULTER NSS_PAT="+nss_pat
					 * +", NSS_MED='"+nss_pat +"',DATE_CONS='"+date_cons +"';
					 */
					// Afficher myRequest
					System.out.println("setConsulter3 : " + myRequest);
					pStmt = con.prepareStatement(myRequest);
					pStmt.executeUpdate();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	public static String getIDmec(String nom_mec) {
		String ret = "";
		if (nom_mec != null && !nom_mec.isEmpty()) {
			Connection con = getConnection();
			try {
				String myRequest = "SELECT ID_MEC FROM MEDICAMENT WHERE NOM_MEC="
						+ nom_mec;
				// Afficher myRequest
				System.out.println("getIDmec : " + myRequest);
				PreparedStatement pStmt = con.prepareStatement(myRequest);
				ResultSet rs = pStmt.executeQuery();
				rs.next();
				ret = rs.getString("ID_MEC");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return ret;
	}

	public static void setContenir(String idord, String nommec, String posologie) {
		String idmec = "";
		if (idord != null && !idord.isEmpty()) {
			if (nommec == null)
				nommec = "";
			if (posologie == null)
				posologie = "";

			Connection con = getConnection();
			try {
				idord = "'" + idord + "'";

				nommec = "'" + nommec + "'";
				// Chercher l'identifiant du médicament qui a le nom nommec
				// SELECT * FROM CONTENIR WHERE NOM_MEC = nommec
				/*
				 * String myrequest1 =
				 * "SELECT ID_MEC FROM MEDICAMENT WHERE NOM_MEC=" + nommec;
				 * 
				 * 
				 * 
				 * System.out.println("setContenir1 : " + myrequest1);
				 * PreparedStatement pStmt1 = con.prepareStatement(myrequest1);
				 * ResultSet rs1 = pStmt1.executeQuery(); int j = 0; while
				 * (rs1.next()) { ArrayList Contenir = new ArrayList(); idmec =
				 * rs1.getString("NOM_MEC"); System.out.println("idmec="+idmec);
				 * 
				 * j++; }
				 */
				String medicements = getIDmec(nommec);

				if (medicements == null)
					idmec = "0";
				else {
					idmec = "'" + medicements + "'";
					// mat_med=mat_med+"'";
					// mat_med=+mat_med;
					// mat_med = mat_med + "','";
				}

				String myRequest;
				//= "SELECT * FROM CONTENIR WHERE ID_ORD="		+ idord;
		//		// Afficher myRequest
		//		System.out.println("setContenir1 : " + myRequest);
				PreparedStatement pStmt ;
				//= con.prepareStatement(myRequest);
		//		ResultSet rs = pStmt.executeQuery();
		//		if (rs.next()) {
		//			myRequest = "UPDATE CONTENIR SET ID_MEC=" + idmec
		//					+ ", POSOLOGIE='" + posologie + "' WHERE ID_ORD="
		//					+ idord;
		//			// Afficher myRequest
		//			System.out.println("setContenir1 : " + myRequest);
		//			pStmt = con.prepareStatement(myRequest);
		//			pStmt.executeUpdate();
		//		} else {
					
					myRequest = "INSERT INTO CONTENIR (ID_ORD,ID_MEC,POSOLOGIE) VALUES ("
							+ idord + "," + idmec + ",'" + posologie + "' )";
					/*
					 * myRequest = "INSERT INTO CONTENIR ID_ORD="+ID_ORD
					 * +", ID_MEC='"+id_mec +"',POSOLOGIE='"+posologie +"';
					 */
					// Afficher myRequest
					System.out.println("setContenir3 : " + myRequest);
					pStmt = con.prepareStatement(myRequest);
					pStmt.executeUpdate();
			//	}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	//
	public static ArrayList getRendezVous(String numrdv, String nommed,
			String nompat) {
		ArrayList RendezVous = new ArrayList();
		String mat_med = "";
		String mat_pat = "";

		ArrayList medecins = getMedecins("", nommed, "");

		if (medecins == null || medecins.isEmpty())
			mat_med = "0";
		else {
			List ligneMedecin = null;
			for (int i = 0; i < medecins.size(); i++) {
				ligneMedecin = (List) (medecins.get(i));
				mat_med = mat_med + ligneMedecin.get(0).toString();
				if (i < medecins.size() - 1) {
					// mat_med=mat_med+"'";
					// mat_med=+mat_med;
					mat_med = mat_med + "','";
				}
			}
		}

		ArrayList patients = getPatients("", nompat, "");

		if (patients == null || patients.isEmpty())
			mat_pat = "";
		else {
			List lignePatient = null;
			for (int i = 0; i < patients.size(); i++) {
				lignePatient = (List) (patients.get(i));
				mat_pat = mat_pat + lignePatient.get(0).toString();
				if (i < patients.size() - 1)
					mat_pat = mat_pat + "','";
			}
		}
		Connection con = getConnection();
		if (con == null) {
			RendezVous.add(0, "Problème de connection à la base de données");
		} else {
			try {
				// mat_pat="'"+mat_pat+"'";
				// mat_med="'"+mat_med+"'";
				// numrdv="'"+numrdv+"'";
				// numrdv="'"+"002"+"'";

				String myRequest;

				/*
				 * myRequest = "SELECT * FROM RENDEZ_VOUS WHERE "; if (
				 * !mat_pat.isEmpty())
				 * 
				 * myRequest = myRequest + "MAT_PAT='" + mat_pat+"' "; if
				 * (!mat_med.isEmpty()) myRequest = myRequest + "  MAT_MED='" +
				 * mat_med+ "' "; if ( !numrdv.isEmpty()) myRequest = myRequest
				 * + "  NUM_RDV='" + numrdv + "' ";
				 */
		    	System.out.println("numéro rendez-vous :"+numrdv+ " matricule patient : "+mat_pat+" matricule medecin: "+mat_med);
				if (numrdv.isEmpty()) {
					
				/*	 "SELECT * FROM RENDEZ_VOUS WHERE NUM_RDV IN("+numrdv+") and NOM_MED IN ("
								+ nommed + ") AND NOM_PAT IN ("
								+ nompat +")";      */
					
					myRequest = "SELECT * FROM RENDEZ_VOUS WHERE  MAT_MED IN ('"
							+ mat_med + "') AND MAT_PAT IN ('" + mat_pat + "')";
				} else {
					myRequest = "SELECT * FROM RENDEZ_VOUS WHERE MAT_MED IN ('"
							+ mat_med + "') AND MAT_PAT IN ('" + mat_pat
							+ "') AND NUM_RDV IN ('" + numrdv + "')"; // date_rdv='mm/dd/yyyy'
				}
				// Afficher myRequest
				System.out.println("getRendezVous : " + myRequest);
				PreparedStatement pStmt = con.prepareStatement(myRequest);
				ResultSet rs = pStmt.executeQuery();
				int j = 0;
				while (rs.next()) {
					ArrayList Rendez_Vous = new ArrayList();
					// String nss_med1 = rs.getString("NSS_MED");
					// String nss_pat1 = rs.getString("NSS_PAT");
					// String id_ser1 = rs.getString("ID_SER");
					String dt_RDV = rs.getDate("DT_RDV").toString();
					String matmed = rs.getString("MAT_MED");
					String matpat = rs.getString("MAT_PAT");
					System.out.println(dt_RDV + " " + matmed + " " + matpat);
					// Rendez_vous.add(0, nss_med1);
					// Rendez_Vous.add(1, nss_pat1);
					ArrayList RendezVous2 = new ArrayList();
					RendezVous2.add(0, rs.getString("NUM_RDV"));
					RendezVous2.add(1, matmed);
					RendezVous2.add(2, getNomMedecin(matmed));
					System.out.println(getNomPatient(matpat));
					System.out.println(getNomMedecin(matmed));
					RendezVous2.add(3, matpat);
					RendezVous2.add(4, getNomPatient(matpat));
					RendezVous2.add(5, dt_RDV);
					RendezVous2.add(6, rs.getString("ID_SER"));
					RendezVous.add(j, RendezVous2);

					j++;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return RendezVous;
	}

	public static void setRendezVous(String numrdv, String matmed,
			String matpat, String dtrdv, String idser) {
		String date = dtrdv;
		String patient = matpat;
		System.out.println("patient" + patient);
		System.out.println("date" + date);
		if (numrdv != null && !numrdv.isEmpty()) {
			if (matmed == null)
				matmed = "";
			if (matpat == null)
				matpat = "";
			if (dtrdv == null)
				dtrdv = "";
			if (idser == null)
				idser = "";

			Connection con = getConnection();
			try {
				String myRequest = "SELECT * FROM RENDEZ_VOUS WHERE NUM_RDV='"
						+ numrdv + "'";
				// Afficher myRequest
				System.out.println("setRendezVous1 : " + myRequest);
				PreparedStatement pStmt = con.prepareStatement(myRequest);
				ResultSet rs = pStmt.executeQuery();
				if (rs.next()) {
					myRequest = "UPDATE RENDEZ_VOUS SET MAT_MED='" + matmed
							+ "', MAt_PAT='" + matpat + "', DT_RDV='" + dtrdv
							+ "', ID_SER='" + idser + "' WHERE NUM_RDV="
							+ numrdv;
					// Afficher myRequest
					System.out.println("setRendezVous : " + myRequest);
					pStmt = con.prepareStatement(myRequest);
					pStmt.executeUpdate();
				} else {
					myRequest = "INSERT INTO RENDEZ_VOUS (NUM_RDV,MAT_MED,MAT_PAT,DT_RDV,ID_SER) VALUES ('"
							+ numrdv
							+ "','"
							+ matmed
							+ "','"
							+ patient
							+ "','"
							+ date + "','" + idser + "' )";
					/*
					 * myRequest = "INSERT INTO RENDEZ_VOUS NUM_RDV="+num_rdv
					 * +", NSS_MED='"+nss_med +"',NSS_PAT='"+nss_pat
					 * +"',DATE_RDV='"+date_rdv +"', ID_SER='"+id_ser +"';
					 */
					// Afficher myRequest
					System.out.println("setRendezVous3 : " + myRequest);
					pStmt = con.prepareStatement(myRequest);
					pStmt.executeUpdate();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	public static ArrayList getServices(String idservice) {
		ArrayList services = new ArrayList();
		Connection con = getConnection();
		if (con == null) {
			services.add(0, "Problème de connection à la base de données");
		} else {
			try {
				String myRequest = "";
				if (idservice.isEmpty()) {
					myRequest = "SELECT * FROM SERVICE";
				} else {
					myRequest = "SELECT * FROM SERVICE WHERE ";
					if (!idservice.isEmpty())

						myRequest = myRequest + "ID_SER='" + idservice + "' ";

				}
				/*
				 * String myRequest = ""; if (idservice == null &&
				 * idservice.isEmpty()) { myRequest = "SELECT * FROM SERVICE"; }
				 * else { myRequest = "SELECT * FROM SERVICE WHERE "; myRequest
				 * = myRequest + "ID_SER='"+idservice+"'";
				 * 
				 * }
				 */
				// Afficher myRequest
				System.out.println("getServices : " + myRequest);
				PreparedStatement pStmt = con.prepareStatement(myRequest);
				ResultSet rs = pStmt.executeQuery();
				int j = 0;
				while (rs.next()) {
					ArrayList service = new ArrayList();
					String id_ser = rs.getString("ID_SER");
					String nom_ser = rs.getString("NOM_SER");
					String type_ser = rs.getString("TYPE_SER");
					String adr_ser = rs.getString("ADR_SER");
					String num_tel_fx = rs.getString("NUM_TEL_FX");
					String num_tel_mob = rs.getString("NUM_TEL_MOB");

					service.add(0, id_ser);
					service.add(1, nom_ser);
					service.add(2, type_ser);
					service.add(3, adr_ser);
					service.add(4, num_tel_fx);
					service.add(5, num_tel_mob);

					services.add(j, service);
					j++;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}

		return services;
	}

	/*
	 * public static ArrayList getServices(String idser) { String nomser = "";
	 * String numtel = ""; String adrser = ""; ArrayList services = new
	 * ArrayList(); Connection con =
	 * getConnection(); if (con == null) { services.add(0,
	 * "Problème de connection à la base de données");
	 * } else { try { String myRequest = ""; if
	 * (idser != null && !idser.isEmpty()) { myRequest =
	 * "SELECT * FROM SERVICE"; } else { /*if
	 * (nomser == null || nomser.isEmpty()) nomser = "";
	 */
	/*
	 * myRequest = "SELECT * FROM SERVICE WHERE NOM_SER='" + nomser + "'";
	 */
	/*
	 * myRequest = "SELECT * FROM SERVICE"; } // Afficher myRequest /*
	 * System.out.println("getservices : " + myRequest); PreparedStatement pStmt
	 * = con.prepareStatement(myRequest); ResultSet rs = pStmt.executeQuery();
	 * int j = 0; while (rs.next()) { ArrayList service = new ArrayList();
	 * String id_ser = rs.getString("ID_SER");
	 * String nom_ser = rs.getString("NOM_SER"); String type_ser =
	 * rs.getString("TYPE_SER"); String adr_pat = rs.getString("ADR_SER");
	 * String num_tel_fx = rs.getString("NUM_TEL_FX"); String num_tel_mob =
	 * rs.getString("NUM_TEL_MOB"); service.add(0,
	 * id_ser); service.add(1, nom_ser); service.add(2, type_ser);
	 * service.add(3, adrser); service.add(4, num_tel_fx); service.add(5,
	 * num_tel_mob);
	 * 
	 * services.add(j, services); j++; } } catch (SQLException e) {
	 * e.printStackTrace(); } finally { if (con != null) { try { con.close(); }
	 * catch (SQLException e) { e.printStackTrace(); } } } }
	 * 
	 * return services;
	 * 
	 * }
	 */

	/*
	 * public static ArrayList getToutServices(String nomser, String id_ser) {
	 * String numtel = ""; String adrser = ""; ArrayList services = new
	 * ArrayList();
	 * 
	 * Connection con = getConnection(); if (con == null) { services.add(0,
	 * "Problème de connection à la base de données"); } else { try { String
	 * myRequest = ""; if (nomser != null && nomser.isEmpty()) { myRequest =
	 * "SELECT * FROM SERVICE"; } else { if (nomser == null || nomser.isEmpty())
	 * nomser = ""; myRequest = "SELECT * FROM SERVICE WHERE NOM_SER='" + nomser
	 * + "'"; } // Afficher myRequest System.out.println("getservices : " +
	 * myRequest); PreparedStatement pStmt = con.prepareStatement(myRequest);
	 * ResultSet rs = pStmt.executeQuery(); int j = 0; while (rs.next()) {
	 * ArrayList service = new ArrayList();
	 * 
	 * String id_ser1 = rs.getString("ID_SER"); String nom_ser =
	 * rs.getString("NOM_SER"); String adr_pat = rs.getString("ADR_SER"); String
	 * num_tel_fx = rs.getString("NUM_TEL_FX"); String num_tel_mob =
	 * rs.getString("NUM_TEL_MOB");
	 * 
	 * service.add(0, id_ser1); service.add(1, nom_ser); service.add(2, adrser);
	 * service.add(3, num_tel_fx); service.add(4, num_tel_mob);
	 * 
	 * service.add(j, service); j++; } } catch (SQLException e) {
	 * e.printStackTrace(); } finally { if (con != null) { try { con.close(); }
	 * catch (SQLException e) { e.printStackTrace(); } } } }
	 * 
	 * return services; }
	 */

	public static String getNomService(String idser) {
		String ret = "";
		if (idser != null && !idser.isEmpty()) {
			Connection con = getConnection();
			try {
				String myRequest = "SELECT NOM_MED FROM SERVICE WHERE ID_SER='"
						+ idser+"'";
				// Afficher myRequest
				System.out.println("getNomService : " + myRequest);
				PreparedStatement pStmt = con.prepareStatement(myRequest);
				ResultSet rs = pStmt.executeQuery();
				rs.next();
				ret = rs.getString("NOM_SER");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return ret;
	}

	public static void setService(String idser, String nomser, String typeser,
			String adrser, String numtelfx, String numtelmob) {
		if (idser != null && !idser.isEmpty()) {
			if (nomser == null)
				nomser = "";
			if (typeser == null)
				typeser = "";
			if (adrser == null)
				adrser = "";
			if (numtelfx == null)
				numtelfx = "";
			if (numtelmob == null)
				numtelmob = "";

			Connection con = getConnection();
			try {
				idser = "'" + idser + "'";
				String myRequest = "SELECT * FROM SERVICE WHERE ID_SER="
						+ idser;
				// Afficher myRequest
				System.out.println("setService1 : " + myRequest);
				PreparedStatement pStmt = con.prepareStatement(myRequest);
				ResultSet rs = pStmt.executeQuery();
				if (rs.next()) {
					myRequest = "UPDATE SERVICE SET NOM_SER='" + nomser
							+ "', TYPE_SER='" + typeser + "', ADR_SER='"
							+ adrser + "', NUM_TEL_FX='" + numtelfx
							+ "', NUM_TEL_MOB='" + numtelmob
							+ "' WHERE ID_SER=" + idser;
					// Afficher myRequest
					System.out.println("setservice2 : " + myRequest);
					pStmt = con.prepareStatement(myRequest);
					pStmt.executeUpdate();
				} else {
					myRequest = "INSERT INTO SERVICE (ID_SER,NOM_SER,TYPE_SER,ADR_SER,NUM_TEL_FX,NUM_TEL_MOB) VALUES ("
							+ idser
							+ ",'"
							+ nomser
							+ "','"
							+ typeser
							+ "','"
							+ adrser
							+ "','"
							+ numtelfx
							+ "' ,'"
							+ numtelmob
							+ "' )";
					/*
					 * myRequest = "INSERT INTO SERVICE ID_SER="+ID_SER
					 * +", NOM_SER='"+nom_ser +"',TYPE_SER='"+type_ser
					 * +"',ADR_SER='"+adr_sser +"', NUM_TEL='"+num_tel +"';
					 */
					// Afficher myRequest
					System.out.println("setSevice3 : " + myRequest);
					pStmt = con.prepareStatement(myRequest);
					pStmt.executeUpdate();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	public static ArrayList getExamens(String numexm, String nommed,
			String nompat) {
		ArrayList examen = new ArrayList();

		String mat_med = "";
		String mat_pat = "";
		String idser = "";
		String nomser = "";
		ArrayList medecins = getMedecins("", nommed, "");

		if (medecins == null || medecins.isEmpty())
			mat_med = "0";
		else {
			List ligneMedecin = null;
			for (int i = 0; i < medecins.size(); i++) {
				ligneMedecin = (List) (medecins.get(i));
				mat_med = mat_med + ligneMedecin.get(0).toString();
				if (i < medecins.size() - 1)
					mat_med = mat_med + ',';
			}
		}

		ArrayList patients = getPatients("", nompat, "");

		if (patients == null || patients.isEmpty())
			mat_pat = "0";
		else {
			List lignePatient = null;
			for (int i = 0; i < patients.size(); i++) {
				lignePatient = (List) (patients.get(i));
				mat_pat = mat_pat + lignePatient.get(0).toString();
				if (i < patients.size() - 1)
					mat_pat = mat_pat + ',';
			}
		}
		Connection con = getConnection();
		if (con == null) {
			examen.add(0, "Problème de connection à la base de données");
		} else {
			try {
				String myRequest;
				if (numexm.equalsIgnoreCase("0000")) {
					myRequest = "SELECT * FROM EXAMEN WHERE MAT_MED IN ('"
							+ mat_med + "') AND MAt_PAT IN ('" + mat_pat + "')";
				} else {
					myRequest = "SELECT * FROM EXAMEN WHERE NUM_EXM IN('"
							+ numexm + "') AND MAT_MED IN ('" + mat_med
							+ "') AND MAT_PAT IN ('" + mat_pat + "')"; // date_exm='mm/dd/yyyy'
				}

			/*	ArrayList service = getNomService(idser);

				if (service == null || service.isEmpty())
					mat_med = "0";
				else {
					List ligneService = null;
					for (int i = 0; i < service.size(); i++) {
						ligneService = (List) (service.get(i));
						idser = idser + ligneService.get(0).toString();
						if (i < service.size() - 1)
							idser = idser + ',';
					}
				}**/

			// Afficher myRequest 
				System.out.println("getExamen : " + myRequest);
				PreparedStatement pStmt = con.prepareStatement(myRequest);
				ResultSet rs = pStmt.executeQuery();
				int j = 0;
				while (rs.next()) {
					ArrayList examens = new ArrayList();

					// String nss_med1 = rs.getString("NSS_MED"); // 
					//mat_pat =rs.getString("MAT_PAT");
					String id_ser1 = rs.getString("id_ser");
					String num_exm = rs.getString("NUM_EXM");
					String matmed = rs.getString("MAT_MED");
					String dt_exm = rs.getString("DT_EXM").toString();
					String res_exm = rs.getString("RES_EXM");
					examens.add(0, mat_med); // 
					examens.add(1, getNomMedecin(mat_med));
					examens.add(2, mat_pat); //
					examens.add(3, getNomPatient(mat_pat));
					examens.add(4, id_ser1);
					
					//examens.add(6, idser);
					// examens.add(7, getNomService(idser));
					examens.add(5, dt_exm);
					examens.add(6, res_exm);
					examen.add(j, examens);

					j++;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return examen;
	}

	public static String getNomExamen(String numexm) {
		String ret = "";
		if (numexm != null && !numexm.isEmpty()) {
			Connection con = getConnection();
			try {
				String myRequest = "SELECT NOM_MED FROM EXAMEN WHERE NUM_EXM="
						+ numexm;
				// Afficher myRequest
				System.out.println("getNomExamen : " + myRequest);
				PreparedStatement pStmt = con.prepareStatement(myRequest);
				ResultSet rs = pStmt.executeQuery();
				rs.next();
				ret = rs.getString("NOM_EXM");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return ret;
	}

	public static void setExamen(String numexm, String matmed, String matpat,
			String idser, String nomexm, String dtexm, String resexm) {
		if (numexm != null && !numexm.isEmpty()) {
			if (matpat == null)
				matpat = "";
			if (matmed == null)
				matmed = "";
			if (nomexm == null)
				nomexm = "";
			if (dtexm == null)
				dtexm = "";
			if (resexm == null)
				resexm = "";
			if (idser == null)
				idser = "";

			Connection con = getConnection();
			try {
				String myRequest = "SELECT * FROM EXAMEN WHERE NUM_EXM='"
						+ numexm + "'";
				// Afficher myRequest
				System.out.println("setExamen1 : " + myRequest);
				PreparedStatement pStmt = con.prepareStatement(myRequest);
				ResultSet rs = pStmt.executeQuery();
				if (rs.next()) {
					myRequest = "UPDATE EXAMEN SET MAT_MED ='" + matmed
							+ "', MAT_PAT='" + matpat + "',ID_SER='" + idser
							+ "', NOM_EXM='" + nomexm + "', DT_EXM='" + dtexm
							+ "', RES_EXM ='" + resexm + "' WHERE NUM_EXM='"
							+ numexm + "'";
					// Afficher myRequest
					System.out.println("setExamen2 : " + myRequest);
					pStmt = con.prepareStatement(myRequest);
					pStmt.executeUpdate();
				} else {
					myRequest = "INSERT INTO EXAMEN (NUM_EXM,MAT_MED,MAT_PAT,ID_SER,NOM_EXM,DT_EXM,RES_EXM) VALUES ('"
							+ numexm
							+ "','"
							+ matmed
							+ "','"
							+ matpat
							+ "','"
							+ idser
							+ "','"
							+ nomexm
							+ "','"
							+ dtexm
							+ "','"
							+ resexm + "' )";
					/*
					 * myRequest = "INSERT INTO EXAMEN NUM_EXM="+num_exm
					 * +",NSS_MED='"+nss_med +",NSS_PAT='"+nss_pat
					 * +", ID_SER='"+id_ser +"',NOM_EXM='"+nom_exm
					 * +"',DATE_EXM='"+date_exm +"', RES_EXM='"+res_exm +"';
					 */
					// Afficher myRequest
					System.out.println("setExamen3 : " + myRequest);
					pStmt = con.prepareStatement(myRequest);
					pStmt.executeUpdate();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	public static ArrayList getSOUFFRIRS(String idmaladie, String matpat,
			String id_maladie) {
		ArrayList souffrir = new ArrayList();

		Connection con = getConnection();
		if (con == null) {
			souffrir.add(0, "Problème de connection à la base de données");
		} else {
			try {
				String myRequest = "";
				if (idmaladie != null && matpat != null && idmaladie.isEmpty()
						&& matpat.isEmpty()) {
					myRequest = "SELECT * FROM SOUFFRIR";
				} else {
					myRequest = "SELECT * FROM SOUFFRIR WHERE ID_MALADIE='"
							+ id_maladie + "' AND MAT_PAT='" + matpat + "'";
					if (idmaladie == null || idmaladie.isEmpty())
						myRequest = myRequest + "0";
					else
						myRequest = myRequest + "ID_MALADIE=" + idmaladie;
					if (matpat != null && !matpat.isEmpty())
						myRequest = myRequest + " OR MAT_PAT='" + matpat + "'";

					// myRequest = "SELECT * FROM MALADIE WHERE ID_MALADIE="
					// + idmaladie + " OR NSS_PAT='" + nsspat +"'

				}
				// Afficher myRequest
				System.out.println("getsouffrir : " + myRequest);
				PreparedStatement pStmt = con.prepareStatement(myRequest);
				ResultSet rs = pStmt.executeQuery();
				int j = 0;
				while (rs.next()) {
					ArrayList souffrir1 = new ArrayList();

					String id_maladie1 = rs.getString("ID_MALADIE");
					String mat_pat = rs.getString("NOM_MALADIE"); /* erreuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuur */

					souffrir1.add(0, id_maladie1);
					souffrir1.add(1, mat_pat);

					souffrir.add(j, souffrir1);
					j++;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}

		return souffrir;
	}

	public static void setSOUFFRIR(String id_maladie, String MAT_PAT) {
		if ((id_maladie != null && !id_maladie.isEmpty())
				&& (MAT_PAT != null && !MAT_PAT.isEmpty()))
			;

		Connection con = getConnection();
		try {
			String myRequest = "SELECT * FROM SOUFFRIR WHERE ID_MALADIE ='"
					+ id_maladie + "' AND MAT_PAT='" + MAT_PAT + "'";
			// Afficher myRequest
			System.out.println("setsouffrir1 : " + myRequest);
			PreparedStatement pStmt = con.prepareStatement(myRequest);
			ResultSet rs = pStmt.executeQuery();
			if (rs.next()) {
				myRequest = "UPDATE SOUFFRIR SET ID_MALADIE ='" + id_maladie
						+ "'AND MAT_PAT ='" + MAT_PAT + "' WHERE  ID_MALADIE ="
						+ id_maladie + " AND MAT_PAT=" + MAT_PAT + "";
				// Afficher myRequest
				System.out.println("setsouffrir2 : " + myRequest);
				pStmt = con.prepareStatement(myRequest);
				pStmt.executeUpdate();
			} else {
				myRequest = "INSERT INTO SOUFFRIR (ID_MALADIE,MAT_PAT) VALUES ("
						+ id_maladie + ",'" + MAT_PAT + "')";
				/*
				 * myRequest = "INSERT INTO TRAITER ID_MALADIE="+ id_mal
				 * +", ID_MEC='"+id_mec +"';
				 */
				// Afficher myRequest
				System.out.println("setSOUFFRIR3 : " + myRequest);
				pStmt = con.prepareStatement(myRequest);
				pStmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public static ArrayList getMedicaments(String idmec) {
		String nommec = "";
		String dcimec = "";
		ArrayList medicaments = new ArrayList();

		Connection con = getConnection();
		if (con == null) {
			medicaments.add(0, "Problème de connection à la base de données");
		} else {
			try {

				String myRequest = "";
				if (idmec.isEmpty()) {
					myRequest = "SELECT * FROM MEDICAMENT";
				} else {
					myRequest = "SELECT * FROM MEDICAMENT WHERE ";
					if (!idmec.isEmpty())

						myRequest = myRequest + "ID_MEC='" + idmec + "' ";
					/*
					 * String myRequest = ""; if (idmec != null &&
					 * idmec.isEmpty()) { myRequest =
					 * "SELECT * FROM MEDICAMENT"; } else { myRequest =
					 * "SELECT * FROM MEDICAMENT WHERE "; if (idmec == null ||
					 * idmec.isEmpty()) myRequest = myRequest + "0";
					 * 
					 * // myRequest = "SELECT * FROM MEDICAMENT WHERE ID_MEC="
					 * // + idmec + " OR NOM_MEC='" + nommeC
					 */
				}
				// Afficher myRequest
				System.out.println("getMedicamentes : " + myRequest);
				PreparedStatement pStmt = con.prepareStatement(myRequest);
				ResultSet rs = pStmt.executeQuery();
				int j = 0;
				while (rs.next()) {
					ArrayList medicament = new ArrayList();

					String id_mec = rs.getString("ID_MEC");
					String nom_mec = rs.getString("NOM_MEC");
					String dci_mec = rs.getString("DCI_MEC");

					medicament.add(0, id_mec);
					medicament.add(1, nom_mec);
					medicament.add(2, dci_mec);

					medicaments.add(j, medicament);
					j++;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}

		return medicaments;
	}

	public static void setMedicaments(String idmec, String nommec, String dcimec) {
		if (idmec != null && !idmec.isEmpty()) {
			if (nommec == null)
				nommec = "";
			if (dcimec == null)
				dcimec = "";
			Connection con = getConnection();
			try {
				String myRequest = "SELECT * FROM MEDICAMENT WHERE ID_MEC='"
						+ idmec + "'";
				// Afficher myRequest
				System.out.println("setMedicament1 : " + myRequest);
				PreparedStatement pStmt = con.prepareStatement(myRequest);
				ResultSet rs = pStmt.executeQuery();
				if (rs.next()) {
					myRequest = "UPDATE MEDICAMENT SET NOM_MEC ='" + nommec

					+ "',DCI_MEC ='" + dcimec + "' WHERE  ID_MEC ='" + idmec
							+ "'";
					// Afficher myRequest
					System.out.println("setMedicament2 : " + myRequest);
					pStmt = con.prepareStatement(myRequest);
					pStmt.executeUpdate();
				} else {
					myRequest = "INSERT INTO MEDICAMENT (ID_MEC,NOM_MEC,DCI_MEC) VALUES ('"
							+ idmec + "','" + nommec + "','" + dcimec + "')";
					/*
					 * myRequest = "INSERT INTO MEDICAMENT ID_MEC="+ id_mec
					 * +", NOM_MEC='"+nommec+"';
					 */
					// Afficher myRequest
					System.out.println("setMedicament3 : " + myRequest);
					pStmt = con.prepareStatement(myRequest);
					pStmt.executeUpdate();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	public static String getNomMedicaments(String idmec) {
		String nom_mec = "";

		Connection con = getConnection();
		if (con == null) {
			return "Err: Problème de connection à la base de données";
		} else {
			try {
				String myRequest = "";
				if (idmec != null && !idmec.isEmpty()) {
					myRequest = "SELECT * FROM MEDICAMENT WHERE ";
					myRequest = myRequest + "ID_MEC ='" + idmec + "'";
				}
				// Afficher myRequest
				System.out.println("getMedicamentes : " + myRequest);
				PreparedStatement pStmt = con.prepareStatement(myRequest);
				ResultSet rs = pStmt.executeQuery();
				int j = 0;
				if (rs.next()) {
					nom_mec = rs.getString("NOM_MEC");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}

		return nom_mec;
	}
}
