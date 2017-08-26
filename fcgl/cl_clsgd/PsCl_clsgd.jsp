<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String sgph=request.getParameter("sgph");

String lrr=null;
String lrsj=null;
String dwbh=null;
String bz=null;
String psfs=null;
String jhshsj=null;

String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
try { 
	conn=cf.getConnection();
	ls_sql=" select lrr,lrsj,dwbh,bz,psfs,jhshsj ";
	ls_sql+=" from cl_clsgd where sgph='"+sgph+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		lrr = cf.fillNull(rs.getString("lrr"));
		lrsj = cf.fillNull(rs.getDate("lrsj"));
		dwbh = cf.fillNull(rs.getString("dwbh"));
		bz = cf.fillNull(rs.getString("bz"));
		jhshsj = cf.fillNull(rs.getDate("jhshsj"));
		psfs = cf.fillNull(rs.getString("psfs"));
	}
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	out.print("SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>
<html>
<head>
<title>����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">����(�깺����:<%=sgph%>)</div> 
    </td>
  </tr>
  <tr>
	<td width="100%" > 
	<div align="center">
		<form method="post" action="" name="insertform" >
			
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#990000">*</font><font color="#000099">¼����</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#990000">*</font><font color="#000099"></font><font color="#000099">¼��ʱ��</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="lrsj" value="<%=lrsj%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#990000">*</font><font color="#000099"></font><font color="#000099">�깺��λ</font></td>
              <td width="32%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
                </select>
              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#000099">���ͷ�ʽ</font></td>
              <td width="32%"><%
	cf.radioToken(out, "psfs","1+����&2+����&9+����",psfs);
%></td>
              <td width="18%" align="right"><font color="#000099">�ƻ��ͻ�ʱ��</font></td>
              <td width="32%"> 
                <input type="text" name="jhshsj" value="<%=jhshsj%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%"><font color="#CC0000">*</font>ʵ���ͻ�ʱ��</td>
              <td width="32%"> 
                <input type="text" name="shsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td align="right" width="18%"><font color="#CC0000">*</font>�˷�</td>
              <td width="32%"> 
                <input type="text" name="yf" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">����¼����</font></td>
              <td width="32%"> 
                <input type="text" name="pslrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
              </td>
              <td align="right" width="18%"><font color="#CC0000">*</font><font color="#0000CC">����¼��ʱ��</font></td>
              <td width="32%"> 
                <input type="text" name="pslrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">��ע</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="69" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input name="sgph" type="hidden" value="<%=sgph%>">
                <input type="button" name="cp" value=" �� �� " onClick="f_do(insertform)">
                &nbsp; 
                <input type="button"   value="�鿴���" onClick="window.open('/fcgl/tjfx/kcfxList.jsp?fgs=<%=dwbh%>')">
                <input type="reset"   value=" �� �� " name="reset">
                &nbsp; &nbsp; </td>
            </tr>
          </table>
		</form>
	</div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.shsj)=="") {
		alert("������[ʵ���ͻ�ʱ��]��");
		FormName.shsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.shsj, "ʵ���ͻ�ʱ��"))) {
		return false;
	}

	if(	javaTrim(FormName.pslrr)=="") {
		alert("������[����¼����]��");
		FormName.pslrr.focus();
		return false;
	}
	if(	javaTrim(FormName.pslrsj)=="") {
		alert("������[����¼��ʱ��]��");
		FormName.pslrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pslrsj, "����¼��ʱ��"))) {
		return false;
	}

	if(	javaTrim(FormName.yf)=="") {
		alert("������[�˷�]��");
		FormName.yf.focus();
		return false;
	}
	if(!(isFloat(FormName.yf, "�˷�"))) {
		return false;
	}

	FormName.action="SavePsCl_clsgd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
