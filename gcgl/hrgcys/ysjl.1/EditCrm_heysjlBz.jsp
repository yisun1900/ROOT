<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrdw=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");


String khbh=null;
String yssj=null;
String ysr=null;
String lrbm=null;
String lrr=null;
String lrsj=null;
String bz=null;
String yscsjlh=null;
String gcysxmmc=null;
String sjysjg=null;
String sgd=null;
String sjs=null;
String zjxm=null;
String clbz=null;


String khxm=null;
String fwdz=null;
String lxfs=null;
String sjkgrq=null;
String sgbz=null;

String ysjlh=cf.GB2Uni(request.getParameter("ysjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="select crm_heysjl.yssj,crm_heysjl.ysr,crm_heysjl.lrbm,crm_heysjl.lrr,crm_heysjl.lrsj,crm_heysjl.bz,crm_heysjl.khbh,crm_heysjl.sjs,crm_heysjl.zjxm,sgdmc,crm_heysjl.yscsjlh,crm_heysjl.gcysxmmc,DECODE(crm_heysjl.sjysjg,'0','�ϸ�','1','������') sjysjg,DECODE(crm_heysjl.clbz,'9','¼��δ���','0','û����','1','����δ����','2','����','3','�Ѵ���','4','�ѽ��','5','����ͨ��','6','����δͨ��') clbz";
	ls_sql+=" from  crm_heysjl,sq_sgd";
	ls_sql+=" where  crm_heysjl.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and crm_heysjl.ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yssj=cf.fillNull(rs.getDate("yssj"));
		ysr=cf.fillNull(rs.getString("ysr"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getString("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sjs=cf.fillNull(rs.getString("sjs"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgdmc"));
		yscsjlh=cf.fillNull(rs.getString("yscsjlh"));
		gcysxmmc=cf.fillNull(rs.getString("gcysxmmc"));
		sjysjg=cf.fillNull(rs.getString("sjysjg"));
		clbz=cf.fillNull(rs.getString("clbz"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,lxfs,sjkgrq,sgbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		lxfs=rs.getString("lxfs");
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
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

<html>
<head>
<title>�޸ı�ע</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<form method="post" action="SaveEditCrm_heysjlBz.jsp" name="editform" >
<div align="center">�޸ı�ע(���ռ�¼��:<%=ysjlh%>)</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right"><font color="#000099">�ͻ����</font> </td>
    <td width="32%"><%=khbh%> </td>
    <td width="18%" align="right"><font color="#000099">ʵ��������</font> </td>
    <td width="32%"><%=sjkgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">�ͻ�����</font></td>
    <td><%=khxm%></td>
    <td align="right"><font color="#000099">��ϵ��ʽ</font></td>
    <td><input type="button" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" value="�鿴�绰" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">���ݵ�ַ</font></td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">���ʦ</font></td>
    <td><%=sjs%></td>
    <td align="right"><font color="#000099">ʩ����</font></td>
    <td><%=sgd%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">�ʼ�����</font></td>
    <td><%=zjxm%></td>
    <td align="right"><font color="#000099">ʩ������</font></td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="right" bgcolor="#CCCCCC"><font color="#CCCCCC">&nbsp;</font></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">���ռ�¼��</td>
    <td><%=ysjlh%></td>
    <td align="right">���մ�����¼��</td>
    <td><%=yscsjlh%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">������ </td>
    <td><%=ysr%> </td>
    <td align="right"> ����ʱ�� </td>
    <td><%=yssj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> ������Ŀ </td>
    <td><%=gcysxmmc%>    </td>
    <td align="right"> ���ս�� </td>
    <td><%=sjysjg%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> ¼���� </td>
    <td><%=lrr%> </td>
    <td align="right"> ¼��ʱ�� </td>
    <td><%=lrsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��ע</td>
    <td colspan="3"> <textarea name="bz" cols="71" rows="4" ><%=bz%></textarea></td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="ysjlh"  value="<%=ysjlh%>" >
	  <input type="button"  value="����" onClick="f_do(editform)">
      <input name="ckxm" type="button"  onClick="window.open('ViewCrm_heysmxb.jsp?ysjlh=<%=ysjlh%>')"  value="�鿴��Ŀ" > 
	  <input name="cktp" type="button" id="cktp" onClick="window.open('ViewZp1.jsp?ysjlh=<%=ysjlh%>')"  value="�鿴ͼƬ" > 
	  <input type="reset"  value="����">
	</div>      </td>
    </tr>
  </table>

</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.bz)=="") {
		alert("������[��ע]��");
		FormName.bz.focus();
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
