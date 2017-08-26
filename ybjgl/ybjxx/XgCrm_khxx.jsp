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
String czbm=null;
String ysbm=null;
String ybjbz=null;
String ybjyxq=null;
String ybjdjsj=null;

String sjs=null;
String sgd=null;
String zjxm=null;
String dwbh=null;
String sjkgrq=null;
String sjjgrq=null;

String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select khbh,khxm,fwdz,lxfs,hxbm,fgflbm,zxjwbm,hxmjbm,czbm,ysbm,ybjbz,ybjyxq,ybjdjsj,sjs,sgd,zjxm,dwbh,sjkgrq,sjjgrq ";
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
		czbm=cf.fillNull(rs.getString("czbm"));
		ysbm=cf.fillNull(rs.getString("ysbm"));
		ybjbz=cf.fillNull(rs.getString("ybjbz"));
		ybjyxq=cf.fillNull(rs.getDate("ybjyxq"));
		ybjdjsj=cf.fillNull(rs.getDate("ybjdjsj"));

		sjs=cf.fillNull(rs.getString("sjs"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
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
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center">�޸��������Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveXgCrm_khxx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right"><font color="#0000CC">�ͻ����</font></div>
              </td>
              <td width="31%"> <font color="#0000CC"> <%=khbh%> </font></td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">�ͻ�����</font></div>
              </td>
              <td width="33%"> <font color="#0000CC"> <%=khxm%> </font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right"><font color="#0000CC">���ݵ�ַ</font></div>
              </td>
              <td width="31%"> <font color="#0000CC"> <%=fwdz%> </font></td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">��ϵ��ʽ</font></div>
              </td>
              <td width="33%"> <font color="#0000CC"> <%=lxfs%> </font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">���ʦ</font></td>
              <td width="31%"><font color="#0000CC"><%=sjs%></font></td>
              <td width="17%" align="right"><font color="#0000CC">�ʼ�����</font></td>
              <td width="33%"><font color="#0000CC"><%=zjxm%></font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">ʩ����</font></td>
              <td width="31%"><font color="#0000CC"><%
	cf.selectItem(out,"select dwbh,dwmc||'('||dwdh||')' from sq_dwxx where dwbh='"+sgd+"'",sgd,true);
%></font></td>
              <td width="17%" align="right"><font color="#0000CC">ǩԼ����</font></td>
              <td width="33%"><font color="#0000CC"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('0','1','2') order by dwbh",dwbh,true);
%></font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">ʵ�ʿ�������</font></td>
              <td width="31%"><font color="#0000CC"><%=sjkgrq%></font></td>
              <td width="17%" align="right"><font color="#0000CC">ʵ�ʿ�������</font></td>
              <td width="33%"><font color="#0000CC"><%=sjjgrq%></font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">����</div>
              </td>
              <td width="31%"> 
                <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm);
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">������</div>
              </td>
              <td width="33%"> 
                <select name="fgflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",fgflbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">װ�޼�λ</div>
              </td>
              <td width="31%"> 
                <select name="zxjwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm",zxjwbm);
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">���</div>
              </td>
              <td width="33%"> 
                <select name="hxmjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxmjbm,hxmjmc from dm_hxmjbm order by hxmjbm",hxmjbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">��ɫ</div>
              </td>
              <td width="31%"> 
                <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm",ysbm);
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">����</div>
              </td>
              <td width="33%">
                <select name="czbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select czbm,czmc from dm_czbm order by czbm",czbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�����Ǽ�ʱ��</div>
              </td>
              <td width="31%"> 
                <input type="text" name="ybjdjsj" size="20" maxlength="10"  value="<%=ybjdjsj%>" ondblclick="JSCalendar(this)">
              </td>
              <td width="17%"> 
                <div align="right">�������Ч��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="ybjyxq" size="20" maxlength="10"  value="<%=ybjyxq%>" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
            <tr> 
              <td width="19%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="31%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                </div>
              </td>
              <td width="17%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="33%" height="2"> 
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
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
	if(	javaTrim(FormName.czbm)=="") {
		alert("������[����]��");
		FormName.czbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hxmjbm)=="") {
		alert("������[�������]��");
		FormName.hxmjbm.focus();
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
	if(	javaTrim(FormName.ybjdjsj)=="") {
		alert("������[�����Ǽ�ʱ��]��");
		FormName.ybjdjsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.ybjdjsj, "�����Ǽ�ʱ��"))) {
		return false;
	}

	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
