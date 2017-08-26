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
String dfgsjg=null;
String dgzjg=null;
String sfyh=null;
String zxqdl=null;
String cbj=null;
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
		cbj=cf.fillNull(rs.getString("cbj"));
		dfgsjg=cf.fillNull(rs.getString("dfgsjg"));
		dgzjg=cf.fillNull(rs.getString("dgzjg"));
		zxqdl=cf.fillNull(rs.getString("zxqdl"));
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
<form method="post" action="SaveEditGdjJxc_cljgb.jsp" name="editform">
<div align="center">�޸�ʩ���Ӽ�</div>

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
  <td align="right" width="18%"><font color="#0000CC">��Ӧ��</font></td> 
  <td colspan="3"><%=gysmc%></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000CC">��С����</font></td>
  <td><%=zxqdl%></td>
  <td align="right" width="18%"><font color="#0000CC">�Ƿ���</font></td> 
  <td width="32%"><%
	cf.radioToken(out,"Y+����&N+������",sfcy,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#0000CC">���۷�ʽ</font></td> 
  <td width="32%">
<%
	cf.radioToken(out,"1+����Ʒ&2+�ֻ�����&3+�ڻ�����&4+��������",xsfs,true);
%>  </td>
  <td align="right" width="18%"><font color="#0000CC">�Ƿ��л�</font></td> 
  <td width="32%">
<%
	cf.radioToken(out,"Y+�л�&N+�޻�",sfyh,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="right">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�Թ����۸�</td>
  <td><input type="text" name="dgzjg" size="20"   value="<%=dgzjg%>" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
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
	if(	javaTrim(FormName.dgzjg)=="") {
		alert("������[�Թ����۸�]��");
		FormName.dgzjg.focus();
		return false;
	}
	if(!(isFloat(FormName.dgzjg, "�Թ����۸�"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
