<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
if (yhjs.equals("G0"))
{
	return;
}
String khbh=cf.GB2Uni(request.getParameter("khbh"));

String ddbh=request.getParameter("ddbh");
String bzdh="";
String sgd="";
String clgwdh="";
String ssfgs="";

String khxm=null;
String ddlx=null;
String cxhdbm=null;
String sjs="";
String dwmc="";
String sgbz=null;
String hth=null;
String jc_mmydd_jhazsj=null;
String qhtsj=null;
String lxfs=null;
String fwdz=null;
String sgdmc=null;
String sgddh=null;
String fgsbh=null;
String xmzy=null;
String xmzydh=null;
String bz=null;
String ppbm=null;
String clzt="";
String tdsj=null;
String sxhtsfysh=null;
String xclbz=null;
String htshsj="";
String zcdlbm="";
String xshth="";
String clgw="";
String fkxh=null;
String cw_khfkjl_fkje=null;
String ddqrsj=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double hkze=0;
double wdzje=0;
double zczkl=0;
double zqzjhze=0;
double zjhze=0;
double fkje=0;
String skr=null;//�տ���
String skrq=null;
String sjr=null;
String shsj=null;

double zcpclf=0;
double tjpclf=0;
double ycf=0;
double qtf=0;
double djqje=0;

String fkfs="";

