<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String lrbm=(String)session.getAttribute("dwbh");
String lrr=(String)session.getAttribute("yhmc");

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qyrq=null;
String kgrq=null;
String sjkgrq=null;
String jgrq=null;
String sjjgrq=null;
String dwbh=null;
String sgd=null;
String zjxm=null;
String fgsbh=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qyrq,kgrq,sjkgrq,jgrq,sjjgrq,dwbh,sgd,zjxm,fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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


<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ������걨 </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertYbj_ybjsb.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#CCCCFF"> 
              <td width="18%"> 
                <div align="right">�ͻ����</div>
              </td>
              <td width="32%"> <%=khbh%> </td>
              <td width="18%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="32%"> <%=khxm%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%"> 
                <div align="right">���ݵ�ַ</div>
              </td>
              <td width="32%"> <%=fwdz%> </td>
              <td width="18%"> 
                <div align="right">��ϵ��ʽ</div>
              </td>
              <td width="32%"> <%=lxfs%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%"> 
                <div align="right">��ͬ��</div>
              </td>
              <td width="32%"> <%=hth%> </td>
              <td width="18%"> 
                <div align="right">���ʦ</div>
              </td>
              <td width="32%"> <%=sjs%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%"> 
                <div align="right">ǩԼ����</div>
              </td>
              <td width="32%"> <%=qyrq%> </td>
              <td width="18%"> 
                <div align="right">�ƻ���������</div>
              </td>
              <td width="32%"> <%=kgrq%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%"> 
                <div align="right">ʵ�ʿ�������</div>
              </td>
              <td width="32%"> <%=sjkgrq%> </td>
              <td width="18%"> 
                <div align="right">�ƻ���������</div>
              </td>
              <td width="32%"> <%=jgrq%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%"> 
                <div align="right">ʵ�ʿ�������</div>
              </td>
              <td width="32%"> <%=sjjgrq%> </td>
              <td width="18%"> 
                <div align="right">ǩԼ����</div>
              </td>
              <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%"> 
                <div align="right">ʩ����</div>
              </td>
              <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
              <td width="18%"> 
                <div align="right">�ʼ�</div>
              </td>
              <td width="32%"> <%=zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC">�ͻ����</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC">�����ֹ�˾</font></div>
              </td>
              <td width="32%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font>�걨��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="sbr" value="" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font>�걨ʱ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="sbsj" value="<%=cf.today()%>" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC">¼����</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC">¼��ʱ��</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC">¼�벿��</font></div>
              </td>
              <td width="32%">
                <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font>�������Ч��</div>
              </td>
              <td width="32%">
                <input type="text" name="ybjyxq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
              </td>
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.sbr)=="") {
		alert("������[�걨��]��");
		FormName.sbr.focus();
		return false;
	}
	if(	javaTrim(FormName.sbsj)=="") {
		alert("������[�걨ʱ��]��");
		FormName.sbsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sbsj, "�걨ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("������[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ybjyxq)=="") {
		alert("������[�������Ч��]��");
		FormName.ybjyxq.focus();
		return false;
	}
	if(!(isDatetime(FormName.ybjyxq, "�������Ч��"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
