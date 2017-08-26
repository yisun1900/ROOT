<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObject=new ybl.common.PageObject();

String dwbh=null;
String ywxh=null;
String cpbm=null;
String bqj=null;
String sxj=null;
String zkl=null;
String sjzkl=null;
String khlx=null;
String khbh=null;
String jyfs=null;
String czy=null;
String xsrq=null;
String zkcx=null;
String shbz=null;
String shr=null;
String shrq=null;
String sfjs=null;
String gmyy=null;
String gmyjbm=null;
String lrrq=null;
String whereywxh=null;
String wherecpbm=null;
whereywxh=request.getParameter("ywxh");
wherecpbm=request.getParameter("cpbm");
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

String bkbh=null;
String plmc=null;
String zp=null;
String hyxm="";
String hyjb="";
String fwlx="";
double xfzje=0;
int jf=0;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select dm_xsjl.dwbh,dm_xsjl.ywxh,dm_xsjl.cpbm,dm_xsjl.bkbh,plmc,dm_xsjl.bqj,dm_xsjl.sxj,dm_xsjl.zkl,dm_xsjl.sjzkl,dm_xsjl.khlx,dm_xsjl.khbh,dm_xsjl.jyfs,dm_xsjl.czy,dm_xsjl.xsrq,dm_xsjl.zkcx,shbz,shr,shrq,sfjs,zp,gmyy,gmyjbm,lrrq ";
	ls_sql+=" from  dm_xsjl,xt_plbm,v_bk";
	ls_sql+=" where  dm_xsjl.plbm=xt_plbm.plbm and dm_xsjl.bkbh=v_bk.bkbh";
	ls_sql+=" and  (dm_xsjl.ywxh='"+whereywxh+"') and  (dm_xsjl.cpbm='"+wherecpbm+"')  ";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		dwbh=cf.fillNull(rs.getString("dwbh"));
		ywxh=cf.fillNull(rs.getString("ywxh"));
		cpbm=cf.fillNull(rs.getString(3));
		bqj=cf.fillNull(rs.getString("bqj"));
		bkbh=cf.fillNull(rs.getString("bkbh"));
		plmc=cf.fillNull(rs.getString("plmc"));
		sxj=cf.fillNull(rs.getString("sxj"));
		zkl=cf.fillNull(rs.getString("zkl"));
		sjzkl=cf.fillNull(rs.getString("sjzkl"));
		khlx=cf.fillNull(rs.getString("khlx"));
		khbh=cf.fillNull(rs.getString("khbh"));
		jyfs=cf.fillNull(rs.getString("jyfs"));
		czy=cf.fillNull(rs.getString("czy"));
		xsrq=cf.fillNull(rs.getDate("xsrq"));
		zkcx=cf.fillNull(rs.getString("zkcx"));
		shbz=cf.fillNull(rs.getString("shbz"));
		shr=cf.fillNull(rs.getString("shr"));
		shrq=cf.fillNull(rs.getDate("shrq"));
		sfjs=cf.fillNull(rs.getString("sfjs"));
		zp=cf.fillNull(rs.getString("zp"));
		gmyy=cf.fillNull(rs.getString("gmyy"));
		gmyjbm=cf.fillNull(rs.getString("gmyjbm"));
		lrrq=cf.fillNull(rs.getString("lrrq"));
	}
	rs.close();


	if (!khbh.equals(""))
	{
		ls_sql="select hyxm,DECODE(hyjb,1,'��',2,'����'),DECODE(fwlx,1,'��������',2,'��ֵ����'),xfzje,jf";
		ls_sql+=" from  hy_hyxxb";
		ls_sql+=" where  hykh='"+khbh+"'";
	//	out.println(ls_sql);
		rs =stmt.executeQuery(ls_sql);
		if (rs.next())
		{
			hyxm=cf.fillNull(rs.getString("hyxm"));
			hyjb=cf.fillNull(rs.getString(2));
			fwlx=cf.fillNull(rs.getString(3));
			xfzje=rs.getDouble("xfzje");
			jf=rs.getInt("jf");
		}
		rs.close();
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="98%">
  <tr>
    <td width="1%">&nbsp;</td>
    <td width="98%"> 
      <div align="center"> ��Ʒ������Ϣ</div>
    </td>
    <td width="1%">&nbsp;</td>
  </tr>
  <tr>
    <td width="1%" height="64">&nbsp;</td>
    <td width="98%" height="64"> 
      <div align="center">

        
      <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
        <tr bgcolor="#FFFFFF"> 
          <td width="15%"> 
            <div align="right">���۵�λ</div>
          </td>
          <td width="35%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx",dwbh,true);
