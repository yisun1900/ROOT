<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dzbjzjmc=(String)session.getAttribute("dzbjzjmc");//���ӱ����м�����
String dzbjzgjmc=(String)session.getAttribute("dzbjzgjmc");//���ӱ����и߼�����
String dzbjgjmc=(String)session.getAttribute("dzbjgjmc");//���ӱ��۸߼�����

String dybjjb=(String)session.getAttribute("bjjb");
//**************************************************************************888
double zcf=0;//A�����ķ�
double rgf=0;//A���˹���
double jjf=0;//A����е��
double glfbl=0;//A������Ѱٷֱ�
double lrbl=0;//A������ٷֱ�
String zcmc=null;//A����������
String zcgg=null;//A�����Ĺ��

String zcjldwbm=null;
double bzcf=0;//�����ķ�
double brgf=0;//���˹���
double bjjf=0;//����е��
double bglfbl=0;//������Ѱٷֱ�
double blrbl=0;//������ٷֱ�
String bzcmc=null;//����������
String bzcgg=null;//�����Ĺ��

double czcf=0;//�����ķ�
double crgf=0;//���˹���
double cjjf=0;//����е��
double cglfbl=0;//������Ѱٷֱ�
double clrbl=0;//������ٷֱ�
String czcmc=null;//����������
String czcgg=null;//�����Ĺ��

//*******************************************************************************88
String dqbm=null;
String xmbh=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
double cbenj=0;
double sgdbj=0;
double bj=0;
double bbj=0;
double cbj=0;
String gycl=null;
String bgycl=null;
String cgycl=null;
String xh=null;

double clf=0;
double bclf=0;
double cclf=0;

