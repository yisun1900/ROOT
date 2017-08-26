<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%

String cgjhmc=null;
String cgsqr=null;
String jhkssj=null;
String jhjssj=null;
String jhje=null;
String jhnr=null;
String jhdzt=null;
String ssfgs=null;
String lrr=null;
String lrsj=null;
String shr=null;
String shsj=null;
String shjg=null;
String shnr=null;
String bz=null;
String dqbm=null;
String cgjhph=null;
cgjhph=cf.GB2Uni(request.getParameter("cgjhph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select cgjhmc,cgsqr,jhkssj,jhjssj,jhje,jhnr,DECODE(jhdzt,'0','¼��δ�ύ','1','�ȴ����','2','������','9','�ƻ����') jhdzt,dwmc ssfgs,lrr,lrsj,shr,shsj,DECODE(shjg,'Y','���ͨ��','N','���δͨ��','�ȴ����') shjg,shnr,jxc_clcgjh.bz bz,dqbm ";
	ls_sql+=" from  jxc_clcgjh,sq_dwxx ";
	ls_sql+=" where jxc_clcgjh.ssfgs=sq_dwxx.dwbh and  (cgjhph='"+cgjhph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cgjhmc=cf.fillNull(rs.getString("cgjhmc"));
		cgsqr=cf.fillNull(rs.getString("cgsqr"));
		jhkssj=cf.fillNull(rs.getDate("jhkssj"));
		jhjssj=cf.fillNull(rs.getDate("jhjssj"));
		jhje=cf.fillNull(rs.getString("jhje"));
		jhnr=cf.fillNull(rs.getString("jhnr"));
		jhdzt=cf.fillNull(rs.getString("jhdzt"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		shr=cf.fillNull(rs.getString("shr"));
		shsj=cf.fillNull(rs.getDate("shsj"));
		shjg=cf.fillNull(rs.getString("shjg"));
		shnr=cf.fillNull(rs.getString("shnr"));
		bz=cf.fillNull(rs.getString("bz"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

%>

<html>
<head>
<title>�ɹ��ƻ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> �ɹ��ƻ����</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �ɹ��ƻ�����  </td>
  <td width="35%"> 
    <%=cgjhph%>  </td>
  <td align="right" width="15%"> 
    �ɹ��ƻ�����  </td>
  <td width="35%"> 
    <%=cgjhmc%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �ɹ�������  </td>
  <td width="35%"> 
    <%=cgsqr%>  </td>
  <td align="right" width="15%">�ƻ����</td>
  <td width="35%"><%=jhje%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �ƻ���ʼʱ��  </td>
  <td width="35%"><%=jhkssj%></td>
  <td align="right" width="15%">�ƻ�����ʱ��</td>
  <td width="35%"><%=jhjssj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼����</td>
  <td width="35%"><%=lrr%></td>
  <td align="right" width="15%">¼��ʱ��</td>
  <td width="35%"><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    �����ֹ�˾  </td>
  <td width="35%"> 
    <%=ssfgs%>  </td>
  <td align="right" width="15%">�ƻ���״̬</td>
  <td width="35%"><%=jhdzt%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�����</td>
  <td><%=shr%></td>
  <td align="right">���ʱ��</td>
  <td><%=shsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��˽��</td>
  <td><%=shjg%></td>
  <td align="right">�������</td>
  <td><%=shnr%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ƻ�����</td>
  <td colspan="3"><%=jhnr%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" height="22" align="right">��ע</td>
  <td colspan="3"><%=bz%></td>
  </tr>
</table>




</br>
�깺����:
<%
String sgph=null;

	ls_sql="select sgph ";
	ls_sql+=" from  jxc_sgzcgdzb ";
	ls_sql+=" where (cgjhph='"+cgjhph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		sgph=cf.fillNull(rs.getString("sgph"));
		out.print("<a href=\"/jxczc/jxc_clsg/ViewJxc_clsgd.jsp?sgph="+sgph+"\" target=\"_blank\">"+sgph+"</a>&nbsp;&nbsp;&nbsp;");

	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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

<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">�ڲ�����</td>
	<td  width="8%">��������</td>
	<td  width="8%">�ͺ�</td>
	<td  width="8%">���</td>
	<td  width="5%" bgcolor="#00cccc">�ڿ�����</td>
	<td  width="5%" bgcolor="#00cccc">��������</td>
	<td  width="5%" bgcolor="#00cccc">���ÿ��</td>
	<td  width="5%">�ɹ�����</td>
	<td  width="5%">�ƻ��ɹ�����</td>
	<td  width="6%">�ɹ����</td>
    <td  width="5%">��װ���</td>
	<td  width="13%">��Ӧ��</td>
	<td  width="6%">����С��</td>
	<td  width="9%">��Ʒ��</td>
	<td  width="7%">���ϱ���</td>
</tr>
<%
	ls_sql="SELECT jxc_clbm.nbbm nbbm,jxc_clbm.clmc,jxc_clbm.xh,jxc_clbm.gg,jxc_cljgb.zcpzsl,jxc_cljgb.dhsl,jxc_cljgb.zcpzsl-jxc_cljgb.dhsl kykc,jxc_cgjhmx.jhcgdj,jxc_cgjhmx.jhcgsl,jxc_cgjhmx.jhcgje,jxc_clbm.bzgg bzgg,jxc_cljgb.gysmc,jxc_clbm.clxlbm,jxc_clbm.ppmc,jxc_cljgb.clbm clbm ";
	ls_sql+=" FROM jxc_cgjhmx,jxc_cljgb,jxc_clbm,dm_dqbm  ";
	ls_sql+=" where jxc_cgjhmx.cgjhph='"+cgjhph+"' and jxc_cljgb.dqbm='"+dqbm+"' ";
	ls_sql+=" and jxc_cljgb.clbm=jxc_cgjhmx.clbm ";
    ls_sql+=" and jxc_clbm.clbm=jxc_cgjhmx.clbm  and dm_dqbm.dqbm=jxc_cljgb.dqbm ";

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");

	pageObj.setPageRow(4000);//����ÿҳ��ʾ��¼��


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
	pageObj.printFoot();
%> 


<form method="post" action="SaveShJxc_clcgjh.jsp" name="insertform" target="">
<div align="center" ><font size="3">����д��˽��</font ></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
<td align="right" width="15%">�ɹ��ƻ�����</td> 
  <td width="35%"> 
	<input type="text" name="cgjhph" value="<%=cgjhph%>" size="20" maxlength="20" readonly >
	 </td>
  <td align="right" width="15%">��˽��</td> 
  <td width="35%">
  <select name="shjg" style="FONT-SIZE:12PX;WIDTH:152PX">
<option value=""></option>
<option value="Y">���ͨ��</option>
<option value="N">���δͨ��</option>
  </select></td>
  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�������</td> 
  <td colspan="3"><textarea name="shnr" cols="71" rows="5" ></textarea></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">      </td>
    </tr>
</table>

</form>

</html>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.shjg)=="") {
		alert("������[��˽��]��");
		FormName.shjg.focus();
		return false;
	}
//	if(	javaTrim(FormName.shnr)=="") {
//		alert("������[�������]��");
//		FormName.shnr.focus();
//		return false;
//	}

	FormName.submit();
	return true;
}



//-->
</SCRIPT>