%> </td>
          <td rowspan="7" align="right">��Ƭ </td>
          <td rowspan="7"><%=zp%></td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td width="15%" align="right">ҵ�����</td>
          <td width="35%"><%=ywxh%></td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td width="15%" align="right">��Ʒ����</td>
          <td width="35%"><%=cpbm%></td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td width="15%" align="right">�����</td>
          <td width="35%"><%=bkbh%></td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td width="15%" align="right">Ʒ��</td>
          <td width="35%"><%=plmc%></td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td width="15%"> 
            <div align="right">ʵ����</div>
          </td>
          <td width="35%"><%=sxj%> </td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td width="15%"> 
            <div align="right">��ǩ��</div>
          </td>
          <td width="35%"><%=bqj%> </td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td width="15%"> 
            <div align="right">ʵ���ۿ���</div>
          </td>
          <td width="35%"> <%=sjzkl%>% </td>
          <td width="15%"> 
            <div align="right">����ۿ���</div>
          </td>
          <td width="35%"><%=zkl%>% </td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td width="15%" align="right">�ͻ�����</td>
          <td width="35%"> <%
	cf.selectToken(out,"0+һ��ͻ�&1+��Ա",khlx,true);
%> </td>
          <td width="15%" align="right">���׷�ʽ</td>
          <td width="35%"><%
	cf.selectToken(out,"0+�ֽ�&1+���ֽ�",jyfs,true);
%></td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td width="15%"> 
            <div align="right">��Ա���</div>
          </td>
          <td width="35%"> <%=khbh%> </td>
          <td width="15%"> 
            <div align="right">��Ա����</div>
          </td>
          <td width="35%"><%=hyxm%> </td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td width="15%" align="right">��Ա����</td>
          <td width="35%"><%=hyjb%></td>
          <td width="15%" align="right">��������</td>
          <td width="35%"><%=fwlx%></td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td width="15%" align="right">�����ܽ��</td>
          <td width="35%"><%=xfzje%></td>
          <td width="15%" align="right">����</td>
          <td width="35%"><%=jf%></td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td width="15%"> 
            <div align="right">����Ա</div>
          </td>
          <td width="35%"> <%=czy%> </td>
          <td width="15%"> 
            <div align="right">��������</div>
          </td>
          <td width="35%"> <%=xsrq%> </td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td width="15%"> 
            <div align="right">�ۿ۳���</div>
          </td>
          <td width="35%"> <%
	cf.selectToken(out,"0+δ����&1+����",zkcx,true);
%> </td>
          <td width="15%"> 
            <div align="right">��˱�־</div>
          </td>
          <td width="35%"> <%
	cf.selectToken(out,"0+δͨ��&1+ͨ��&9+δ���",shbz,true);
%> </td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td width="15%"> 
            <div align="right">�����</div>
          </td>
          <td width="35%"> <%=shr%> </td>
          <td width="15%"> 
            <div align="right">�������</div>
          </td>
          <td width="35%"> <%=shrq%> </td>
        </tr>
        <tr bgcolor="#FFFFFF">
          <td width="15%" align="right">����ԭ��</td>
          <td width="35%"><%cf.selectItem(out,"select gmyjbm,gmyjmc from hy_gmyjbm",gmyjbm,true);%></td>
          <td width="15%" align="right">�������</td>
          <td width="35%"><%cf.selectItem(out,"select xh,gmyy from hy_gmyydmb",gmyy,true);%></td>
        </tr>
        <tr bgcolor="#FFFFFF"> 
          <td width="15%"> 
            <div align="right">�Ƿ����</div>
          </td>
          <td width="35%"> <%
	cf.selectToken(out,"0+δ����&1+����",sfjs,true);
%> </td>
          <td width="15%" align="right"> 
            <div align="right">¼������</div>
          </td>
          <td width="35%"><%=lrrq%> </td>
        </tr>
      </table>
<p align="center">������Ʒ������Ϣ
<%
	ls_sql="SELECT xh,zpbm,plmc,sl,djzl,DECODE(zplx,1,'��Ʒת��',2,'��Ʒ')  ";
	ls_sql+=" FROM dm_zpxs,xt_plbm  ";
    ls_sql+=" WHERE dm_zpxs.plbm=xt_plbm.plbm and ywxh='"+ywxh+"' and cpbm='"+cpbm+"'";
    pageObject.sql=ls_sql;
//���ж����ʼ��
	pageObject.initPage("","","","");
	pageObject.setPageRow(1000);

	pageObject.out=out;
	pageObject.getDate(1);
	pageObject.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%" height="2">���</td>
	<td  width="14%" height="2">��Ʒ����</td>
	<td  width="25%" height="2">Ʒ������</td>
	<td  width="10%" height="2">����</td>
	<td  width="14%" height="2">��������</td>
	<td  width="14%" height="2">��Ʒ����</td>
</tr>
<%
	pageObject.printDate();
	pageObject.printFoot();
%> 
	  
	  </div>
    </td>
    <td width="1%" height="64">&nbsp;</td>
  </tr>
  <tr>
    <td width="1%">&nbsp;</td>
    <td width="98%">&nbsp;</td>
    <td width="1%">&nbsp;</td>
  </tr>
</table>
</body>
</html>
