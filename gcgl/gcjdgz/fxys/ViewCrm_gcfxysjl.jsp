<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String crm_gcfxysjl_ysjlh=null;
String crm_gcfxysjl_khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_hth=null;
String crm_gcfxysjl_ysxmflbm=null;
String crm_gcfxysjl_ysxmflmc=null;
String crm_gcfxysjl_gcysxmbm=null;
String crm_gcfxysjl_gcysxmmc=null;
String crm_gcfxysjl_yssj=null;
String crm_gcfxysjl_ysr=null;
String ysjg=null;
String sffszg=null;
String yssm=null;
String crm_gcfxysjl_sfkhbrqz=null;
String crm_gcfxysjl_dqzysq=null;
String crm_gcfxysjl_lrr=null;
String crm_gcfxysjl_lrsj=null;
String crm_gcfxysjl_lrbm=null;
String crm_gcfxysjl_bz=null;
String crm_gcfxysjl_zpsl=null;
String crm_gcfxysjl_sfszhf=null;
String crm_gcfxysjl_hfszjlh=null;
String crm_gcfxysjl_gcjdbm=null;
String crm_gcfxysjl_ygcjdbm=null;
String crm_gcfxysjl_ysfxhf=null;
String crm_gcfxysjl_yhfrq=null;
String crm_gcfxysjl_yhflxbm=null;
double ysdf=0;
String ysjlh=null;
ysjlh=cf.GB2Uni(request.getParameter("ysjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select crm_gcfxysjl.ysjlh as crm_gcfxysjl_ysjlh,crm_gcfxysjl.khbh as crm_gcfxysjl_khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.hth as crm_khxx_hth,crm_gcfxysjl.ysxmflbm as crm_gcfxysjl_ysxmflbm,crm_gcfxysjl.ysxmflmc as crm_gcfxysjl_ysxmflmc,crm_gcfxysjl.gcysxmbm as crm_gcfxysjl_gcysxmbm,crm_gcfxysjl.gcysxmmc as crm_gcfxysjl_gcysxmmc,crm_gcfxysjl.yssj as crm_gcfxysjl_yssj,crm_gcfxysjl.ysr as crm_gcfxysjl_ysr,crm_gcfxysjl.ysjg as ysjg,crm_gcfxysjl.sfkhbrqz as crm_gcfxysjl_sfkhbrqz,crm_gcfxysjl.dqzysq as crm_gcfxysjl_dqzysq,crm_gcfxysjl.lrr as crm_gcfxysjl_lrr,crm_gcfxysjl.lrsj as crm_gcfxysjl_lrsj,crm_gcfxysjl.lrbm as crm_gcfxysjl_lrbm,crm_gcfxysjl.bz as crm_gcfxysjl_bz,crm_gcfxysjl.zpsl as crm_gcfxysjl_zpsl";
	ls_sql+=" ,DECODE(crm_gcfxysjl.sfszhf,'Y','����','N','������') as crm_gcfxysjl_sfszhf,crm_gcfxysjl.hfszjlh as crm_gcfxysjl_hfszjlh,a.gcjdmc as crm_gcfxysjl_gcjdbm,b.gcjdmc as crm_gcfxysjl_ygcjdbm,DECODE(crm_gcfxysjl.ysfxhf,'Y','��Ҫ','N','����Ҫ') as crm_gcfxysjl_ysfxhf,crm_gcfxysjl.yhfrq as crm_gcfxysjl_yhfrq,hflxmc as crm_gcfxysjl_yhflxbm ";
	ls_sql+=" ,sffszg,yssm,ysdf";
	ls_sql+=" from  crm_gcfxysjl,crm_khxx,dm_hflxbm,dm_gcjdbm a,dm_gcjdbm b";
	ls_sql+=" where crm_gcfxysjl.khbh=crm_khxx.khbh and  (crm_gcfxysjl.ysjlh='"+ysjlh+"')  ";
	ls_sql+=" and crm_gcfxysjl.yhflxbm=dm_hflxbm.hflxbm(+) ";
	ls_sql+=" and crm_gcfxysjl.gcjdbm=a.gcjdbm(+) and crm_gcfxysjl.ygcjdbm=b.gcjdbm(+) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ysdf=rs.getDouble("ysdf");
		sffszg=cf.fillNull(rs.getString("sffszg"));
		yssm=cf.fillNull(rs.getString("yssm"));
		crm_gcfxysjl_ysjlh=cf.fillNull(rs.getString("crm_gcfxysjl_ysjlh"));
		crm_gcfxysjl_khbh=cf.fillNull(rs.getString("crm_gcfxysjl_khbh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_gcfxysjl_ysxmflbm=cf.fillNull(rs.getString("crm_gcfxysjl_ysxmflbm"));
		crm_gcfxysjl_ysxmflmc=cf.fillNull(rs.getString("crm_gcfxysjl_ysxmflmc"));
		crm_gcfxysjl_gcysxmbm=cf.fillNull(rs.getString("crm_gcfxysjl_gcysxmbm"));
		crm_gcfxysjl_gcysxmmc=cf.fillNull(rs.getString("crm_gcfxysjl_gcysxmmc"));
		crm_gcfxysjl_yssj=cf.fillNull(rs.getDate("crm_gcfxysjl_yssj"));
		crm_gcfxysjl_ysr=cf.fillNull(rs.getString("crm_gcfxysjl_ysr"));
		ysjg=cf.fillNull(rs.getString("ysjg"));
		crm_gcfxysjl_sfkhbrqz=cf.fillNull(rs.getString("crm_gcfxysjl_sfkhbrqz"));
		crm_gcfxysjl_dqzysq=cf.fillNull(rs.getString("crm_gcfxysjl_dqzysq"));
		crm_gcfxysjl_lrr=cf.fillNull(rs.getString("crm_gcfxysjl_lrr"));
		crm_gcfxysjl_lrsj=cf.fillNull(rs.getDate("crm_gcfxysjl_lrsj"));
		crm_gcfxysjl_lrbm=cf.fillNull(rs.getString("crm_gcfxysjl_lrbm"));
		crm_gcfxysjl_bz=cf.fillNull(rs.getString("crm_gcfxysjl_bz"));
		crm_gcfxysjl_zpsl=cf.fillNull(rs.getString("crm_gcfxysjl_zpsl"));
		crm_gcfxysjl_sfszhf=cf.fillNull(rs.getString("crm_gcfxysjl_sfszhf"));
		crm_gcfxysjl_hfszjlh=cf.fillNull(rs.getString("crm_gcfxysjl_hfszjlh"));
		crm_gcfxysjl_gcjdbm=cf.fillNull(rs.getString("crm_gcfxysjl_gcjdbm"));
		crm_gcfxysjl_ygcjdbm=cf.fillNull(rs.getString("crm_gcfxysjl_ygcjdbm"));
		crm_gcfxysjl_ysfxhf=cf.fillNull(rs.getString("crm_gcfxysjl_ysfxhf"));
		crm_gcfxysjl_yhfrq=cf.fillNull(rs.getDate("crm_gcfxysjl_yhfrq"));
		crm_gcfxysjl_yhflxbm=cf.fillNull(rs.getString("crm_gcfxysjl_yhflxbm"));
	}
	rs.close();
	ps.close();

%>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> ���̷������գ����ռ�¼�ţ�<%=crm_gcfxysjl_ysjlh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td align="right"> ��ͬ�� </td>
  <td><%=crm_khxx_hth%> </td>
  <td align="right">�ͻ����</td>
  <td><%=crm_gcfxysjl_khbh%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"> 
    �ͻ�����  </td>
  <td width="31%"> 
    <%=crm_khxx_khxm%>  </td>
  <td align="right" width="19%"> 
    ���ݵ�ַ  </td>
  <td width="31%"> 
    <%=crm_khxx_fwdz%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"> 
    ������Ŀ����  </td>
  <td width="31%"> 
    <%=crm_gcfxysjl_ysxmflmc%>  </td>
  <td align="right" width="19%">������Ŀ</td>
  <td width="31%"><%=crm_gcfxysjl_gcysxmmc%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"> 
    ����ʱ��  </td>
  <td width="31%"> 
    <%=crm_gcfxysjl_yssj%>  </td>
  <td align="right" width="19%"> 
    ������  </td>
  <td width="31%"> 
    <%=crm_gcfxysjl_ysr%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"> 
    ���ս��  </td>
  <td width="31%"><%
	cf.radioToken(out, "1+�ϸ�&2+���ϸ�",ysjg,true);
%></td>
  <td align="right" width="19%">���յ÷�</td>
  <td width="31%"><%=ysdf%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ�������</td>
  <td colspan="3"><%
	cf.radioToken(out, "1+��&2+��",sffszg,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����˵��</td>
  <td colspan="3"><%=yssm%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ�ͻ�����ǩ��</td>
  <td><%
	cf.radioToken(out, "Y+��&N+��",crm_gcfxysjl_sfkhbrqz,true);
%></td>
  <td align="right">��ǩ���Ƿ�����Ȩ </td>
  <td><%
	cf.radioToken(out, "Y+��&N+����Ȩ",crm_gcfxysjl_dqzysq,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">¼����</td>
  <td width="31%"><%=crm_gcfxysjl_lrr%></td>
  <td align="right" width="19%">¼��ʱ�� </td>
  <td width="31%"><%=crm_gcfxysjl_lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">¼�벿��</td>
  <td width="31%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+crm_gcfxysjl_lrbm+"'",crm_gcfxysjl_lrbm,true);
%></td>
  <td align="right" width="19%">��Ƭ����</td>
  <td width="31%"><%=crm_gcfxysjl_zpsl%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"> 
    ��ע  </td>
  <td colspan="3"> 
    <%=crm_gcfxysjl_bz%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"> 
    �Ƿ����ûط�  </td>
  <td width="31%"> 
    <%=crm_gcfxysjl_sfszhf%>  </td>
  <td align="right" width="19%"> 
    �ط����ü�¼��  </td>
  <td width="31%"> 
    <%=crm_gcfxysjl_hfszjlh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"> 
    ���ù��̽���  </td>
  <td width="31%"> 
    <%=crm_gcfxysjl_gcjdbm%>  </td>
  <td align="right" width="19%"> 
    ԭ���̽���  </td>
  <td width="31%"> 
    <%=crm_gcfxysjl_ygcjdbm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"> 
    ԭ�Ƿ���ط�  </td>
  <td width="31%"> 
    <%=crm_gcfxysjl_ysfxhf%>  </td>
  <td align="right" width="19%"> 
    ԭӦ�ط�����  </td>
  <td width="31%"> 
    <%=crm_gcfxysjl_yhfrq%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"> 
    ԭ�ط�����  </td>
  <td width="31%"> 
    <%=crm_gcfxysjl_yhflxbm%>  </td>
  <td align="right" width="19%">&nbsp;  </td>
  <td width="31%">&nbsp;  </td>
</tr>
</table>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF"> 
  <td width="25%"> 
	<div align="center"><font color="#000099">�ļ�����</font></div>
  </td>
  <td width="60%"> 
	<div align="center"><font color="#000099">��Ƭ</font></div>
  </td>
</tr>
<%

	String yszpmc=null;
	ls_sql="SELECT yszpmc";
	ls_sql+=" FROM crm_gcfxyszp";
	ls_sql+=" where  ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		yszpmc=rs.getString(1);

		%>
		<tr bgcolor="#FFFFFF"> 
		  <td width="25%"> 
			<div align="center"><%=yszpmc%></div>
		  </td>
		  <td width="60%"> 
			<div align="center"><A HREF="/gcgl/gcjdgz/fxys/ViewImage.jsp?zhaopian=/gcgl/gcjdgz/fxys/fxysimages/<%=java.net.URLEncoder.encode(yszpmc,"UTF-8")%>" target="_blank"><img src="/gcgl/gcjdgz/fxys/fxysimages/<%=yszpmc%>" width="300"></A></div>
		  </td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
  out.print("Exception:" + e);
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

</table>



</body>
</html>
