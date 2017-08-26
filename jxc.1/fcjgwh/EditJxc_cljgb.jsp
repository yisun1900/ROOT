<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrr=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");

String gysmc=null;
String xsfs=null;
double dfgsjg=0;
double dgzjg=0;
String sfyh=null;
double zxqdl=0;
double cbj=0;
String bz=null;
String sfcy=null;

String ppmc=null;
String cglb=null;
String clmc=null;
String nbbm=null;
String jldwbm=null;
String xh=null;
String gg=null;


String clbm=cf.GB2Uni(request.getParameter("clbm"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select jxc_cljgb.sfcy,jxc_cljgb.gysmc,jxc_cljgb.xsfs,jxc_cljgb.cbj,jxc_cljgb.dfgsjg,jxc_cljgb.dgzjg,jxc_cljgb.zxqdl,jxc_cljgb.sfyh,jxc_cljgb.bz ";
	ls_sql+=" ,jxc_clbm.ppmc,jxc_clbm.cglb,jxc_clbm.clmc,jxc_clbm.nbbm,jxc_clbm.jldwbm,jxc_clbm.xh,jxc_clbm.gg";
	ls_sql+=" from  jxc_cljgb,jxc_clbm";
	ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm and (jxc_cljgb.clbm='"+clbm+"') and  (dqbm='"+dqbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfcy=cf.fillNull(rs.getString("sfcy"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		xsfs=cf.fillNull(rs.getString("xsfs"));
		cbj=rs.getDouble("cbj");
		dfgsjg=rs.getDouble("dfgsjg");
		dgzjg=rs.getDouble("dgzjg");
		zxqdl=rs.getDouble("zxqdl");
		sfyh=cf.fillNull(rs.getString("sfyh"));
		bz=cf.fillNull(rs.getString("bz"));

		ppmc=cf.fillNull(rs.getString("ppmc"));
		cglb=cf.fillNull(rs.getString("cglb"));
		clmc=cf.fillNull(rs.getString("clmc"));
		nbbm=cf.fillNull(rs.getString("nbbm"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
	
	
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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditJxc_cljgb.jsp" name="editform">
<div align="center">���ļ۸�ά��</div>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#0000CC">���ϱ���</font></td> 
  <td width="32%"><%=clbm%></td>
  <td align="right" width="18%"><font color="#0000CC">��������</font></td> 
  <td width="32%"> 
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'  order by dqmc",dqbm,true);
%>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000CC">��������</font></td>
  <td><%=clmc%></td>
  <td align="right"><font color="#0000CC">��Ʒ��</font></td>
  <td><%=ppmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000CC">�ڲ�����</font></td>
  <td><%=nbbm%></td>
  <td align="right"><font color="#0000CC">������λ</font></td>
  <td><%=jldwbm%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000CC">�ͺ�</font></td>
  <td><%=xh%></td>
  <td align="right"><font color="#0000CC">���</font></td>
  <td><%=gg%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="right">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>��Ӧ��</td> 
  <td colspan="3"> 
<select name="gysmc" style="FONT-SIZE:12PX;WIDTH:452PX">
    <%
		out.print("<option value=\"\"></option>");
		cf.selectItem(out,"select gysmc c1,gysmc c2 from jxc_gysxx where cllx in('2','3') and dqbm='"+dqbm+"' order by gysmc",gysmc);
%>
  </select> </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�ɱ���</td>
  <td><input type="text" name="cbj" size="20"   value="<%=cbj%>" ></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;     </td>
</tr>

 <tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>�Էֹ�˾�۸�</td> 
  <td width="32%"> 
    <input type="text" name="dfgsjg" size="20"   value="<%=dfgsjg%>" >  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font>�Թ����۸�</td> 
  <td width="32%"> 
    <input type="text" name="dgzjg" size="20"   value="<%=dgzjg%>" >  </td>
</tr> 
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>��С����</td>
  <td><input type="text" name="zxqdl" size="20"   value="<%=zxqdl%>" ></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>�Ƿ���</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfcy","Y+����&N+������",sfcy);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ��л�</td>
  <td><%
	cf.radioToken(out, "sfyh","Y+�л�&N+�޻�",sfyh);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>���۷�ʽ</td> 
  <td colspan="3">
<%
	cf.radioToken(out, "xsfs","1+����Ʒ&2+�ֻ�����&3+�ڻ�����&4+��������",xsfs);
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">¼����</font></td> 
  <td width="32%"><input type="text" name="lrr" size="20"   value="<%=lrr%>" readonly></td>
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">¼��ʱ��</font></td> 
  <td width="32%"><input type="text" name="lrsj" size="20"  value="<%=cf.today()%>" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">¼�벿��</font></td> 
  <td width="32%">
  <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'  order by dwmc","");
%>
  </select>  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">�����ֹ�˾</font></td> 
  <td width="32%">
  <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'  order by dwmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="2"><%=bz%></textarea></td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="clbm"  value="<%=clbm%>" >
		<input type="hidden" name="dqbm"  value="<%=dqbm%>" >
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.clbm)=="") {
		alert("������[���ϱ���]��");
		FormName.clbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("������[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gysmc)=="") {
		alert("������[��Ӧ��]��");
		FormName.gysmc.focus();
		return false;
	}

	if(	javaTrim(FormName.cbj)=="") {
		alert("������[�ɱ���]��");
		FormName.cbj.focus();
		return false;
	}
	if(!(isFloat(FormName.cbj, "�ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.dfgsjg)=="") {
		alert("������[�Էֹ�˾�۸�]��");
		FormName.dfgsjg.focus();
		return false;
	}
	if(!(isFloat(FormName.dfgsjg, "�Էֹ�˾�۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.dgzjg)=="") {
		alert("������[�Թ����۸�]��");
		FormName.dgzjg.focus();
		return false;
	}
	if(!(isFloat(FormName.dgzjg, "�Թ����۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.zxqdl)=="") {
		alert("������[��С����]��");
		FormName.zxqdl.focus();
		return false;
	}
	if(!(isFloat(FormName.zxqdl, "��С����"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfcy)) {
		alert("��ѡ��[�Ƿ���]��");
		FormName.sfcy[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyh)) {
		alert("��ѡ��[�Ƿ��л�]��");
		FormName.sfyh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.xsfs)) {
		alert("��ѡ��[���۷�ʽ]��");
		FormName.xsfs[0].focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
