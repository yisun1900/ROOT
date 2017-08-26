package gzjs;
import java.text.SimpleDateFormat;
//import java.util.GregorianCalendar;
//import java.util.Date;
import java.text.DateFormat;
import java.util.*;
//import java.io.*;
import java.sql.*;
//import javax.servlet.jsp.*;
//import javax.servlet.http.*;
import ybl.common.CommonFunction;

public class Gzjs{

  CommonFunction cf;

  public Gzjs() {
    	cf = new CommonFunction(); 
  }
   /**************************************************************************************
*ȡ��װ���������������棬���ʦ
***************************************************************************************/
public double getJzdds(String dwbh,String sjs,String ksrq,String zzrq,Connection conn) throws Exception
{

ResultSet rs=null;
Statement stmt=null;
String sql=null;
String wheresql=" and (1=1) ";
int sl=0;
try {
	
	stmt = conn.createStatement();
	if (dwbh!=null)
	{	
		wheresql+="  and (crm_khxx.dwbh='"+dwbh+"')";
	}
	if (sjs!=null)
	{	
		wheresql+="  and (crm_khxx.sjs='"+sjs+"')";
	}

	sql="select count(*) as hj from ";
	sql+=" crm_khxx  where qyrq>=TO_DATE('"+ksrq+"','YYYY/MM/DD') and qyrq<=TO_DATE('"+zzrq+"','YYYY/MM/DD')"; 
	sql+=wheresql;
	rs =stmt.executeQuery(sql);
	if (rs.next())
	{
		sl=rs.getInt("hj");
	}
	rs.close();
	stmt.close();
}
catch (Exception e){
	System.out.print("ȡ��װ����������ʧ�ܣ�" + e+"<br>");
	System.out.print("SQL��" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return sl;
}

  /**************************************************************************************
*�����ĳ��ʱ��Ķ�����
***************************************************************************************/
public int getDdsCg(String ksrq,String zzrq,Connection conn) throws Exception
{

ResultSet rs=null;
Statement stmt=null;
String sql=null;
int sl=0;
try {
	
	stmt = conn.createStatement();
    sql="select count(*) as hj from jc_cgdd  where  ";
	sql+="jc_cgdd.lrsj>=TO_DATE('"+ksrq+"','YYYY-MM-DD') and jc_cgdd.lrsj<=TO_DATE('"+zzrq+"','YYYY-MM-DD')";
	rs =stmt.executeQuery(sql);
	if (rs.next())
	{
		sl=rs.getInt("hj");
	}
	rs.close();
	stmt.close();
}
catch (Exception e){
	System.out.print("������񶩵�������ʧ�ܣ�����" + e+"<br>");
	System.out.print("SQL��" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return sl;
}
  /**************************************************************************************
*��ľ��ĳ��ʱ��Ķ�����
***************************************************************************************/
public int getDdsMm(String ksrq,String zzrq,Connection conn) throws Exception
{

ResultSet rs=null;
Statement stmt=null;
String sql=null;
int sl=0;
try {
	
	stmt = conn.createStatement();
    sql="select count(*) as hj  from jc_mmydd where ";
	sql+="jc_mmydd .lrsj>=TO_DATE('"+ksrq+"','YYYY-MM-DD') and jc_mmydd .lrsj<=TO_DATE('"+zzrq+"','YYYY-MM-DD')";
	rs =stmt.executeQuery(sql);
	if (rs.next())
	{
		sl=rs.getInt("hj");
	}
	rs.close();
	stmt.close();
}
catch (Exception e){
	System.out.print("����ľ�Ŷ���������ʧ�ܣ�����" + e+"<br>");
	System.out.print("SQL��" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return sl;
}
  /**************************************************************************************
*��Ҿ�ĳ��ʱ��Ķ�����
***************************************************************************************/
public int getDdsJj(String ksrq,String zzrq,Connection conn) throws Exception
{

ResultSet rs=null;
Statement stmt=null;
String sql=null;
int sl=0;
try {
	
	stmt = conn.createStatement();
    sql="select count(*) as hj from jc_jjdd  where  ";
	sql+="jc_jjdd.lrsj>=TO_DATE('"+ksrq+"','YYYY-MM-DD') and jc_jjdd.lrsj<=TO_DATE('"+zzrq+"','YYYY-MM-DD')";
	rs =stmt.executeQuery(sql);
	if (rs.next())
	{
		sl=rs.getInt("hj");
	}
	rs.close();
	stmt.close();
}
catch (Exception e){
	System.out.print("����Ҿ߶���������ʧ�ܣ�����" + e+"<br>");
	System.out.print("SQL��" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return sl;
}

/******************************************
*����ĳ���ݿ����Զ������ֶε����
�������������ֶΣ����ȡ�
******************************************/
public String getXuhao(String zd,String bm,int len,Connection conn) throws Exception
{
String xuhao=null;
String ls_sql2=null;
int xh=0;
String xhs=null;
ls_sql2="select NVL(max(TO_NUMBER("+zd+"))+1,1) from "+bm+"";
xhs=cf.executeQuery(ls_sql2);
xh=Integer.parseInt(xhs);
xuhao=cf.addZero(xh,len);
//System.out.print(ls_sql2);
return xuhao;
}
//�Զ��������

  /**************************************************************************************
*���û���Ϣ����ȡ��ĳ���ʦ����
***************************************************************************************/
public String getSjsjb(String dwbh,String sjs,Connection conn) throws Exception
{

ResultSet rs=null;
Statement stmt=null;
String sql=null;
String sjsjb=null;
try {
	
	stmt = conn.createStatement();
	sql="select sjsjb from ";
	sql+=" sq_yhxx where dwbh='"+dwbh+"' and yhmc='"+sjs+"'";    
	rs =stmt.executeQuery(sql);
	if (rs.next())
	{
		sjsjb=rs.getString("sjsjb");
	}
	rs.close();
	stmt.close();
}
catch (Exception e){
	System.out.print("ȡ���ʦ�������ʧ�ܣ�" + e+"<br>");
	System.out.print("SQL��" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return sjsjb;
}

/**************************************************************************************
*ȡ���ʦ��ֵ�����������ʦ �����棬��ʼ���ڣ���ֹ����
***************************************************************************************/
public double getSjscz(String dwbh,String sjs,String ksrq,String zzrq,Connection conn) throws Exception
{

	String zjxm=null;
	String sgd=null;
	String gcjdbm=null;
	double sjscz=0;
   	double jzqye=0;
	double cgssk=0;
	double mmssk=0;
	double jjssk=0;
	double zcssk=0;
	try
	{
		jzqye=getJzqye(dwbh,sjs, ksrq, zzrq,conn);
		cgssk=getJcjjssk(dwbh,zjxm,sjs,sgd,gcjdbm,"3", ksrq,zzrq,conn);
		mmssk=getJcjjssk(dwbh,zjxm,sjs,sgd,gcjdbm,"2", ksrq,zzrq,conn);
		jjssk=getJcjjssk(dwbh,zjxm,sjs,sgd,gcjdbm,"5", ksrq,zzrq,conn);
		zcssk=getJcjjssk(dwbh,zjxm,sjs,sgd,gcjdbm,"4", ksrq,zzrq,conn);
		sjscz=jzqye+cgssk+mmssk+jjssk+zcssk;
		System.out.print("���ʦ��ֵ: " + sjscz+sjs);
	}
	catch (Exception e) {
	System.out.print("�����ʦ��ֵ����: " + e);	
	}



	return cf.doubleTrim(sjscz,2);
}

/**************************************************************************************
*�����ʦ��н�����ʦ�����棬��ʼ���ڣ���ֹ����
***************************************************************************************/
public double getAsjsdx(String dwbh,String sjs,String ksrq,String zzrq,Connection conn) throws Exception
{
	double sjsdx=0;
	double cz=0;
	double cz2=0;
	String sjsjb=null;
	cz=getSjscz(dwbh,sjs,ksrq,zzrq,conn);
	System.out.print("���ʦ���²�ֵ:" + cz+sjs);
	cz2=getSjscz(dwbh,sjs,getFreny(ksrq,1),zzrq,conn);
	System.out.print("���ʦ����2�²�ֵ:" + cz2+sjs);
	
	sjsjb=getSjsjb(dwbh,sjs,conn);
	sjsjb=sjsjb.trim();//���Ӵ���䣬���ʦ�����������������𶼲�ͬ
	System.out.print("���ʦ�����ǣ�" + sjsjb);
	System.out.print("һ�����ʦ����ֵ��" + getXs("ASJSCZ",conn));
	try
	{
		if (sjsjb.equals("һ��"))
		{
			if (cz==0)
			{
				sjsdx=getXs("ASJSCCQX",conn);//�δ�ȫн
			}
			 if (cz2==0)
			{
				sjsdx=0;
			}
			if (cz>=getXs("ASJSCZ",conn))
				{
				  sjsdx=getXs("ASJSQX",conn);//ȫн
				}
			if ((cz<getXs("ASJSCZ",conn))&&(cz>0))
				{
					sjsdx=getXs("ASJSCQX",conn);//��ȫн
				}
		}
		else if (sjsjb.equals("����"))
		{
			if (cz==0)
			{
				sjsdx=getXs("BSJSCCQX",conn);//�δ�ȫн
			}
			 if (cz2==0)
			{
				sjsdx=0;
			}
			if (cz>=getXs("BSJSCZ",conn))
				{
				  sjsdx=getXs("BSJSQX",conn);//ȫн
				}
			if ((cz<getXs("BSJSCZ",conn))&&(cz>0))
				{
					sjsdx=getXs("BSJSCQX",conn);//��ȫн
				}

		}
		else  if (sjsjb.equals("����"))
		{
			if (cz==0)
			{
				sjsdx=getXs("CSJSCCQX",conn);//�δ�ȫн
			}
			 if (cz2==0)
			{
				sjsdx=0;
			}
			if (cz>=getXs("CSJSCZ",conn))
				{
				  sjsdx=getXs("CSJSQX",conn);//ȫн
				}
			if ((cz<getXs("CSJSCZ",conn))&&(cz>0))
				{
					sjsdx=getXs("CSJSCQX",conn);//��ȫн
				}

		}
		else
		{
			sjsdx=0;
        }
		
	}
	catch (Exception e) {
	System.out.print("�����ʦ��н����: " + e);
	
	}
	System.out.print("���ʦ��н: " + sjsdx);
	
	return cf.doubleTrim(sjsdx,2);
}

 /**************************************************************************************
*ȡ��װǩԼ����������棬���ʦ
***************************************************************************************/
public double getJzqye(String dwbh,String sjs,String ksrq,String zzrq,Connection conn) throws Exception
{

ResultSet rs=null;
Statement stmt=null;
String sql=null;
String wheresql=" and (1=1) ";
double jzqye=0;
try {
	
	stmt = conn.createStatement();
	if (dwbh!=null)
	{	
		wheresql+="  and (crm_khxx.dwbh='"+dwbh+"')";
	}
	if (sjs!=null)
	{	
		wheresql+="  and (crm_khxx.sjs='"+sjs+"')";
	}

	sql="select sum(qye) as hj from ";
	sql+=" crm_khxx  where qyrq>=TO_DATE('"+ksrq+"','YYYY/MM/DD') and qyrq<=TO_DATE('"+zzrq+"','YYYY/MM/DD')"; 
	sql+=wheresql;
	rs =stmt.executeQuery(sql);
	if (rs.next())
	{
		jzqye=rs.getDouble("hj");
	}
	rs.close();
	stmt.close();
}
catch (Exception e){
	System.out.print("ȡ��װǩԼ����ʧ�ܣ�" + e+"<br>");
	System.out.print("SQL��" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return cf.doubleTrim(jzqye,2);
}
/**************************************************************************************
*ȡ��װ�����ɼҾ�ʵ�տ�����ǽ������ͣ�ǩԼ����(dwbh)�������ʼ�(zjxm)�����ʦ(sjs)��ʩ���ӳ�(sgd)����ʼ�������ڣ���ֹ��������
jslx	C(1)��������		Y	1�����̣�2��ľ�ţ�3������4�����ģ�5���Ҿߣ�9�������
fkbz 1��δ���2�������ֿ3���������
***************************************************************************************/
public double getJcjjssk(String dwbh,String zjxm,String sjs,String sgd,String fkbz,String jslx,String ksrq,String zzrq,Connection conn) throws Exception
{

ResultSet rs=null;
Statement stmt=null;
String sql=null;
String wheresql=" and (1=1) ";
double jcjjssk=0;
try {
	
	stmt = conn.createStatement();
	if (dwbh!=null)
	{	
		wheresql+="  and (crm_khxx.dwbh='"+dwbh+"')";
	}
	if (zjxm!=null)
	{	
		wheresql+="  and (crm_khxx.zjxm='"+zjxm+"')";
	}
	if (sjs!=null)
	{	
		wheresql+="  and (crm_khxx.sjs='"+sjs+"')";
	}
	if (sgd!=null)
	{	
		wheresql+="  and (crm_khxx.sgd='"+sgd+"')";
	}
	if (fkbz!=null)
	{	
		wheresql+="  and (crm_jsjl.fkbz='"+fkbz+"')";
	}
    

	sql="select sum(bqljyfkze) as hj from  Crm_khxx,crm_jsjl where crm_jsjl.khbh=crm_khxx.khbh  and crm_jsjl.jslx='"+jslx+"'" ; 
	sql+=" and crm_jsjl.jssj>=TO_DATE('"+ksrq+"','YYYY/MM/DD') and crm_jsjl.jssj<=TO_DATE('"+zzrq+"','YYYY/MM/DD')"; 
    sql+=wheresql;
	rs =stmt.executeQuery(sql);
	if (rs.next())
	{
		jcjjssk=rs.getFloat("hj");
	}
	rs.close();
	stmt.close();
}
catch (Exception e){
	System.out.print("ȡ���ɼҾ�ʵ�տ����ʧ�ܣ�" + e+"<br>");
	System.out.print("SQL��" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return cf.doubleTrim(jcjjssk,2);
}
/**************************************************************************************
*����������n����
***************************************************************************************/
public String getFreny(String rq,int n) throws Exception
{
  GregorianCalendar cal = new GregorianCalendar();
  SimpleDateFormat bartDateFormat = new SimpleDateFormat("yyyy-MM-dd");
  String t=null;
  try {
		java.util.Date date = bartDateFormat.parse(rq) ;
		cal.setTime(date);
		t=bartDateFormat.format(cal.getTime());
		//System.out.println("��ʼ������: " + t );
		cal.add(GregorianCalendar.MONTH, -n);
		t=bartDateFormat.format(cal.getTime());
		//System.out.println("ת����������: " + t );
    }
   
   catch (Exception ex) {
    System.out.println(ex.getMessage());
   }
   return t;
}
/**************************************************************************************
*�����ǩԼ�� �����ǣ����Ϲ��ʣ�clgw����չ�����ʣ�ztjjgw�������ʦ��sjs�������棨dwbh��
���㿪ʼ���ڣ�������ֹ����
***************************************************************************************/
public double getCgqye(String dwbh,String clgw,String ztjjgw,String ksrq,String zzrq,Connection conn) throws Exception
{

ResultSet rs=null;
Statement stmt=null;
String sql=null;
String wheresql=" and (1=1) ";
double cgqye=0;
try {
	
	stmt = conn.createStatement();
	if (dwbh!=null)
	{	
		wheresql+="  and (crm_khxx.dwbh='"+dwbh+"')";
	}
	if (clgw!=null)
	{	
		wheresql+="  and ((Jc_cgdd.clgw='"+clgw+"')";
	}
	if (ztjjgw!=null)
	{	
		wheresql+="  or (Jc_cgdd.ztjjgw='"+ztjjgw+"'))";
	}

	sql="select sum(Jc_cgdd.htze) as hj from ";
	sql+=" crm_khxx,Jc_cgdd where Jc_cgdd.khbh=crm_khxx.khbh  and jc_cgdd.clzt in('06') ";
	sql+=" and Jc_cgdd.qhtsj>=TO_DATE('"+ksrq+"','YYYY/MM/DD') and Jc_cgdd.qhtsj<=TO_DATE('"+zzrq+"','YYYY/MM/DD')"; 
	sql+=wheresql;
	rs =stmt.executeQuery(sql);
	if (rs.next())
	{
		cgqye=rs.getFloat("hj");
	}
	rs.close();
	stmt.close();
}
catch (Exception e){
	System.out.print("ȡ����ǩԼ����ʧ�ܣ�" + e+"<br>");
	System.out.print("SQL��" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}

return cf.doubleTrim(cgqye,2);
}

/**************************************************************************************
*��ľ��ǩԼ�� �����ǣ����Ϲ��ʣ�clgw����չ�����ʣ�ztjjgw�������ʦ��sjs�������棨dwbh��
���㿪ʼ���ڣ�������ֹ����
***************************************************************************************/
public double getMmqye(String dwbh,String clgw,String ztjjgw,String ksrq,String zzrq,Connection conn) throws Exception
{

ResultSet rs=null;
Statement stmt=null;
String sql=null;
String wheresql=" and (1=1) ";
double mmqye=0;
try {
	
	stmt = conn.createStatement();
	if (dwbh!=null)
	{	
		wheresql+="  and (crm_khxx.dwbh='"+dwbh+"')";
	}
	if (clgw!=null)
	{	
		wheresql+="  and( (jc_mmydd.clgw='"+clgw+"')";
	}
	if (ztjjgw!=null)
	{	
		wheresql+="  or (jc_mmydd.ztjjgw='"+ztjjgw+"'))";
	}

	sql="select sum(jc_mmydd.htje) as hj from ";
	sql+=" crm_khxx,jc_mmydd where jc_mmydd.khbh=crm_khxx.khbh  and jc_mmydd.clzt in('04') ";
	sql+=" and jc_mmydd.htrq>=TO_DATE('"+ksrq+"','YYYY/MM/DD') and jc_mmydd.htrq<=TO_DATE('"+zzrq+"','YYYY/MM/DD')"; 
	sql+=wheresql;
	rs =stmt.executeQuery(sql);
	if (rs.next())
	{
		mmqye=rs.getFloat("hj");
	}
	rs.close();
	stmt.close();
}
catch (Exception e){
	System.out.print("ȡľ��ǩԼ����ʧ�ܣ�" + e+"<br>");
	System.out.print("SQL��" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
System.out.print(sql);
return cf.doubleTrim(mmqye,2);
}

/**************************************************************************************
*��Ҿ�ǩԼ�� �����ǣ����Ϲ��ʣ�clgw����չ�����ʣ�ztjjgw�������ʦ��sjs�������棨dwbh��
���㿪ʼ���ڣ�������ֹ����
***************************************************************************************/
public double getJjqye(String dwbh,String clgw,String ztjjgw,String ksrq,String zzrq,Connection conn) throws Exception
{

ResultSet rs=null;
Statement stmt=null;
String sql=null;
String wheresql=" and (1=1) ";
double jjqye=0;
try {
	
	stmt = conn.createStatement();
	if (dwbh!=null)
	{	
		wheresql+="  and (crm_khxx.dwbh='"+dwbh+"')";
	}
	if (clgw!=null)
	{	
		wheresql+="  and ((jc_jjdd.clgw='"+clgw+"')";
	}
	if (ztjjgw!=null)
	{	
		wheresql+="  or (jc_jjdd.ztjjgw='"+ztjjgw+"'))";
	}

	sql="select sum(jc_jjdd.htze) as hj from ";
	sql+=" crm_khxx,jc_jjdd where jc_jjdd.khbh=crm_khxx.khbh  and jc_jjdd.clzt in('06') ";
	sql+=" and jc_jjdd.qhtsj>=TO_DATE('"+ksrq+"','YYYY/MM/DD') and jc_jjdd.qhtsj<=TO_DATE('"+zzrq+"','YYYY/MM/DD')"; 
	sql+=wheresql;
	rs =stmt.executeQuery(sql);
	if (rs.next())
	{
		jjqye=rs.getFloat("hj");
	}
	rs.close();
	stmt.close();
}
catch (Exception e){
	System.out.print("ȡ�Ҿ�ǩԼ����ʧ�ܣ�" + e+"<br>");
	System.out.print("SQL��" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}

return cf.doubleTrim(jjqye,2);
}
/**************************************************************************************
*������ǩԼ�� �����ǣ����Ϲ��ʣ�clgw����չ�����ʣ�ztjjgw�������ʦ��sjs�������棨dwbh��
���㿪ʼ���ڣ�������ֹ����
***************************************************************************************/
public double getZcqye(String dwbh,String clgw,String ztjjgw,String ksrq,String zzrq,Connection conn) throws Exception
{

ResultSet rs=null;
Statement stmt=null;
String sql=null;
String wheresql=" and (1=1) ";
double zcqye=0;
try {
	
	stmt = conn.createStatement();
	if (dwbh!=null)
	{	
		wheresql+="  and (crm_khxx.dwbh='"+dwbh+"')";
	}
	if (clgw!=null)
	{	
		wheresql+="  and ((jc_zcdd.clgw='"+clgw+"')";
	}
	if (ztjjgw!=null)
	{	
		wheresql+="  or (jc_zcdd.ztjjgw='"+ztjjgw+"'))";
	}

	sql="select sum(jc_zcdd.hkze) as hj from ";
	sql+=" crm_khxx,jc_zcdd where jc_zcdd.khbh=crm_khxx.khbh  and jc_zcdd.clzt in('02') ";
	sql+=" and jc_zcdd.lrsj>=TO_DATE('"+ksrq+"','YYYY/MM/DD') and jc_zcdd.lrsj<=TO_DATE('"+zzrq+"','YYYY/MM/DD')"; 
	sql+=wheresql;
	rs =stmt.executeQuery(sql);
	if (rs.next())
	{
		zcqye=rs.getFloat("hj");
	}
	rs.close();
	stmt.close();
}
catch (Exception e){
	System.out.print("ȡ����ǩԼ����ʧ�ܣ�" + e+"<br>");
	System.out.print("SQL��" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}

return cf.doubleTrim(zcqye,2);
}





/**************************************************************************************
*���û���Ϣ����ȡ��ĳԱ���ĵ�н
***************************************************************************************/
public double getDx(String ygbh,Connection conn) throws Exception
{

ResultSet rs=null;
Statement stmt=null;
String sql=null;
double dx=0;
try {
	
	stmt = conn.createStatement();
	sql="select jbgz from ";
	sql+=" sq_yhxx where ygbh='"+ygbh+"'";    
	rs =stmt.executeQuery(sql);
	if (rs.next())
	{
		dx=rs.getFloat("jbgz");
	}
	rs.close();
	stmt.close();
}
catch (Exception e){
	System.out.print("ȡԱ����н����ʧ�ܣ�" + e+"<br>");
	System.out.print("SQL��" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return dx;
}
/**************************************************************************************
*���û���Ϣ����ȡ��ĳԱ���Ĺ��乤��
***************************************************************************************/
public double getGlgz(String ygbh,Connection conn) throws Exception
{

ResultSet rs=null;
Statement stmt=null;
String sql=null;
double glgz=0;
try {
	
	stmt = conn.createStatement();
	sql="select glgz from ";
	sql+=" sq_yhxx where ygbh='"+ygbh+"'";    
	rs =stmt.executeQuery(sql);
	if (rs.next())
	{
		glgz=rs.getFloat("glgz");
	}
	rs.close();
	stmt.close();
}
catch (Exception e){
	System.out.print("ȡԱ�����乤�ʲ���ʧ�ܣ�" + e+"<br>");
	System.out.print("SQL��" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return glgz;
}
/**************************************************************************************
*���û���Ϣ����ȡ��ĳԱ����ÿ��Ӧ�����ն�
***************************************************************************************/
public double getMyyjsxe(String ygbh,Connection conn) throws Exception
{

ResultSet rs=null;
Statement stmt=null;
String sql=null;
double myyjsxe=0;
try {
	
	stmt = conn.createStatement();
	sql="select myyjsxe from ";
	sql+=" sq_yhxx where ygbh='"+ygbh+"'";    
	rs =stmt.executeQuery(sql);
	if (rs.next())
	{
		myyjsxe=rs.getFloat("myyjsxe");
	}
	rs.close();
	stmt.close();
}
catch (Exception e){
	System.out.print("ȡԱ��ÿ��Ӧ�����ն����ʧ�ܣ�" + e+"<br>");
	System.out.print("SQL��" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return myyjsxe;
}
/**************************************************************************************
*���û���Ϣ����ȡ��ĳԱ���Ľ�ͨ����
***************************************************************************************/
public double getJtbt(String ygbh,Connection conn) throws Exception
{

ResultSet rs=null;
Statement stmt=null;
String sql=null;
double jtbt=0;
try {
	
	stmt = conn.createStatement();
	sql="select jtbt from ";
	sql+=" sq_yhxx where ygbh='"+ygbh+"'";    
	rs =stmt.executeQuery(sql);
	if (rs.next())
	{
		jtbt=rs.getFloat("jtbt");
	}
	rs.close();
	stmt.close();
}
catch (Exception e){
	System.out.print("ȡԱ����ͨ��������ʧ�ܣ�" + e+"<br>");
	System.out.print("SQL��" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return jtbt;
}
/**************************************************************************************
*���û���Ϣ����ȡ��ĳԱ���ĲͲ�
***************************************************************************************/
public double getCb(String ygbh,Connection conn) throws Exception
{

ResultSet rs=null;
Statement stmt=null;
String sql=null;
double cb=0;
try {
	
	stmt = conn.createStatement();
	sql="select cb from ";
	sql+=" sq_yhxx where ygbh='"+ygbh+"'";    
	rs =stmt.executeQuery(sql);
	if (rs.next())
	{
		cb=rs.getFloat("cb");
	}
	rs.close();
	stmt.close();
}
catch (Exception e){
	System.out.print("ȡԱ���Ͳ�����ʧ�ܣ�" + e+"<br>");
	System.out.print("SQL��" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return cb;
}
/**************************************************************************************
*���û���Ϣ����ȡ��ĳԱ���ĵ绰����
***************************************************************************************/
public double getDhbt(String ygbh,Connection conn) throws Exception
{

ResultSet rs=null;
Statement stmt=null;
String sql=null;
double dhbt=0;
try {
	
	stmt = conn.createStatement();
	sql="select dhbt from ";
	sql+=" sq_yhxx where ygbh='"+ygbh+"'";    
	rs =stmt.executeQuery(sql);
	if (rs.next())
	{
		dhbt=rs.getFloat("dhbt");
	}
	rs.close();
	stmt.close();
}
catch (Exception e){
	System.out.print("ȡԱ���绰��������ʧ�ܣ�" + e+"<br>");
	System.out.print("SQL��" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return dhbt;
}
/**************************************************************************************
*�ӹ��ʼ���ϵ����ȡĳϵ��ֵ
***************************************************************************************/
public double getXs(String zd,Connection conn) throws Exception
{

ResultSet rs=null;
Statement stmt=null;
String sql=null;
double xs=0;
try {
	
	stmt = conn.createStatement();
	sql="select ";
	sql+=zd;
	sql+=" as XSZ from  rs_gztcxsb ";    
	rs =stmt.executeQuery(sql);
	if (rs.next())
	{
		xs=rs.getFloat("XSZ");
	}
	rs.close();
	stmt.close();
}
catch (Exception e){
	System.out.print("ȡ����ϵ������ʧ�ܣ�" + e+"<br>");
	System.out.print("SQL��" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return xs;
}

/**************************************************************************************
*����Ա����ٱ���ĳ��ʱ���ڵ��������
***************************************************************************************/
public int getQjts(String ygbh,String ksrq,String zzrq,Connection conn) throws Exception
{

	ResultSet rs=null;
	Statement stmt=null;
	String sql=null;
	String aa;
	int i=0;
	int count=0;
	GregorianCalendar cal = new GregorianCalendar();
	SimpleDateFormat bartDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String t=null;
  try {
		java.util.Date date = bartDateFormat.parse(ksrq) ;
		cal.setTime(date);
		t=bartDateFormat.format(cal.getTime());
		//System.out.println("��ʼ������: " + t );
		while (!(t.equals(zzrq)))//�ӿ�ʼ���ڵ���ֹ���ڣ���һ��Ϊ������ѭ������¼�������ʱ����ڵ�ѭ����
		{
			i++;
			cal.setTime(date);
			cal.add(GregorianCalendar.DAY_OF_MONTH, i);
			t=bartDateFormat.format(cal.getTime());
			//System.out.println("������: " + t );
			try {
	
					stmt = conn.createStatement();
					sql="select ygbh from ";
					sql+=" rs_ygqjb where ygbh='"+ygbh+"'";
					sql+="and ksrq>=TO_DATE('"+t+"','YYYY/MM/DD') and zzrq<=TO_DATE('"+t+"','YYYY/MM/DD')"; 
					rs =stmt.executeQuery(sql);
					if (rs.next())
					{
						count++;
						aa=rs.getString("ygbh");
					}
					rs.close();
					stmt.close();
				}
			catch (Exception e)
				{
					System.out.print("ȡԱ�������������ʧ�ܣ�" + e+"<br>");
					System.out.print("SQL��" + sql+"<br>");
					throw(e);
				}
			finally
				{
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
	
				}

		}//while
	  }
   catch (Exception ex) 
     {
	   System.out.println(ex.getMessage());
     }

 
return count;
}
}