try {
	conn=cf.getConnection();

	ls_sql="select jc_zcdd.djqje,ddqrsj,xclbz,jc_zcdd.sxhtsfysh,jc_zcdd.zqzjhze,jc_zcdd.zjhze,jc_zcdd.tdsj,jc_zcdd.clzt,jc_zcdd.ppbm,jc_zcdd.bz,crm_khxx.fgsbh,jc_zcdd.xmzy,crm_khxx.khxm,cxhdbm,qhtsj,dwmc,sjs,crm_khxx.sgd,sgbz,jc_zcdd.htshsj,crm_khxx.hth,jc_zcdd.zczkl,jc_zcdd.wdzje,jc_zcdd.hkze,sgdmc,sq_sgd.dh,fwdz,sgbz,lxfs,jc_zcdd.clgw,crm_khxx.lxfs,jc_zcdd.ddbh,DECODE(jc_zcdd.ddlx,'1','����Ʒ','3','��¼��ͬ','4','�п�涩��','5','��׼�ײ�','6','�Ҿ߽����ײ�','7','��ů�����ײ�','8','�����ײ�','9','��������','A','��������','B','��������շ�','C','ѡ������','D','�ײ�������','E','ɢ��') ddlx,jc_zcdd.xshth,jc_zcdd.zcdlbm";
	ls_sql+=" ,zcpclf,tjpclf,ycf,qtf";
	ls_sql+=" from  jc_zcdd,crm_khxx,sq_sgd,sq_dwxx";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+) and  jc_zcdd.ddbh='"+ddbh+"'";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh";

	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		djqje=rs.getDouble("djqje");
		ddqrsj=cf.fillNull(rs.getDate("ddqrsj"));
		zcpclf=rs.getDouble("zcpclf");
		tjpclf=rs.getDouble("tjpclf");
		ycf=rs.getDouble("ycf");
		qtf=rs.getDouble("qtf");

		sxhtsfysh=cf.fillNull(rs.getString("sxhtsfysh"));
		zqzjhze=rs.getDouble("zqzjhze");
		zjhze=rs.getDouble("zjhze");
		tdsj=cf.fillNull(rs.getDate("tdsj"));
		clzt=cf.fillNull(rs.getString("clzt"));
		ppbm=cf.fillHtml(rs.getString("ppbm"));
		bz=cf.fillHtml(rs.getString("bz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		xmzy=cf.fillHtml(rs.getString("xmzy"));
		khxm=cf.fillNull(rs.getString("khxm"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		zczkl=rs.getDouble("zczkl");
		wdzje=rs.getDouble("wdzje");
		hkze=rs.getDouble("hkze");
		sgbz=cf.fillNull(rs.getString("sgbz"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sgddh=cf.fillNull(rs.getString("dh"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		htshsj=cf.fillNull(rs.getDate("htshsj"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		xclbz=cf.fillNull(rs.getString("xclbz"));
		clgw=cf.fillHtml(rs.getString("clgw"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		ddbh=cf.fillHtml(rs.getString("ddbh"));
		ddlx=cf.fillHtml(rs.getString("ddlx"));
		xshth=cf.fillNull(rs.getString("xshth"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
	 }
	 rs.close();
	 ps.close();

	if (clzt.equals("09"))
	{
		out.println("����!����δȷ��");
		return;
	}
	if (clzt.equals("99"))
	{
		zcpclf=-1*zcpclf;
		tjpclf=-1*tjpclf;
		ycf=-1*ycf;
		qtf=-1*qtf;
		hkze=-1*hkze;
	}



	ls_sql="select sum(fkje)";
	ls_sql+=" from cw_khfkjl ";
	ls_sql+=" where ddbh='"+ddbh+"' and scbz='N' and fklxbm='23'";//21:ľ�ţ�22:����23:���ģ�24�Ҿ�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fkje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	String fklxmc="";
	String zffsmc="";
	double getfkje=0;
	ls_sql="select fklxmc,zffsmc,fkje";
	ls_sql+=" from cw_khfkjl,cw_fklxbm,cw_zffsbm ";
	ls_sql+=" where ddbh='"+ddbh+"' and scbz='N' and cw_khfkjl.fklxbm='23'";//21:ľ�ţ�22:����23:���ģ�24�Ҿ�
	ls_sql+=" and cw_khfkjl.zckx=cw_fklxbm.fklxbm(+) ";
	ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm(+) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		fklxmc=rs.getString("fklxmc");
		zffsmc=rs.getString("zffsmc");
		getfkje=rs.getDouble("fkje");

		if (fklxmc==null)
		{
			fklxmc=zffsmc;
		}

		fkfs+=fklxmc+":"+getfkje+"��";
	}
	rs.close();
	ps.close();

	
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc ='"+clgw+"' and zwbm='08'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clgwdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

%>

<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE3 {font-family: "����"; font-size: 14px; }
.STYLE7 {
	font-size: 16px;
	font-family: "����";
}
.STYLE8 {
	font-size: 18px;
	font-weight: bold;
}
-->
</style>
</head>
<body bgcolor="#FFFFFF">
	<div align="center" class="STYLE8">�����ڴ����Ŀ�ƾ֤</div>

<table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>

  <tr> 
    <td width="15%" height="30" align="right">�տ�����</td>
    <td colspan="5">����
    <input type="checkbox" name="checkbox3" value="checkbox">
    �˻�
    <input type="checkbox" name="checkbox2" value="checkbox" checked></td>
  </tr>
  <tr height="27">
    <td align="right" >�ͻ�����</td>
    <td width="17%" height="27" ><%=khxm%></td>
    <td width="13%" height="27" align="right">����</td>
    <td width="20%"><%=dwmc%></td>
    <td width="16%" height="27" align="right">��������ʱ��</td>
    <td width="19%"><%=ddqrsj%></td>
  </tr>
  <tr height="27">
    <td height="27" align="right">��ϵ��ʽ</td>
    <td height="27" colspan="3"><%=lxfs%></td>
    <td height="27" align="right">�ͻ�����</td>
    <td height="27"><%=htshsj%></td>
  </tr>
  <tr height="27">
    <td height="27" align="right">��ַ</td>
    <td height="27" colspan="3"><%=fwdz%></td>
    <td height="27" align="right">���ĺ�ͬ��</td>
    <td height="27"><%=xshth%></td>
  </tr>
  
  <tr height="27">
    <td align="right">ϵͳ���</td>
    <td><%=ddbh%></td>
    <td align="right">�������</td>
    <td><%=zcdlbm%></td>
    <td align="right">��������</td>
    <td><%=ddlx%></td>
  </tr>
  <tr height="27">
    <td align="right">Ʒ��</td>
    <td colspan="5"><%=ppbm%></td>
  </tr>
  <tr height="27">
    <td align="right">����Ʒ���Ϸ�</td>
    <td colspan="5"><%=zcpclf%></td>
  </tr>
  <tr height="27">
    <td align="right">�ؼ�Ʒ���Ϸ�</td>
    <td colspan="5"><%=tjpclf%></td>
  </tr>
  <tr height="27">
    <td align="right">Զ�̷�</td>
    <td colspan="5"><%=ycf%></td>
  </tr>
  <tr height="27">
    <td align="right">��װ���Ϸ�</td>
    <td colspan="5"><%=qtf%></td>
  </tr>
  <tr height="27">
    <td align="right">��ͬ���</td>
    <td colspan="5"><%=hkze%></td>
  </tr>
  
  <tr height="27">
    <td align="right">��д</td>
    <td colspan="5"><%=cf.NumToRMBStr(hkze)%></td>
  </tr>
</table> 

<BR>

<table width="1231" border="0" style='FONT-SIZE: 14px'>
      <tr>
        <td>ע��:</td>
      </tr>
      <tr>
        <td>1�������������ڴ�ͳһ��ȡ����ƾ֤��Ϊ�ͻ���������ݡ�</td>
      </tr>
      <tr>
        <td>2����ƾ֤������Ա�������ڴ�곤ǩ��ȷ�Ϻ��̼Ҽȿɷ�����</td>
      </tr>
      <tr>
        <td>3�������˻����ͻ���ƾ�˿�ƾ֤���������ڴ￢������ʱ�˻����</td>
      </tr>
      <tr>
        <td>4���̼ұ�����վ�ԭ������Ϊ�������ڴ���ʵ����ݡ�</td>
      </tr>
</table>
<BR>
   <table width="100%" border="0" style='FONT-SIZE: 14px'>
     <tr>
       <td width="473">����Աǩ�֣�</td>
       <td width="475">�����ڴ�곤ǩ�֣�</td>
     </tr>

     <tr>
       <td width="473">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ڣ�</td>
       <td width="475">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ڣ�</td>
     </tr>
   </table>




</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception:2 " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