String wybh=cf.GB2Uni(request.getParameter("wybh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zcjldwbm,dqbm,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,sgdbj,cbenj,bj,bbj,cbj,gycl,bgycl,cgycl,xh,clf,bclf,cclf,zcf,jjf,rgf,glfbl,lrbl,zcmc,zcgg,bzcf,bjjf,brgf,bglfbl,blrbl,bzcmc,bzcgg,czcf,cjjf,crgf,cglfbl,clrbl,czcmc,czcgg";
	ls_sql+=" from  bj_gzbjb";
	ls_sql+=" where  wybh='"+wybh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcjldwbm=cf.fillNull(rs.getString("zcjldwbm"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		xmbh=cf.fillNull(rs.getString("xmbh"));
		xmmc=cf.fillNull(rs.getString("xmmc"));
		xmdlbm=cf.fillNull(rs.getString("xmdlbm"));
		xmxlbm=cf.fillNull(rs.getString("xmxlbm"));
		smbm=cf.fillNull(rs.getString("smbm"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		sgdbj=rs.getDouble("sgdbj");
		cbenj=rs.getDouble("cbenj");
		bj=rs.getDouble("bj");
		bbj=rs.getDouble("bbj");
		cbj=rs.getDouble("cbj");
		gycl=cf.fillNull(rs.getString("gycl"));
		bgycl=cf.fillNull(rs.getString("bgycl"));
		cgycl=cf.fillNull(rs.getString("cgycl"));
		xh=cf.fillNull(rs.getString("xh"));
		clf=rs.getDouble("clf");
		bclf=rs.getDouble("bclf");
		cclf=rs.getDouble("cclf");


		zcf=rs.getDouble("zcf");
		jjf=rs.getDouble("jjf");
		rgf=rs.getDouble("rgf");
		glfbl=rs.getDouble("glfbl");
		lrbl=rs.getDouble("lrbl");
		zcmc=cf.fillNull(rs.getString("zcmc"));
		zcgg=cf.fillNull(rs.getString("zcgg"));

		bzcf=rs.getDouble("bzcf");
		bjjf=rs.getDouble("bjjf");
		brgf=rs.getDouble("brgf");
		bglfbl=rs.getDouble("bglfbl");
		blrbl=rs.getDouble("blrbl");
		bzcmc=cf.fillNull(rs.getString("bzcmc"));
		bzcgg=cf.fillNull(rs.getString("bzcgg"));

		czcf=rs.getDouble("czcf");
		cjjf=rs.getDouble("cjjf");
		crgf=rs.getDouble("crgf");
		cglfbl=rs.getDouble("cglfbl");
		clrbl=rs.getDouble("clrbl");
		czcmc=cf.fillNull(rs.getString("czcmc"));
		czcgg=cf.fillNull(rs.getString("czcgg"));


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
<%
String str1=cf.getItemData("select xmxlbm,xmxlmc,xmdlbm from bdm_xmxlbm order by xmdlbm,xmxlbm");
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
      <div align="center"> ���޸Ĺ�װ���۱�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditBj_jzbjb1.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" align="right">��Ŀ����</td>
              <td width="28%"> 
                <select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(xmdlbm,xmxlbm,<%=str1%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm",xmdlbm);
%> 
                </select>
              </td>
              <td width="22%" align="right">��ĿС��</td>
              <td width="28%"> 
                <select name="xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm where xmdlbm='"+xmdlbm+"' order by xmdlbm,xmxlbm",xmxlbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">��Ŀ���</div>
              </td>
              <td width="28%"> 
                <input type="text" name="xmbh" size="20" maxlength="16"  value="<%=xmbh%>" readonly>
				<input type="hidden" name="oldxmbh" value="<%=xmbh%>" >
              </td>
              <td width="22%"> 
                <div align="right">����</div>
              </td>
              <td width="28%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" align="right">��Ŀ����</td>
              <td colspan="3"> 
                <input type="text" name="xmmc" size="73" maxlength="100"  value="<%=xmmc%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">����</div>
              </td>
              <td width="28%"> 
                <select name="smbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm order by smbm",smbm);
%> 
                </select>
              </td>
              <td width="22%"> 
                <div align="right">������������λ</div>
              </td>
              <td width="28%"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm",jldwbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">�������</div>
              </td>
              <td width="28%"> 
                <input type="text" name="xh" value="<%=xh%>" size="20" maxlength="17" >
              </td>
        <td align="right">���ļ�����λ����</td>
              <td> 
                <select name="zcjldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cljldwbm,cljldwmc from bdm_cljldwbm order by cljldwbm","");
%> 
                </select>
              </td>
            </tr>
			<tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#E8E8FF" width="22%">�ɱ���</td>
              <td bgcolor="#E8E8FF" width="28%"> 
                <input type="text" name="cbenj" value="<%=cbenj%>" size="20" maxlength="17" >
              </td>
              <td align="right" bgcolor="#E8E8FF" width="23%">ʩ���ӱ���</td>
              <td bgcolor="#E8E8FF" width="27%"> 
                <input type="text" name="sgdbj" value="<%=sgdbj%>" size="20" maxlength="17" >
              </td>
            </tr>
            <%
	if (dybjjb.equals("A") || dybjjb.equals("B") || dybjjb.equals("D") )
	{
			%> 
            <tr bgcolor="#CCCCFF"> 
              <td height="22" align="right" width="22%"> <%=dzbjzjmc%>����</td>
              <td width="28%"> 
                <input type="text" name="bj" value="<%=bj%>" size="20" maxlength="17" >
              </td>
              <td width="23%"> 
                <div align="right"></div>
              </td>
              <td width="27%">&nbsp; </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td align="right" width="22%"><%=dzbjzjmc%>��������</td>
              <td width="28%"> 
                <input type="text" name="zcmc" value="<%=zcmc%>" size="20" maxlength="17" >
              </td>
              <td align="right" width="23%"><%=dzbjzjmc%>���Ĺ��</td>
              <td width="27%"> 
                <input type="text" name="zcgg" value="<%=zcgg%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td align="right" width="22%"><%=dzbjzjmc%>���ķ�</td>
              <td width="28%"> 
                <input type="text" name="zcf" value="<%=zcf%>" size="20" maxlength="17" >
              </td>
              <td width="23%"> 
                <div align="right"><%=dzbjzjmc%>���ķ�</div>
              </td>
              <td width="27%"> 
                <input type="text" name="clf" value="<%=clf%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td align="right" width="22%"><%=dzbjzjmc%>�˹���</td>
              <td width="28%" bgcolor="#CCCCFF"> 
                <input type="text" name="rgf" value="<%=rgf%>" size="20" maxlength="17" >
              </td>
              <td width="23%"> 
                <div align="right"><%=dzbjzjmc%>��е��</div>
              </td>
              <td width="27%"> 
                <input type="text" name="jjf" value="<%=jjf%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td align="right" width="22%"><%=dzbjzjmc%>����Ѱٷֱ�</td>
              <td width="28%"> 
                <input type="text" name="glfbl" value="<%=glfbl%>" size="20" maxlength="17" >
              </td>
              <td width="23%"> 
                <div align="right"><%=dzbjzjmc%>����ٷֱ�</div>
              </td>
              <td width="27%"> 
                <input type="text" name="lrbl" value="<%=lrbl%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="22%" align="right"><%=dzbjzjmc%>���ղ��ϼ��</td>
              <td colspan="3"> 
                <textarea name="gycl" cols="70" rows="8"><%=gycl%></textarea>
              </td>
            </tr>
            <%
	}
	if (dybjjb.equals("B") || dybjjb.equals("D") || dybjjb.equals("E"))
	{
			%> 
            <tr bgcolor="#FF99CC"> 
              <td align="right" width="22%"><%=dzbjzgjmc%>����</td>
              <td width="28%"> 
                <input type="text" name="bbj" value="<%=bbj%>" size="20" maxlength="17" >
              </td>
              <td align="right" width="23%">&nbsp;</td>
              <td width="27%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FF99CC"> 
              <td align="right" width="22%"><%=dzbjzgjmc%>��������</td>
              <td width="28%"> 
                <input type="text" name="bzcmc" value="<%=bzcmc%>" size="20" maxlength="17" >
              </td>
              <td align="right" width="23%"><%=dzbjzgjmc%>���Ĺ��</td>
              <td width="27%"> 
                <input type="text" name="bzcgg" value="<%=bzcgg%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FF99CC"> 
              <td align="right" width="22%"><%=dzbjzgjmc%>���ķ�</td>
              <td width="28%"> 
                <input type="text" name="bzcf" value="<%=bzcf%>" size="20" maxlength="17" >
              </td>
              <td width="23%"> 
                <div align="right"><%=dzbjzgjmc%>���ķ�</div>
              </td>
              <td width="27%"> 
                <input type="text" name="bclf" value="<%=bclf%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FF99CC"> 
              <td align="right" width="22%"><%=dzbjzgjmc%>�˹���</td>
              <td width="28%"> 
                <input type="text" name="brgf" value="<%=brgf%>" size="20" maxlength="17" >
              </td>
              <td width="23%"> 
                <div align="right"><%=dzbjzgjmc%>��е��</div>
              </td>
              <td width="27%"> 
                <input type="text" name="bjjf" value="<%=bjjf%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FF99CC"> 
              <td align="right" width="22%"><%=dzbjzgjmc%>����Ѱٷֱ�</td>
              <td width="28%" bgcolor="#FF99CC"> 
                <input type="text" name="bglfbl" value="<%=bglfbl%>" size="20" maxlength="17" >
              </td>
              <td width="23%"> 
                <div align="right"><%=dzbjzgjmc%>����ٷֱ�</div>
              </td>
              <td width="27%"> 
                <input type="text" name="blrbl" value="<%=blrbl%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FF99CC"> 
              <td width="22%" align="right"><%=dzbjzgjmc%>���ղ��ϼ��</td>
              <td colspan="3"> 
                <textarea name="bgycl" cols="70" rows="8"><%=bgycl%></textarea>
              </td>
            </tr>
            <%
	}
	if (dybjjb.equals("C") || dybjjb.equals("D") || dybjjb.equals("E") )
	{
			%> 
           <tr bgcolor="#CCFFCC"> 
              <td align="right" width="22%"><%=dzbjgjmc%>����</td>
              <td width="28%"> 
                <input type="text" name="cbj" value="<%=cbj%>" size="20" maxlength="17" >
              </td>
              <td align="right" width="23%">&nbsp;</td>
              <td width="27%">&nbsp; </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td align="right" width="22%"><%=dzbjgjmc%>��������</td>
              <td width="28%"> 
                <input type="text" name="czcmc" value="<%=czcmc%>" size="20" maxlength="17" >
              </td>
              <td align="right" width="23%"><%=dzbjgjmc%>���Ĺ��</td>
              <td width="27%"> 
                <input type="text" name="czcgg" value="<%=czcgg%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td align="right" width="22%"><%=dzbjgjmc%>���ķ�</td>
              <td width="28%"> 
                <input type="text" name="czcf" value="<%=czcf%>" size="20" maxlength="17" >
              </td>
              <td width="23%"> 
                <div align="right"><%=dzbjgjmc%>���ķ�</div>
              </td>
              <td width="27%"> 
                <input type="text" name="cclf" value="<%=cclf%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td align="right" width="22%"><%=dzbjgjmc%>�˹���</td>
              <td width="28%"> 
                <input type="text" name="crgf" value="<%=crgf%>" size="20" maxlength="17" >
              </td>
              <td width="23%"> 
                <div align="right"><%=dzbjgjmc%>��е��</div>
              </td>
              <td width="27%"> 
                <input type="text" name="cjjf" value="<%=cjjf%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td align="right" width="22%"><%=dzbjgjmc%>����Ѱٷֱ�</td>
              <td width="28%" bgcolor="#CCFFCC"> 
                <input type="text" name="cglfbl" value="<%=cglfbl%>" size="20" maxlength="17" >
              </td>
              <td width="23%"> 
                <div align="right"><%=dzbjgjmc%>����ٷֱ�</div>
              </td>
              <td width="27%"> 
                <input type="text" name="clrbl" value="<%=clrbl%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="22%" align="right"><%=dzbjgjmc%>���ղ��ϼ��</td>
              <td colspan="3"> 
                <textarea name="cgycl" cols="70" rows="8"><%=cgycl%></textarea>
              </td>
            </tr>
            <%
	}
%> 
            <input type="hidden" name="wybh"  value="<%=wybh%>" >
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                </div>
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
	
	if(	javaTrim(FormName.xmdlbm)=="") {
		alert("��ѡ��[��Ŀ����]��");
		FormName.xmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmxlbm)=="") {
		alert("��ѡ��[��ĿС��]��");
		FormName.xmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("������[��Ŀ���]��");
		FormName.xmbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xmmc)=="") {
		alert("������[��Ŀ����]��");
		FormName.xmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("��ѡ��[������λ]��");
		FormName.jldwbm.focus();
		return false;
	}
<%
	if (dybjjb.equals("A") || dybjjb.equals("B") || dybjjb.equals("D") )
	{
		%>
		if(	javaTrim(FormName.bj)=="") {
			alert("������[<%=dzbjzjmc%>����]��");
			FormName.bj.focus();
			return false;
		}
		if(!(isFloat(FormName.bj, "<%=dzbjzjmc%>����"))) {
			return false;
		}
		<%
	}
	if (dybjjb.equals("B") || dybjjb.equals("D"))
	{
		%>
		if(	javaTrim(FormName.bbj)=="") {
			alert("������[<%=dzbjzgjmc%>����]��");
			FormName.bbj.focus();
			return false;
		}
		if(!(isFloat(FormName.bbj, "<%=dzbjzgjmc%>����"))) {
			return false;
		}
		<%
	}
	if (dybjjb.equals("C") || dybjjb.equals("D") )
	{
		%>
		if(	javaTrim(FormName.cbj)=="") {
			alert("������[<%=dzbjgjmc%>����]��");
			FormName.cbj.focus();
			return false;
		}
		if(!(isFloat(FormName.cbj, "<%=dzbjgjmc%>����"))) {
			return false;
		}
		<%
	}
%>
	if(!(isInt(FormName.xh, "���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
