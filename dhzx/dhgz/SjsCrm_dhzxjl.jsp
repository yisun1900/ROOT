<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String khxm=null;
String xb=null;
String lxdh=null;
String fwdz=null;
String hxmj=null;
String jfrq=null;
String zxlxbm=null;
String zxnr=null;
String sfxhf=null;
String hfrq=null;
String zxsj=null;
String slr=null;
String sjs=null;
String sjssj=null;
String clfs=null;
String zxjg=null;
String wherezxjlh=cf.GB2Uni(request.getParameter("zxjlh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select khbh,khxm,xb,lxdh,fwdz,hxmj,jfrq,zxlxbm,zxnr,sfxhf,hfrq,zxsj,slr,sjs,sjssj,clfs,zxjg ";
	ls_sql+=" from  crm_dhzxjl";
	ls_sql+=" where  (zxjlh="+wherezxjlh+")  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		lxdh=cf.fillNull(rs.getString("lxdh"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hxmj=cf.fillNull(rs.getString("hxmj"));
		jfrq=cf.fillNull(rs.getDate("jfrq"));
		zxlxbm=cf.fillNull(rs.getString("zxlxbm"));
		zxnr=cf.fillNull(rs.getString("zxnr"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfrq=cf.fillNull(rs.getDate("hfrq"));
		zxsj=cf.fillNull(rs.getDate("zxsj"));
		slr=cf.fillNull(rs.getString("slr"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sjssj=cf.fillNull(rs.getDate("sjssj"));
		clfs=cf.fillNull(rs.getString("clfs"));
		zxjg=cf.fillNull(rs.getString("zxjg"));
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
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
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���ʦ��ѯ��Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveSjsCrm_dhzxjl.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">�ͻ����</font></div>
              </td>
              <td width="35%"> <font color="#0000CC"> 
                <input type="text" name="khbh" size="20" maxlength="7"  value="<%=khbh%>" >
                </font></td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">��ѯ����</font></div>
              </td>
              <td width="35%"> <font color="#0000CC"> 
                <select name="zxlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxlxbm,zxlxmc from dm_zxlxbm order by zxlxbm",zxlxbm);
%> 
                </select>
                </font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">�ͻ�����</font></div>
              </td>
              <td width="35%"> <font color="#0000CC"> 
                <input type="text" name="khxm" size="20" maxlength="20"  value="<%=khxm%>" >
                </font></td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">�Ա�</font></div>
              </td>
              <td width="35%"><font color="#0000CC"><%
	cf.radioToken(out, "xb","1+��&2+Ů",xb);
%> </font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">��ϵ�绰</font></div>
              </td>
              <td width="35%"> <font color="#0000CC"> 
                <input type="text" name="lxdh" size="20" maxlength="20"  value="<%=lxdh%>" >
                </font></td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">���ݵ�ַ</font></div>
              </td>
              <td width="35%"> <font color="#0000CC"> 
                <input type="text" name="fwdz" size="20" maxlength="100"  value="<%=fwdz%>" >
                </font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">�������</font></div>
              </td>
              <td width="35%"> <font color="#0000CC"> 
                <input type="text" name="hxmj" size="20" maxlength="8"  value="<%=hxmj%>" >
                </font></td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">��������</font></div>
              </td>
              <td width="35%"> <font color="#0000CC"> 
                <input type="text" name="jfrq" size="20" maxlength="10"  value="<%=jfrq%>" >
                </font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">�绰������</font></div>
              </td>
              <td width="35%"> <font color="#0000CC"> 
                <input type="text" name="slr" size="20" maxlength="16"  value="<%=slr%>" >
                </font></td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">�绰��ѯʱ��</font></div>
              </td>
              <td width="35%"> <font color="#0000CC"> 
                <input type="text" name="zxsj" size="20" maxlength="10"  value="<%=zxsj%>" >
                </font></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="15%"> 
                <div align="right">��ѯ���ʦ</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sjs" size="20" maxlength="20"  value="<%=sjs%>" >
              </td>
              <td width="15%"> 
                <div align="right">���ʦ��ѯʱ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sjssj" size="20" maxlength="10"  value="<%=cf.today()%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="15%"> 
                <div align="right">�Ƿ���ط�</div>
              </td>
              <td width="35%"><%
	cf.radioToken(out, "sfxhf","Y+��Ҫ&N+����Ҫ",sfxhf);
%> </td>
              <td width="15%"> 
                <div align="right">�ط�����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="hfrq" size="20" maxlength="10"  value="<%=hfrq%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="15%"> 
                <div align="right">����ʽ</div>
              </td>
              <td width="35%"> 
                <select name="clfs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+���账��&1+�����������&2+�������ʦ&3+����",clfs);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right"></div>
              </td>
              <td width="35%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�绰��ѯ����</div>
              </td>
              <td colspan="3"> 
                <textarea name="zxnr" cols="55" rows="3"><%=zxnr%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherezxjlh"  value="<%=wherezxjlh%>" >
            <tr> 
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                </div>
              </td>
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <input type="reset"  value="����">
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	!radioChecked(FormName.sfxhf)) {
		alert("��ѡ��[�Ƿ���ط�]��");
		FormName.sfxhf[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.hfrq, "�ط�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.zxsj, "�绰��ѯʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjssj, "���ʦ��ѯʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.clfs)=="") {
		alert("��ѡ��[����ʽ]��");
		FormName.clfs.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
