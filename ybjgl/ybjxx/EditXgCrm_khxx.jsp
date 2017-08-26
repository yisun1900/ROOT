<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String hxbm=null;
String fgflbm=null;
String zxjwbm=null;
String hxmjbm=null;
String ysbm=null;
String ybjbz=null;
String ybjyxq=null;
String ybjdjsj=null;
String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select khbh,khxm,fwdz,lxfs,hxbm,fgflbm,zxjwbm,hxmjbm,ysbm,ybjbz,ybjyxq,ybjdjsj ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fgflbm=cf.fillNull(rs.getString("fgflbm"));
		zxjwbm=cf.fillNull(rs.getString("zxjwbm"));
		hxmjbm=cf.fillNull(rs.getString("hxmjbm"));
		ysbm=cf.fillNull(rs.getString("ysbm"));
		ybjbz=cf.fillNull(rs.getString("ybjbz"));
		ybjyxq=cf.fillNull(rs.getDate("ybjyxq"));
		ybjdjsj=cf.fillNull(rs.getDate("ybjdjsj"));
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
<title>�����Ǽ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �����Ǽ�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditCrm_khxx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">�ͻ����</font></div>
              </td>
              <td width="33%"> <font color="#0000CC"> 
                <input type="text" name="khbh" size="20" maxlength="7"  value="<%=khbh%>" >
                </font></td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">�ͻ�����</font></div>
              </td>
              <td width="32%"> <font color="#0000CC"> 
                <input type="text" name="khxm" size="20" maxlength="50"  value="<%=khxm%>" >
                </font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">���ݵ�ַ</font></div>
              </td>
              <td width="33%"> <font color="#0000CC"> 
                <input type="text" name="fwdz" size="20" maxlength="100"  value="<%=fwdz%>" >
                </font></td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">��ϵ��ʽ</font></div>
              </td>
              <td width="32%"> <font color="#0000CC"> 
                <input type="text" name="lxfs" size="20" maxlength="50"  value="<%=lxfs%>" >
                </font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">����</div>
              </td>
              <td width="33%"> 
                <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm);
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">������</div>
              </td>
              <td width="32%"> 
                <select name="fgflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",fgflbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">װ�޼�λ</div>
              </td>
              <td width="33%"> 
                <select name="zxjwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm",zxjwbm);
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">���</div>
              </td>
              <td width="32%"> 
                <select name="hxmjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxmjbm,hxmjmc from dm_hxmjbm order by hxmjbm",hxmjbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">��ɫ</div>
              </td>
              <td width="33%"> 
                <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm",ysbm);
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">������־</div>
              </td>
              <td width="32%"> 
                  <%
	cf.radioToken(out,"ybjbz","Y+��&N+��",ybjbz);
%> 
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">�������Ч��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="ybjyxq" size="20" maxlength="10"  value="<%=ybjyxq%>" >
              </td>
              <td width="18%"> 
                <div align="right">�����Ǽ�ʱ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="ybjdjsj" size="20" maxlength="10"  value="<%=ybjdjsj%>" >
              </td>
            </tr>
            <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
            <tr> 
              <td width="17%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="33%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                </div>
              </td>
              <td width="18%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="32%" height="2"> 
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khxm)=="") {
		alert("������[�ͻ�����]��");
		FormName.khxm.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("������[���ݵ�ַ]��");
		FormName.fwdz.focus();
		return false;
	}
	if(	javaTrim(FormName.lxfs)=="") {
		alert("������[��ϵ��ʽ]��");
		FormName.lxfs.focus();
		return false;
	}

	if(	javaTrim(FormName.hxbm)=="") {
		alert("������[����]��");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fgflbm)=="") {
		alert("������[������]��");
		FormName.fgflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zxjwbm)=="") {
		alert("������[װ�޼�λ]��");
		FormName.zxjwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ysbm)=="") {
		alert("������[��ɫ]��");
		FormName.ysbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hxmjbm)=="") {
		alert("������[�������]��");
		FormName.hxmjbm.focus();
		return false;
	}
	

	if (FormName.ybjbz[0].checked)
	{
		if(	javaTrim(FormName.ybjyxq)=="") {
			alert("������[�������Ч��]��");
			FormName.ybjyxq.focus();
			return false;
		}
		if(!(isDatetime(FormName.ybjyxq, "�������Ч��"))) {
			return false;
		}
		if(	javaTrim(FormName.ybjdjsj)=="") {
			alert("������[�����Ǽ�ʱ��]��");
			FormName.ybjdjsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.ybjdjsj, "�����Ǽ�ʱ��"))) {
			return false;
		}
	}

	if (FormName.ybjbz[1].checked)
	{
		if ( !confirm("���ѣ��˷��䲻������䣬ȷʵҪ������?") )	
		{
			return;
		}
	}

	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
