<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
%>
<%
String lrr=(String)session.getAttribute("yhmc");

String sqxh=null;
String dwbh=null;
String sqrq=null;
String ycsj=null;
String ycsj1=null;
String ycsj2=null;

String mdd=null;
String ycsy=null;
String sqr=null;
String lxfs=null;
String fhsj=null;
String fhsj1=null;
String fhsj2=null;
String gls=null;
String bz=null;
String sjxm=null;
String qcph=null;
String pzr=null;
String pzsj=null;
String wheresqxh=cf.GB2Uni(request.getParameter("sqxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sqxh,dwbh,sqrq,ycsj,mdd,ycsy,sqr,lxfs,gls,fhsj,bz,qcph,pzr,pzsj,sjxm ";
	ls_sql+=" from  xz_pcsq";
	ls_sql+=" where  (sqxh='"+wheresqxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sqxh=cf.fillNull(rs.getString("sqxh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sqrq=cf.fillNull(rs.getDate("sqrq"));
		ycsj=cf.fillNull(rs.getString("ycsj"));
		mdd=cf.fillNull(rs.getString("mdd"));
		ycsy=cf.fillNull(rs.getString("ycsy"));
		sqr=cf.fillNull(rs.getString("sqr"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		gls=cf.fillNull(rs.getString("gls"));
		fhsj=cf.fillNull(rs.getString("fhsj"));
		bz=cf.fillNull(rs.getString("bz"));
		qcph=cf.fillNull(rs.getString("qcph"));
		pzr=cf.fillNull(rs.getString("pzr"));
		pzsj=cf.fillNull(rs.getDate("pzsj"));
		sjxm=cf.fillNull(rs.getString("sjxm"));

		ycsj1=ycsj.substring(11,13);
		ycsj2=ycsj.substring(14,16);
		fhsj1=fhsj.substring(11,13);
		fhsj2=fhsj.substring(14,16);

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

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">�ɳ����룭ά��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditXz_pcsq.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <span class="STYLE1">*</span>���벿��              </td>
              <td width="32%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx  where dwbh='"+dwbh+"'","");
%> 
                </select>              </td>
              <td width="18%" align="right"> 
                <span class="STYLE1">*</span>��������              </td>
              <td width="32%"> 
              <input type="text" name="sqrq" size="20" maxlength="10"  value="<%=sqrq%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <span class="STYLE1">*</span>������              </td>
              <td width="32%"> 
                <input type="text" name="sqr" size="20" maxlength="8"  value="<%=sqr%>" >              </td>
              <td width="18%" align="right"> 
                <span class="STYLE1">*</span>��ϵ��ʽ              </td>
              <td width="32%"> 
              <input type="text" name="lxfs" size="20" maxlength="8"  value="<%=lxfs%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <span class="STYLE1">*</span>�ó�����              </td>
              <td colspan="3"> 
                <textarea name="ycsy" cols="71" rows="3" ><%=ycsy%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
              <p align="right"><span class="STYLE1">*</span>Ŀ�ĵ�</p>              </td>
              <td width="32%"> 
                <input type="text" name="mdd" size="20" maxlength="20"  value="<%=mdd%>" >              </td>
              <td width="18%"> 
              <p align="right">������</p>              </td>
              <td width="32%"> 
              <input type="text" name="gls" size="20" maxlength="8"  value="<%=gls%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><span class="STYLE1">*</span>�ó�ʱ��</td>
              <td colspan="3"> ���ڣ� 
                <input type="text" name="ycsj" size="10" maxlength="10"  value="<%=ycsj.substring(0,10)%>" onDblClick="JSCalendar(this)">
                Сʱ��
                <select name="ycsj1" style="FONT-SIZE:12PX;WIDTH:52PX">
                  <option value=""></option>
<%
	cf.selectToken(out,"08+8ʱ&09+9ʱ&10+10ʱ&11+11ʱ&12+12ʱ&13+13ʱ&14+14ʱ&15+15ʱ&16+16ʱ&17+17ʱ&18+18ʱ&19+19ʱ&20+20ʱ&21+21ʱ&22+22ʱ&23+24ʱ&0+0ʱ&1+1ʱ&2+2ʱ&3+3ʱ&4+4ʱ&5+5ʱ&6+6ʱ&7+7ʱ",ycsj1);
%>
                </select> 
                
                ���ӣ�
                <select name="ycsj2" style="FONT-SIZE:12PX;WIDTH:52PX">
                  <option value=""></option>
<%
	cf.selectToken(out,"10+10��&20+20��&30+30��&40+40��&50+50��",ycsj2);
%>
                </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
              <p align="right"><span class="STYLE1">*</span>����ʱ��              </td>
              <td colspan="3"> ���ڣ� 
                <input type="text" name="fhsj" size="10" maxlength="10"  value="<%=fhsj.substring(0,10)%>" onDblClick="JSCalendar(this)">
                Сʱ��
                <select name="fhsj1" style="FONT-SIZE:12PX;WIDTH:52PX">
                  <option value=""></option>
<%
	cf.selectToken(out,"08+8ʱ&09+9ʱ&10+10ʱ&11+11ʱ&12+12ʱ&13+13ʱ&14+14ʱ&15+15ʱ&16+16ʱ&17+17ʱ&18+18ʱ&19+19ʱ&20+20ʱ&21+21ʱ&22+22ʱ&23+24ʱ&0+0ʱ&1+1ʱ&2+2ʱ&3+3ʱ&4+4ʱ&5+5ʱ&6+6ʱ&7+7ʱ",fhsj1);
%>
                </select> 
                
                ���ӣ�
                <select name="fhsj2" style="FONT-SIZE:12PX;WIDTH:52PX">
                  <option value=""></option>
 <%
	cf.selectToken(out,"10+10��&20+20��&30+30��&40+40��&50+50��",fhsj2);
%>
                </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%"><font color="#0000FF">¼����</font></td>
              <td width="32%"> 
                <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>              </td>
              <td align="right" width="18%"><font color="#0000FF">¼��ʱ��</font></td>
              <td width="32%"> 
              <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                 
            <input type="hidden" name="wheresqxh"  value="<%=wheresqxh%>" >
                  <input type="button"  value="����" onClick="f_do(editform)">
               
              <input type="reset"  value="����"></td>
            </tr>
        </table>
</form>

	  
	  
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
	
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[���벿��]��");
		FormName.dwbh.focus();
		return false;
	}
		if(	javaTrim(FormName.sqr)=="") {
		alert("������[������]��");
		FormName.sqr.focus();
		return false;
	}
	if(	javaTrim(FormName.mdd)=="") {
		alert("������[Ŀ�ĵ�]��");
		FormName.mdd.focus();
		return false;
	}
	if(	javaTrim(FormName.lxfs)=="") {
		alert("������[��ϵ��ʽ]��");
		FormName.lxfs.focus();
		return false;
	}
	if(	javaTrim(FormName.ycsy)=="") {
		alert("������[�ó����� ]��");
		FormName.ycsy.focus();
		return false;
	}

	if(	javaTrim(FormName.sqrq)=="") {
		alert("������[��������]��");
		FormName.sqrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqrq, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.mdd)=="") {
		alert("������[Ŀ�ĵ�]��");
		FormName.mdd.focus();
		return false;
	}

	if(	javaTrim(FormName.ycsj)=="") {
		alert("������[�ó�����]��");
		FormName.ycsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.ycsj, "�ó�����"))) {
		return false;
	}
 	if(	javaTrim(FormName.ycsj1)=="") {
		alert("������[�ó�Сʱ]��");
		FormName.ycsj1.focus();
		return false;
	}
 	if(	javaTrim(FormName.ycsj2)=="") {
		alert("������[�ó�����]��");
		FormName.ycsj2.focus();
		return false;
	}


	if(	javaTrim(FormName.fhsj)=="") {
		alert("������[����ʱ��]��");
		FormName.fhsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fhsj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.fhsj1)=="") {
		alert("������[����Сʱ]��");
		FormName.fhsj1.focus();
		return false;
	}
	if(	javaTrim(FormName.fhsj2)=="") {
		alert("������[���ط���]��");
		FormName.fhsj2.focus();
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
	if(!(isFloat(FormName.gls, "������"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
