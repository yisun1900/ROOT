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
*取家装订单，参数：店面，设计师
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
	System.out.print("取家装订单数操作失败：" + e+"<br>");
	System.out.print("SQL：" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return sl;
}

  /**************************************************************************************
*求橱柜某断时间的订单数
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
	System.out.print("计算橱柜订单数操作失败！！：" + e+"<br>");
	System.out.print("SQL：" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return sl;
}
  /**************************************************************************************
*求木门某断时间的订单数
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
	System.out.print("计算木门订单数操作失败！！：" + e+"<br>");
	System.out.print("SQL：" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return sl;
}
  /**************************************************************************************
*求家具某断时间的订单数
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
	System.out.print("计算家具订单数操作失败！！：" + e+"<br>");
	System.out.print("SQL：" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return sl;
}

/******************************************
*生成某数据库表的自动增长字段的序号
参数：表名，字段，长度。
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
//自动产生序号

  /**************************************************************************************
*从用户信息表中取得某设计师级别
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
	System.out.print("取设计师级别操作失败：" + e+"<br>");
	System.out.print("SQL：" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return sjsjb;
}

/**************************************************************************************
*取设计师产值，参数：设计师 ，店面，开始日期，终止日期
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
		System.out.print("设计师产值: " + sjscz+sjs);
	}
	catch (Exception e) {
	System.out.print("求设计师产值出错: " + e);	
	}



	return cf.doubleTrim(sjscz,2);
}

/**************************************************************************************
*求设计师底薪，设计师，店面，开始日期，终止日期
***************************************************************************************/
public double getAsjsdx(String dwbh,String sjs,String ksrq,String zzrq,Connection conn) throws Exception
{
	double sjsdx=0;
	double cz=0;
	double cz2=0;
	String sjsjb=null;
	cz=getSjscz(dwbh,sjs,ksrq,zzrq,conn);
	System.out.print("设计师上月产值:" + cz+sjs);
	cz2=getSjscz(dwbh,sjs,getFreny(ksrq,1),zzrq,conn);
	System.out.print("设计师连续2月产值:" + cz2+sjs);
	
	sjsjb=getSjsjb(dwbh,sjs,conn);
	sjsjb=sjsjb.trim();//不加此语句，设计师级别与下面三个级别都不同
	System.out.print("设计师级别是：" + sjsjb);
	System.out.print("一级设计师级产值：" + getXs("ASJSCZ",conn));
	try
	{
		if (sjsjb.equals("一级"))
		{
			if (cz==0)
			{
				sjsdx=getXs("ASJSCCQX",conn);//次次全薪
			}
			 if (cz2==0)
			{
				sjsdx=0;
			}
			if (cz>=getXs("ASJSCZ",conn))
				{
				  sjsdx=getXs("ASJSQX",conn);//全薪
				}
			if ((cz<getXs("ASJSCZ",conn))&&(cz>0))
				{
					sjsdx=getXs("ASJSCQX",conn);//次全薪
				}
		}
		else if (sjsjb.equals("二级"))
		{
			if (cz==0)
			{
				sjsdx=getXs("BSJSCCQX",conn);//次次全薪
			}
			 if (cz2==0)
			{
				sjsdx=0;
			}
			if (cz>=getXs("BSJSCZ",conn))
				{
				  sjsdx=getXs("BSJSQX",conn);//全薪
				}
			if ((cz<getXs("BSJSCZ",conn))&&(cz>0))
				{
					sjsdx=getXs("BSJSCQX",conn);//次全薪
				}

		}
		else  if (sjsjb.equals("三级"))
		{
			if (cz==0)
			{
				sjsdx=getXs("CSJSCCQX",conn);//次次全薪
			}
			 if (cz2==0)
			{
				sjsdx=0;
			}
			if (cz>=getXs("CSJSCZ",conn))
				{
				  sjsdx=getXs("CSJSQX",conn);//全薪
				}
			if ((cz<getXs("CSJSCZ",conn))&&(cz>0))
				{
					sjsdx=getXs("CSJSCQX",conn);//次全薪
				}

		}
		else
		{
			sjsdx=0;
        }
		
	}
	catch (Exception e) {
	System.out.print("求设计师底薪出错: " + e);
	
	}
	System.out.print("设计师底薪: " + sjsdx);
	
	return cf.doubleTrim(sjsdx,2);
}

 /**************************************************************************************
*取家装签约额，参数：店面，设计师
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
	System.out.print("取家装签约操作失败：" + e+"<br>");
	System.out.print("SQL：" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return cf.doubleTrim(jzqye,2);
}
/**************************************************************************************
*取家装，集成家居实收款，参数是结算类型，签约店面(dwbh)，工程质检(zjxm)，设计师(sjs)，施工队长(sgd)，开始计算日期，终止计算日期
jslx	C(1)结算类型		Y	1：工程；2：木门；3：橱柜；4：主材；5：家具；9：促销活动
fkbz 1：未付款；2：付部分款；3：付款完成
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
	System.out.print("取集成家居实收款操作失败：" + e+"<br>");
	System.out.print("SQL：" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return cf.doubleTrim(jcjjssk,2);
}
/**************************************************************************************
*将日期上推n个月
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
		//System.out.println("开始日期是: " + t );
		cal.add(GregorianCalendar.MONTH, -n);
		t=bartDateFormat.format(cal.getTime());
		//System.out.println("转换后日期是: " + t );
    }
   
   catch (Exception ex) {
    System.out.println(ex.getMessage());
   }
   return t;
}
/**************************************************************************************
*求橱柜签约额 参数是：材料顾问（clgw），展厅顾问（ztjjgw），设计师（sjs），店面（dwbh）
计算开始日期，计算终止日期
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
	System.out.print("取橱柜签约操作失败：" + e+"<br>");
	System.out.print("SQL：" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}

return cf.doubleTrim(cgqye,2);
}

/**************************************************************************************
*求木门签约额 参数是：材料顾问（clgw），展厅顾问（ztjjgw），设计师（sjs），店面（dwbh）
计算开始日期，计算终止日期
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
	System.out.print("取木门签约操作失败：" + e+"<br>");
	System.out.print("SQL：" + sql+"<br>");
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
*求家具签约额 参数是：材料顾问（clgw），展厅顾问（ztjjgw），设计师（sjs），店面（dwbh）
计算开始日期，计算终止日期
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
	System.out.print("取家具签约操作失败：" + e+"<br>");
	System.out.print("SQL：" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}

return cf.doubleTrim(jjqye,2);
}
/**************************************************************************************
*求主材签约额 参数是：材料顾问（clgw），展厅顾问（ztjjgw），设计师（sjs），店面（dwbh）
计算开始日期，计算终止日期
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
	System.out.print("取主材签约操作失败：" + e+"<br>");
	System.out.print("SQL：" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}

return cf.doubleTrim(zcqye,2);
}





/**************************************************************************************
*从用户信息表中取得某员工的底薪
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
	System.out.print("取员工底薪操作失败：" + e+"<br>");
	System.out.print("SQL：" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return dx;
}
/**************************************************************************************
*从用户信息表中取得某员工的工龄工资
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
	System.out.print("取员工工龄工资操作失败：" + e+"<br>");
	System.out.print("SQL：" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return glgz;
}
/**************************************************************************************
*从用户信息表中取得某员工的每月应缴三险额
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
	System.out.print("取员工每月应缴三险额操作失败：" + e+"<br>");
	System.out.print("SQL：" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return myyjsxe;
}
/**************************************************************************************
*从用户信息表中取得某员工的交通补贴
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
	System.out.print("取员工交通补贴操作失败：" + e+"<br>");
	System.out.print("SQL：" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return jtbt;
}
/**************************************************************************************
*从用户信息表中取得某员工的餐补
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
	System.out.print("取员工餐补操作失败：" + e+"<br>");
	System.out.print("SQL：" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return cb;
}
/**************************************************************************************
*从用户信息表中取得某员工的电话补贴
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
	System.out.print("取员工电话补贴操作失败：" + e+"<br>");
	System.out.print("SQL：" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return dhbt;
}
/**************************************************************************************
*从工资计算系数表取某系数值
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
	System.out.print("取工资系数操作失败：" + e+"<br>");
	System.out.print("SQL：" + sql+"<br>");
	throw(e);
}
finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	
}
return xs;
}

/**************************************************************************************
*从用员工请假表求某段时间内的请假天数
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
		//System.out.println("开始日期是: " + t );
		while (!(t.equals(zzrq)))//从开始日期到终止日期，以一天为步长做循环，记录落在请假时间段内的循环数
		{
			i++;
			cal.setTime(date);
			cal.add(GregorianCalendar.DAY_OF_MONTH, i);
			t=bartDateFormat.format(cal.getTime());
			//System.out.println("日期是: " + t );
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
					System.out.print("取员工请假天数操作失败：" + e+"<br>");
					System.out.print("SQL：" + sql+"<br>");
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

